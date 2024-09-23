@implementation REMDAChangeTrackingHelper

- (REMDAChangeTrackingHelper)initWithREMDAAccount:(id)a3 clientName:(id)a4 withREMStore:(id)a5
{
  return -[REMDAChangeTrackingHelper initWithREMDAAccount:clientName:withREMStore:entityNames:](self, "initWithREMDAAccount:clientName:withREMStore:entityNames:", a3, a4, a5, 0);
}

- (REMDAChangeTrackingHelper)initWithREMDAAccount:(id)a3 clientName:(id)a4 withREMStore:(id)a5 entityNames:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  REMDAChangeTrackingHelper *v15;
  REMChangeTracking *v16;
  REMChangeTracking *changeTracking;
  REMDAChangeTrackingHelper *v18;
  NSObject *v19;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[REMDAChangeTrackingHelper initWithREMDAAccount:clientName:withREMStore:entityNames:].cold.1();
    goto LABEL_12;
  }
  if (!v13)
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[REMDAChangeTrackingHelper initWithREMDAAccount:clientName:withREMStore:entityNames:].cold.2(self, v19);
    goto LABEL_12;
  }
  v21.receiver = self;
  v21.super_class = (Class)REMDAChangeTrackingHelper;
  v15 = -[REMDAChangeTrackingHelper init](&v21, sel_init);
  self = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_account, a3);
    objc_storeStrong((id *)&self->_remStore, a5);
    objc_storeStrong((id *)&self->_clientName, a4);
    objc_storeStrong((id *)&self->_entityNames, a6);
    -[REMDAChangeTrackingHelper _rem_changeTracking:](self, "_rem_changeTracking:", v12);
    v16 = (REMChangeTracking *)objc_claimAutoreleasedReturnValue();
    changeTracking = self->_changeTracking;
    self->_changeTracking = v16;

    -[REMChangeTracking setEntityNames:](self->_changeTracking, "setEntityNames:", v14);
    if (!self->_changeTracking)
    {
      +[REMLog changeTracking](REMLog, "changeTracking");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[REMDAChangeTrackingHelper initWithREMDAAccount:clientName:withREMStore:entityNames:].cold.3(self, v19);
LABEL_12:

      v18 = 0;
      goto LABEL_13;
    }
  }
  self = self;
  v18 = self;
LABEL_13:

  return v18;
}

- (id)currentChangeTokenWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v9;
  id v10;

  -[REMDAChangeTrackingHelper cached_currentChangeToken](self, "cached_currentChangeToken");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[REMDAChangeTrackingHelper changeTracking](self, "changeTracking");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v9, "currentChangeTokenWithError:", &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;

    -[REMDAChangeTrackingHelper setCached_currentChangeToken:](self, "setCached_currentChangeToken:", v6);
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = (void *)v5;
  v7 = 0;
  if (a3)
LABEL_3:
    *a3 = objc_retainAutorelease(v7);
LABEL_4:

  return v6;
}

- (id)fetchAndInitializeChangeTrackingStateIfNeeded
{
  void *v3;
  void *v4;
  REMChangeTrackingState *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  REMChangeTrackingState *v9;
  void *v10;
  id v11;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[REMDAChangeTrackingHelper changeTracking](self, "changeTracking");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "changeTrackingClientID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMDAChangeTrackingHelper cached_currentTrackingState](self, "cached_currentTrackingState");
  v5 = (REMChangeTrackingState *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
LABEL_2:
    +[REMLog changeTracking](REMLog, "changeTracking");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[REMChangeTrackingState lastConsumedChangeToken](v5, "lastConsumedChangeToken");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMChangeTrackingState lastConsumedDate](v5, "lastConsumedDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v4;
      v23 = 2114;
      v24 = v7;
      v25 = 2114;
      v26 = v8;
      _os_log_impl(&dword_1B4A39000, v6, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: Found and fetched change tracking state for {clientID: %{public}@, lastSyncToken: %{public}@, lastSyncDate: %{public}@}", buf, 0x20u);

    }
    goto LABEL_4;
  }
  -[REMDAChangeTrackingHelper changeTracking](self, "changeTracking");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v10, "getTrackingStateWithError:", &v20);
  v5 = (REMChangeTrackingState *)objc_claimAutoreleasedReturnValue();
  v11 = v20;

  if (v11)
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[REMDAChangeTrackingHelper fetchAndInitializeChangeTrackingStateIfNeeded].cold.3();
    goto LABEL_11;
  }
  if (v5)
    goto LABEL_2;
  v5 = objc_alloc_init(REMChangeTrackingState);
  v19 = 0;
  -[REMDAChangeTrackingHelper currentChangeTokenWithError:](self, "currentChangeTokenWithError:", &v19);
  v6 = objc_claimAutoreleasedReturnValue();
  v13 = v19;
  v11 = v13;
  if (!v6 || v13)
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[REMDAChangeTrackingHelper fetchAndInitializeChangeTrackingStateIfNeeded].cold.1();
    goto LABEL_24;
  }
  -[REMChangeTrackingState setLastConsumedChangeToken:](v5, "setLastConsumedChangeToken:", v6);
  +[REMLog changeTracking](REMLog, "changeTracking");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[REMChangeTrackingState lastConsumedChangeToken](v5, "lastConsumedChangeToken");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v4;
    v23 = 2114;
    v24 = v15;
    _os_log_impl(&dword_1B4A39000, v14, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: Initializing a change tracking state for {clientID: %{public}@, nowToken: %{public}@}", buf, 0x16u);

  }
  -[REMDAChangeTrackingHelper changeTracking](self, "changeTracking");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v16, "saveTrackingState:error:", v5, &v18);
  v11 = v18;

  if (v11)
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[REMDAChangeTrackingHelper fetchAndInitializeChangeTrackingStateIfNeeded].cold.2();
LABEL_24:

LABEL_11:
LABEL_12:
    v5 = objc_alloc_init(REMChangeTrackingState);
    return v5;
  }
LABEL_4:

  -[REMDAChangeTrackingHelper cached_currentTrackingState](self, "cached_currentTrackingState");
  v9 = (REMChangeTrackingState *)objc_claimAutoreleasedReturnValue();

  if (v9 != v5)
    -[REMDAChangeTrackingHelper setCached_currentTrackingState:](self, "setCached_currentTrackingState:", v5);

  if (!v5)
    goto LABEL_12;
  return v5;
}

- (BOOL)compareCurrentChangeTokenToLastConsumedWithResult:(int64_t *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  int64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[REMDAChangeTrackingHelper changeTracking](self, "changeTracking");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changeTrackingClientID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMDAChangeTrackingHelper upToToken](self, "upToToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    || (-[REMDAChangeTrackingHelper fetchAndInitializeChangeTrackingStateIfNeeded](self, "fetchAndInitializeChangeTrackingStateIfNeeded"), v10 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v10, "lastConsumedChangeToken"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v10, v9))
  {
    v20 = 0;
    -[REMDAChangeTrackingHelper currentChangeTokenWithError:](self, "currentChangeTokenWithError:", &v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v20;
    v13 = v12;
    if (!v11 || v12)
    {
      +[REMLog changeTracking](REMLog, "changeTracking");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[REMDAChangeTrackingHelper compareCurrentChangeTokenToLastConsumedWithResult:error:].cold.2();
      v14 = 0;
    }
    else
    {
      v19 = 0;
      v14 = objc_msgSend(v11, "compareToken:error:", v9, &v19);
      v13 = v19;
      +[REMLog changeTracking](REMLog, "changeTracking");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        v22 = v8;
        v23 = 2114;
        v24 = v11;
        v25 = 2114;
        v26 = v9;
        _os_log_impl(&dword_1B4A39000, v15, OS_LOG_TYPE_INFO, "REMDAChangeTrackingHelper: compareCurrentChangeTokenToLastConsumedWithError: comparing current token vs last consumed: {clientID: %{public}@, current: %{public}@, lastConsumed: %{public}@}", buf, 0x20u);
      }

      if (v14 && !v13)
        goto LABEL_15;
      +[REMLog changeTracking](REMLog, "changeTracking");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[REMDAChangeTrackingHelper compareCurrentChangeTokenToLastConsumedWithResult:error:].cold.3();
    }

LABEL_15:
    goto LABEL_16;
  }
  +[REMLog changeTracking](REMLog, "changeTracking");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[REMDAChangeTrackingHelper compareCurrentChangeTokenToLastConsumedWithResult:error:].cold.1();

  +[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", CFSTR("REMDAChangeTrackingHelper: Cannot get last consumed token when trying to peekHasChangesSinceLastConsumed"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = 0;
LABEL_16:

  if (a3)
    *a3 = v14;
  if (a4)
    *a4 = objc_retainAutorelease(v13);

  return v13 == 0;
}

- (id)fetchChangesSinceLastConsumed
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  NSObject *v35;
  __int16 v36;
  NSObject *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[REMDAChangeTrackingHelper changeSet](self, "changeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[REMDAChangeTrackingHelper changeTracking](self, "changeTracking");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      +[REMLog changeTracking](REMLog, "changeTracking");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[REMDAChangeTrackingHelper fetchChangesSinceLastConsumed].cold.1(self);
      goto LABEL_23;
    }
    -[REMDAChangeTrackingHelper changeTracking](self, "changeTracking");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "changeTrackingClientID");
    v6 = objc_claimAutoreleasedReturnValue();

    -[REMDAChangeTrackingHelper fetchAndInitializeChangeTrackingStateIfNeeded](self, "fetchAndInitializeChangeTrackingStateIfNeeded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastConsumedChangeToken");
    v8 = objc_claimAutoreleasedReturnValue();
    -[REMDAChangeTrackingHelper _debug_mockChangeSet](self, "_debug_mockChangeSet");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = 0;
    }
    else
    {
      -[REMDAChangeTrackingHelper changeTracking](self, "changeTracking");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      objc_msgSend(v12, "fetchHistoryAfterToken:error:", v8, &v33);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v33;

    }
    +[REMLog changeTracking](REMLog, "changeTracking");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "lastConsumedChangeToken");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastConsumedDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v35 = v6;
      v36 = 2114;
      v37 = v14;
      v38 = 2114;
      v39 = v15;
      v40 = 2114;
      v41 = v10;
      _os_log_impl(&dword_1B4A39000, v13, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: fetched history since {clientID: %{public}@, lastSyncToken: %{public}@, lastSyncDate: %{public}@, changeSet: %{public}@}", buf, 0x2Au);

    }
    -[REMDAChangeTrackingHelper setChangeSet:](self, "setChangeSet:", v10);
    -[REMDAChangeTrackingHelper setSinceToken:](self, "setSinceToken:", v8);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMDAChangeTrackingHelper setCached_insertedModelObjectResultsByModelClassName:](self, "setCached_insertedModelObjectResultsByModelClassName:", v16);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMDAChangeTrackingHelper setCached_updatedModelObjectResultsByModelClassName:](self, "setCached_updatedModelObjectResultsByModelClassName:", v17);

    objc_msgSend(v10, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {

    }
    else if ((objc_msgSend(v10, "isTruncated") & 1) == 0)
    {
      -[REMDAChangeTrackingHelper account](self, "account");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "rem_accountObjectID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastChangeTokenForAccountID:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMDAChangeTrackingHelper setUpToToken:](self, "setUpToToken:", v27);

      +[REMLog changeTracking](REMLog, "changeTracking");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[REMDAChangeTrackingHelper upToToken](self, "upToToken");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = v6;
        v36 = 2114;
        v37 = v8;
        v38 = 2114;
        v39 = v28;
        _os_log_impl(&dword_1B4A39000, v20, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: fetchChangesSinceLastConsumed done {clientID: %{public}@, lastSyncToken: %{public}@, upToToken: %{public}@}", buf, 0x20u);

      }
      goto LABEL_18;
    }
    +[REMLog changeTracking](REMLog, "changeTracking");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v10, "isTruncated"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "error");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedDescription");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v35 = v6;
      v36 = 2114;
      v37 = v8;
      v38 = 2114;
      v39 = v29;
      v40 = 2112;
      v41 = v31;
      _os_log_error_impl(&dword_1B4A39000, v19, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper: ERROR: Fetched truncated or error change history {clientID: %{public}@, lastSyncToken: %{public}@, isTruncated: %{public}@, changeSet.error: %@}", buf, 0x2Au);

    }
    v32 = v11;
    -[REMDAChangeTrackingHelper currentChangeTokenWithError:](self, "currentChangeTokenWithError:", &v32);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v32;

    +[REMLog changeTracking](REMLog, "changeTracking");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v35 = v6;
      v36 = 2114;
      v37 = v20;
      _os_log_impl(&dword_1B4A39000, v22, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: Will try to reset tracking state to current token because we had a truncated or error change-set {clientID: %{public}@, nowToken: %{public}@}", buf, 0x16u);
    }

    -[REMDAChangeTrackingHelper setUpToToken:](self, "setUpToToken:", v20);
    v11 = v21;
LABEL_18:

    -[REMDAChangeTrackingHelper setCached_currentChangeToken:](self, "setCached_currentChangeToken:", 0);
    if (v11)
    {
      +[REMLog changeTracking](REMLog, "changeTracking");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[REMDAChangeTrackingHelper fetchChangesSinceLastConsumed].cold.2(self, v23);

    }
LABEL_23:

  }
  -[REMDAChangeTrackingHelper changeSet](self, "changeSet");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)markChangesConsumed
{
  -[REMDAChangeTrackingHelper markChangesConsumed:](self, "markChangesConsumed:", 0);
}

- (void)markChangesConsumed:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  REMChangeTrackingState *v26;
  void *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  NSObject *v40;
  __int16 v41;
  NSObject *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  _BOOL4 v48;
  uint64_t v49;

  v3 = a3;
  v49 = *MEMORY[0x1E0C80C00];
  -[REMDAChangeTrackingHelper changeTracking](self, "changeTracking");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[REMDAChangeTrackingHelper changeTracking](self, "changeTracking");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "changeTrackingClientID");
    v7 = objc_claimAutoreleasedReturnValue();

    -[REMDAChangeTrackingHelper changeSet](self, "changeSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[REMDAChangeTrackingHelper changeSet](self, "changeSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isTruncated");

    }
    else
    {
      v10 = 0;
    }

    if (v3 || v10)
    {
      -[REMDAChangeTrackingHelper changeTracking](self, "changeTracking");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      objc_msgSend(v19, "currentChangeTokenWithError:", &v38);
      v18 = objc_claimAutoreleasedReturnValue();
      v14 = v38;

      if (v14)
      {
        +[REMLog changeTracking](REMLog, "changeTracking");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          -[REMDAChangeTrackingHelper account](self, "account");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "loggingDescription");
          v35 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v40 = v7;
          v41 = 2114;
          v42 = v35;
          v43 = 2112;
          v44 = v14;
          _os_log_error_impl(&dword_1B4A39000, v20, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper: ERROR: Cannot get current token to mark to {clientID: %{public}@, account: %{public}@, error: %@}", buf, 0x20u);

        }
      }
      -[REMDAChangeTrackingHelper setUpToToken:](self, "setUpToToken:", v18);
LABEL_25:

      if (!v18)
      {
LABEL_34:
        -[REMDAChangeTrackingHelper setChangeSet:](self, "setChangeSet:", 0);
        -[REMDAChangeTrackingHelper setCached_insertedModelObjectResultsByModelClassName:](self, "setCached_insertedModelObjectResultsByModelClassName:", 0);
        -[REMDAChangeTrackingHelper setCached_updatedModelObjectResultsByModelClassName:](self, "setCached_updatedModelObjectResultsByModelClassName:", 0);
        -[REMDAChangeTrackingHelper setCached_currentChangeToken:](self, "setCached_currentChangeToken:", 0);
        -[REMDAChangeTrackingHelper setCached_currentTrackingState:](self, "setCached_currentTrackingState:", 0);

        return;
      }
      v26 = objc_alloc_init(REMChangeTrackingState);
      -[REMChangeTrackingState setLastConsumedChangeToken:](v26, "setLastConsumedChangeToken:", v18);
      -[REMDAChangeTrackingHelper changeTracking](self, "changeTracking");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0;
      objc_msgSend(v27, "saveTrackingState:error:", v26, &v36);
      v28 = v36;

      +[REMLog changeTracking](REMLog, "changeTracking");
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v28)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v28, "localizedDescription");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMDAChangeTrackingHelper account](self, "account");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "loggingDescription");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v40 = v18;
          v41 = 2114;
          v42 = v7;
          v43 = 2112;
          v44 = v31;
          v45 = 2114;
          v46 = v33;
          v47 = 1024;
          v48 = v3;
          _os_log_error_impl(&dword_1B4A39000, v30, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper: ERROR: Failed to save tracking state with error {tokenToSave: %{public}@, clientID: %{public}@, error: %@, account: %{public}@, forcedToCurrent: %d}", buf, 0x30u);

LABEL_31:
        }
      }
      else if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        -[REMDAChangeTrackingHelper account](self, "account");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "loggingDescription");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v40 = v18;
        v41 = 2114;
        v42 = v7;
        v43 = 2114;
        v44 = v32;
        v45 = 1024;
        LODWORD(v46) = v3;
        _os_log_impl(&dword_1B4A39000, v30, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: markChangesConsumed done {tokenToSave: %{public}@, clientID: %{public}@, account: %{public}@, forcedToCurrent: %d}", buf, 0x26u);
        goto LABEL_31;
      }

LABEL_33:
      goto LABEL_34;
    }
    -[REMDAChangeTrackingHelper sinceToken](self, "sinceToken");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11
      || (v12 = (void *)v11,
          -[REMDAChangeTrackingHelper upToToken](self, "upToToken"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          v12,
          !v13))
    {
      +[REMLog changeTracking](REMLog, "changeTracking");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[REMDAChangeTrackingHelper account](self, "account");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "loggingDescription");
        v22 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v7;
        v41 = 2114;
        v42 = v22;
        _os_log_impl(&dword_1B4A39000, v18, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: No newer change token in this history {clientID: %{public}@, account: %{public}@}", buf, 0x16u);

      }
      goto LABEL_33;
    }
    -[REMDAChangeTrackingHelper sinceToken](self, "sinceToken");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[REMDAChangeTrackingHelper upToToken](self, "upToToken");
    v15 = objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v16 = -[NSObject compareToken:error:](v15, "compareToken:error:", v14, &v37);
    v17 = v37;
    if (v16 == 3)
    {
      +[REMLog changeTracking](REMLog, "changeTracking");
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      -[REMDAChangeTrackingHelper account](self, "account");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "loggingDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v15;
      v41 = 2114;
      v42 = v7;
      v43 = 2114;
      v44 = v25;
      _os_log_impl(&dword_1B4A39000, v23, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: No newer change token in this history {token: %{public}@, clientID: %{public}@, account: %{public}@}", buf, 0x20u);
    }
    else
    {
      if (v16 == 4)
      {
        v18 = v15;
LABEL_24:

        goto LABEL_25;
      }
      +[REMLog changeTracking](REMLog, "changeTracking");
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
LABEL_23:

        v18 = 0;
        goto LABEL_24;
      }
      -[REMDAChangeTrackingHelper account](self, "account");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "loggingDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v40 = v15;
      v41 = 2114;
      v42 = v7;
      v43 = 2114;
      v44 = v25;
      v45 = 2112;
      v46 = v17;
      _os_log_error_impl(&dword_1B4A39000, v23, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper: ERROR: Unexpected change token {token: %{public}@, clientID: %{public}@, account: %{public}@, error: %@}", buf, 0x2Au);
    }

    goto LABEL_23;
  }
}

- (id)changedModelObjectsOfModelClass:(Class)a3 ofChangeType:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  if ((objc_opt_respondsToSelector() & 1) == 0
    || !-[objc_class performSelector:](a3, "performSelector:", sel_isChangeTrackableFetchableModel))
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99768];
    NSStringFromClass(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("The given model class is not a known trackable-fetchable type for this API, you shouldn't call this with {modelClass: %@}."), v9);

  }
  -[REMDAChangeTrackingHelper _cachedModeObjectResultsForModelClass:changeType:](self, "_cachedModeObjectResultsForModelClass:changeType:", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    -[REMDAChangeTrackingHelper _changedModelObjectsOfClass:ofChangeTypes:shouldOutputFetchedModels:](self, "_changedModelObjectsOfClass:ofChangeTypes:shouldOutputFetchedModels:", a3, -[REMDAChangeTrackingHelper _changeTypeMaskFromChangeType:](self, "_changeTypeMaskFromChangeType:", a4), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMDAChangeTrackingHelper _setCachedModeObjectResults:forModelClass:changeType:](self, "_setCachedModeObjectResults:forModelClass:changeType:", v10, a3, a4);
  }
  return v10;
}

- (id)changedIdentifiersOfModelClass:(Class)a3 ofChangeType:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  void *v9;

  if ((objc_opt_respondsToSelector() & 1) == 0
    || !-[objc_class performSelector:](a3, "performSelector:", sel_isChangeTrackableModel))
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99768];
    NSStringFromClass(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("The given model class is not a known trackable type for this API, you shouldn't call this with {modelClass: %@}."), v9);

  }
  return -[REMDAChangeTrackingHelper _changedModelObjectsOfClass:ofChangeTypes:shouldOutputFetchedModels:](self, "_changedModelObjectsOfClass:ofChangeTypes:shouldOutputFetchedModels:", a3, -[REMDAChangeTrackingHelper _changeTypeMaskFromChangeType:](self, "_changeTypeMaskFromChangeType:", a4), 0);
}

- (id)_changedModelObjectsOfClass:(Class)a3 ofChangeTypes:(int64_t)a4 shouldOutputFetchedModels:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  int64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  char v34;
  void *v35;
  id v36;
  char v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  char v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  NSObject *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  NSObject *log;
  NSObject *v67;
  int64_t v68;
  void *v69;
  void *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[5];
  NSObject *v77;
  id v78;
  id v79;
  id v80;
  Class v81;
  uint8_t buf[4];
  NSObject *v83;
  __int16 v84;
  int64_t v85;
  __int16 v86;
  int64_t v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  int64_t v91;
  _BYTE v92[128];
  uint64_t v93;

  v5 = a5;
  v93 = *MEMORY[0x1E0C80C00];
  -[REMDAChangeTrackingHelper changeTracking](self, "changeTracking");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[REMDAChangeTrackingHelper changeTracking](self, "changeTracking");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "changeTrackingClientID");
    v11 = objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      +[REMLog changeTracking](REMLog, "changeTracking");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[REMDAChangeTrackingHelper _changedModelObjectsOfClass:ofChangeTypes:shouldOutputFetchedModels:].cold.2((uint64_t)self, v12);
      v16 = 0;
      goto LABEL_23;
    }
    -[REMDAChangeTrackingHelper _rem_accountObjectID](self, "_rem_accountObjectID");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[REMLog changeTracking](REMLog, "changeTracking");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[REMDAChangeTrackingHelper _changedModelObjectsOfClass:ofChangeTypes:shouldOutputFetchedModels:].cold.3();
      v16 = 0;
      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMDAChangeTrackingHelper changeSet](self, "changeSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      +[REMLog changeTracking](REMLog, "changeTracking");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v83 = v11;
        _os_log_impl(&dword_1B4A39000, v18, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: Change set is nil and we have nothing to enumerate for %{public}@.", buf, 0xCu);
      }
      goto LABEL_21;
    }
    -[REMDAChangeTrackingHelper changeSet](self, "changeSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isTruncated"))
    {

      goto LABEL_19;
    }
    -[REMDAChangeTrackingHelper changeSet](self, "changeSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "error");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
LABEL_19:
      +[REMLog changeTracking](REMLog, "changeTracking");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (void *)MEMORY[0x1E0CB37E8];
        -[REMDAChangeTrackingHelper changeSet](self, "changeSet");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "numberWithBool:", objc_msgSend(v22, "isTruncated"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMDAChangeTrackingHelper changeSet](self, "changeSet");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "error");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v83 = v11;
        v84 = 2114;
        v85 = (int64_t)v23;
        v86 = 2112;
        v87 = (int64_t)v25;
        _os_log_impl(&dword_1B4A39000, v18, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: Change set was truncated or had error and we are not going to enumerate it for %{public}@ {isTruncated: %{public}@, changeSet.error: %@}.", buf, 0x20u);

      }
LABEL_21:

      v17 = v13;
      v16 = v17;
LABEL_22:

LABEL_23:
      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 2 * (a4 & 1);
    if ((a4 & 4) != 0)
      v29 = 2;
    v68 = v29 | a4;
    -[REMDAChangeTrackingHelper changeSet](self, "changeSet");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke;
    v76[3] = &unk_1E67F99F8;
    v76[4] = self;
    v81 = a3;
    v67 = v11;
    v77 = v67;
    v64 = v27;
    v78 = v64;
    v63 = v28;
    v79 = v63;
    v65 = v70;
    v80 = v65;
    objc_msgSend(v30, "enumerateChanges:forModelsOfClass:withBlock:", v68, a3, v76);

    if (a4 == 1)
    {
      v31 = v64;
      if (!v5
        || (v34 = -[objc_class rem_DA_supportsFetching](a3, "rem_DA_supportsFetching"), v35 = v64, (v34 & 1) == 0))
      {
        v36 = v64;

        v13 = v36;
        goto LABEL_55;
      }
    }
    else
    {
      if (a4 != 2)
      {
        v31 = v64;
        if (a4 == 4)
        {
          v32 = v63;
          v33 = v63;

          v13 = v33;
LABEL_56:
          v55 = v65;
LABEL_62:
          v17 = v13;

          v16 = v17;
          goto LABEL_22;
        }
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Mixed change types is not supported."));
LABEL_55:
        v32 = v63;
        goto LABEL_56;
      }
      v31 = v64;
      if (!v5
        || (v37 = -[objc_class rem_DA_supportsFetching](a3, "rem_DA_supportsFetching"), v35 = v65, (v37 & 1) == 0))
      {
        v55 = v65;
        v58 = v65;

        v13 = v58;
        v32 = v63;
        goto LABEL_62;
      }
    }
    v38 = v35;
    if (v38)
    {
      v39 = v38;
      -[REMDAChangeTrackingHelper _fetchModelObjectsOfClass:withObjectIDs:](self, "_fetchModelObjectsOfClass:withObjectIDs:", a3, v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v40;
      if (v40)
      {
        v61 = v39;
        objc_msgSend(v40, "allValues");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v42 = v41;
        v43 = -[NSObject countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v72, v92, 16);
        log = v42;
        if (v43)
        {
          v44 = v43;
          v45 = *(_QWORD *)v73;
          do
          {
            for (i = 0; i != v44; ++i)
            {
              if (*(_QWORD *)v73 != v45)
                objc_enumerationMutation(v42);
              v47 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
              objc_msgSend(v47, "accountID");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = objc_msgSend(v48, "isEqual:", v12);

              if ((v49 & 1) != 0)
              {
                objc_msgSend(v69, "addObject:", v47);
                objc_msgSend(v47, "objectID");
                v50 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "addObject:", v50);
              }
              else
              {
                +[REMLog changeTracking](REMLog, "changeTracking");
                v50 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v47, "objectID");
                  v51 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "accountID");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject description](v67, "description");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544386;
                  v83 = v51;
                  v84 = 2114;
                  v85 = (int64_t)v52;
                  v86 = 2114;
                  v87 = (int64_t)v12;
                  v88 = 2114;
                  v89 = v53;
                  v90 = 2048;
                  v91 = a4;
                  _os_log_impl(&dword_1B4A39000, v50, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: Unexpectedly got a changed model object from a different account {modelObject: %{public}@, modelObject.account: %{public}@, daREMAccount: %{public}@, clientID: %{public}@, changeType: %lu}", buf, 0x34u);

                  v42 = log;
                }
              }

            }
            v44 = -[NSObject countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v72, v92, 16);
          }
          while (v44);
        }

        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v61);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "removeObjectsInArray:", v71);
        v32 = v63;
        v55 = v65;
        v13 = v69;
        if (objc_msgSend(v54, "count"))
        {
          +[REMLog changeTracking](REMLog, "changeTracking");
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            -[NSObject description](v67, "description");
            v57 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v83 = v57;
            v84 = 2048;
            v85 = a4;
            v86 = 2114;
            v87 = (int64_t)v54;
            _os_log_impl(&dword_1B4A39000, v56, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: Could not find changed model object(s) in the ReminderKit with {clientID: %{public}@, changeType: %lu, missingIDs: %{public}@}", buf, 0x20u);

          }
        }

        v31 = v64;
        v39 = v61;
      }
      else
      {
        +[REMLog changeTracking](REMLog, "changeTracking");
        log = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          -[NSObject description](v67, "description");
          v59 = v39;
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v83 = v12;
          v84 = 2114;
          v85 = (int64_t)v60;
          v86 = 2048;
          v87 = a4;
          _os_log_error_impl(&dword_1B4A39000, log, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper: ERROR: Failed to fetch changed model objects for account: {remAccount: %{public}@, clientID: %{public}@, changeType: %lu}", buf, 0x20u);

          v39 = v59;
        }
        v32 = v63;
        v55 = v65;
      }

      goto LABEL_62;
    }
    goto LABEL_55;
  }
  +[REMLog changeTracking](REMLog, "changeTracking");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[REMDAChangeTrackingHelper _changedModelObjectsOfClass:ofChangeTypes:shouldOutputFetchedModels:].cold.1((uint64_t)self, v11);
  v16 = 0;
LABEL_24:

  return v16;
}

void __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void *v25;
  id v26;
  _BYTE *v27;
  _QWORD v28[4];
  id v29;
  _BYTE *v30;
  _QWORD v31[5];
  _QWORD v32[4];
  id v33;
  id v34;
  _BYTE *v35;
  _BYTE buf[24];
  char v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "changedObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    switch(a3)
    {
      case 2:
        objc_msgSend(v5, "tombstone");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 72), "rem_DA_deletedKeyFromTombstoneBlock");
        v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v14)[2](v14, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v15);
        }
        else
        {
          +[REMLog changeTracking](REMLog, "changeTracking");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 40), "description");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v7;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v21;
            _os_log_impl(&dword_1B4A39000, v20, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: (NOTICE)(May be legit) Had a (real-)deleted model object without a deletion key (e.g. external id) {objectID: %{public}@, clientID: %{public}@}", buf, 0x16u);

          }
        }

        break;
      case 1:
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v37 = 0;
        v16 = *(_QWORD *)(a1 + 72);
        v17 = MEMORY[0x1E0C809B0];
        v18 = *(void **)(a1 + 32);
        v19 = *(_QWORD *)(a1 + 40);
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke_2_17;
        v28[3] = &unk_1E67F99A8;
        v29 = *(id *)(a1 + 56);
        v30 = buf;
        v22 = v17;
        v23 = 3221225472;
        v24 = __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke_3;
        v25 = &unk_1E67F99D0;
        v26 = *(id *)(a1 + 48);
        v27 = buf;
        objc_msgSend(v18, "_handleIsConcealedUpdatesInChange:ofModelClass:forClientID:concealedHandler:unconcealedHandler:", v5, v16, v19, v28, &v22);
        if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24)
          && (objc_msgSend((id)objc_opt_class(), "shouldIgnoreChangeOfModelClassProperties:withChangeObject:", *(_QWORD *)(a1 + 72), v5, v22, v23, v24, v25) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 64), "addObject:", v7);
        }

        goto LABEL_14;
      case 0:
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v37 = 0;
        v8 = *(_QWORD *)(a1 + 72);
        v9 = *(void **)(a1 + 32);
        v10 = *(_QWORD *)(a1 + 40);
        v11 = MEMORY[0x1E0C809B0];
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke_2;
        v32[3] = &unk_1E67F9958;
        v12 = v6;
        v33 = v12;
        v34 = *(id *)(a1 + 40);
        v35 = buf;
        v31[0] = v11;
        v31[1] = 3221225472;
        v31[2] = __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke_15;
        v31[3] = &unk_1E67F9980;
        v31[4] = buf;
        objc_msgSend(v9, "_handleIsConcealedUpdatesInChange:ofModelClass:forClientID:concealedHandler:unconcealedHandler:", v5, v8, v10, v32, v31);
        if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);

LABEL_14:
        _Block_object_dispose(buf, 8);
        break;
    }
  }

}

void __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

uint64_t __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke_15(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

void __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke_2_17(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

}

uint64_t __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (void)_handleIsConcealedUpdatesInChange:(id)a3 ofModelClass:(Class)a4 forClientID:(id)a5 concealedHandler:(id)a6 unconcealedHandler:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, void *);
  void (**v15)(id, void *);
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD);
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = (void (**)(id, void *))a6;
  v15 = (void (**)(id, void *))a7;
  if (-[objc_class rem_DA_supportsConcealedObjects](a4, "rem_DA_supportsConcealedObjects"))
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    -[objc_class rem_DA_propertiesAffectingIsConcealed](a4, "rem_DA_propertiesAffectingIsConcealed");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __124__REMDAChangeTrackingHelper__handleIsConcealedUpdatesInChange_ofModelClass_forClientID_concealedHandler_unconcealedHandler___block_invoke;
    v32 = &unk_1E67F9A20;
    v17 = v12;
    v33 = v17;
    v34 = &v35;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", &v29);

    if (!*((_BYTE *)v36 + 24))
    {
LABEL_17:

      _Block_object_dispose(&v35, 8);
      goto LABEL_18;
    }
    objc_msgSend(v17, "changedObjectID", v29, v30, v31, v32);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      +[REMLog changeTracking](REMLog, "changeTracking");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        NSStringFromClass(a4);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "description");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v17, "changeID");
        *(_DWORD *)buf = 138543874;
        v40 = v20;
        v41 = 2114;
        v42 = v21;
        v43 = 2048;
        v44 = v22;
        _os_log_error_impl(&dword_1B4A39000, v19, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper: Cannot handleIsConcealedUpdatesInChange as given change has nil changedObjectID {modelClass: %{public}@, clientID: %{public}@, changeID: %lld}", buf, 0x20u);

      }
      goto LABEL_16;
    }
    -[REMDAChangeTrackingHelper _fetchModelObjectOfClass:withObjectID:includeConcealedObjects:](self, "_fetchModelObjectOfClass:withObjectID:includeConcealedObjects:", a4, v18, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v15[2](v15, v18);
LABEL_16:

      goto LABEL_17;
    }
    -[REMDAChangeTrackingHelper _fetchModelObjectOfClass:withObjectID:includeConcealedObjects:](self, "_fetchModelObjectOfClass:withObjectID:includeConcealedObjects:", a4, v18, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      -[objc_class rem_DA_deletedKeyFromConcealedModelObjectBlock](a4, "rem_DA_deletedKeyFromConcealedModelObjectBlock");
      v24 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v24)[2](v24, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
LABEL_15:
        v14[2](v14, v25);

        goto LABEL_16;
      }
      +[REMLog changeTracking](REMLog, "changeTracking");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v13, "description");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = v18;
        v41 = 2114;
        v42 = v23;
        v43 = 2114;
        v44 = (uint64_t)v27;
        _os_log_impl(&dword_1B4A39000, v26, OS_LOG_TYPE_DEFAULT, "REMDAChangeTrackingHelper: (NOTICE)(Can be legit) Had a concealed (e.g. lazy deleted) model object without a deletion key (e.g. externalIdentifier) {objectID: %{public}@, modelObject: %{public}@, clientID: %{public}@}", buf, 0x20u);

      }
    }
    else
    {
      +[REMLog changeTracking](REMLog, "changeTracking");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "description");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMDAChangeTrackingHelper _handleIsConcealedUpdatesInChange:ofModelClass:forClientID:concealedHandler:unconcealedHandler:].cold.1((uint64_t)v18, v28, (uint64_t)buf, v26);
      }
    }

    v25 = 0;
    goto LABEL_15;
  }
LABEL_18:

}

void __124__REMDAChangeTrackingHelper__handleIsConcealedUpdatesInChange_ofModelClass_forClientID_concealedHandler_unconcealedHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  int v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "updatedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

+ (BOOL)shouldIgnoreChangeOfModelClassProperties:(Class)a3 withChangeObject:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v4 = shouldIgnoreChangeOfModelClassProperties_withChangeObject__onceToken;
  v5 = a4;
  if (v4 != -1)
    dispatch_once(&shouldIgnoreChangeOfModelClassProperties_withChangeObject__onceToken, &__block_literal_global_17);
  objc_msgSend(v5, "updatedProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v7, "minusSet:", shouldIgnoreChangeOfModelClassProperties_withChangeObject__propertiesToAvoid);
  LOBYTE(v6) = objc_msgSend(v7, "count") == 0;

  return (char)v6;
}

void __87__REMDAChangeTrackingHelper_shouldIgnoreChangeOfModelClassProperties_withChangeObject___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("externalIdentifier"), CFSTR("externalModificationTag"), CFSTR("daSyncToken"), CFSTR("daPushKey"), CFSTR("lastModifiedDate"), CFSTR("resolutionTokenMap"), CFSTR("resolutionTokenMap_v2_JSON"), CFSTR("resolutionTokenMap_v3_JSONData"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)shouldIgnoreChangeOfModelClassProperties_withChangeObject__propertiesToAvoid;
  shouldIgnoreChangeOfModelClassProperties_withChangeObject__propertiesToAvoid = v0;

}

- (id)_fetchModelObjectOfClass:(Class)a3 withObjectID:(id)a4 includeConcealedObjects:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v23;
  id v24;

  v5 = a5;
  v8 = a4;
  if ((-[objc_class rem_DA_supportsFetching](a3, "rem_DA_supportsFetching") & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99768];
    NSStringFromClass(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise:format:", v10, CFSTR("The given model class does not support fetching, shouldn't enter this function call {%@}."), v11);

  }
  if (v5 && (-[objc_class rem_DA_supportsConcealedObjects](a3, "rem_DA_supportsConcealedObjects") & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99768];
    NSStringFromClass(a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise:format:", v13, CFSTR("The given model class does not support concealed objects, shouldn't enter this function call with includeConcealedObjects=YES {%@}."), v14);

  }
  -[REMDAChangeTrackingHelper changeTracking](self, "changeTracking");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "changeTrackingClientID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[REMDAChangeTrackingHelper remStore](self, "remStore");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      +[REMLog changeTracking](REMLog, "changeTracking");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        -[REMDAChangeTrackingHelper _fetchModelObjectOfClass:withObjectID:includeConcealedObjects:].cold.3();

    }
    -[objc_class rem_DA_fetchByObjectIDBlock](a3, "rem_DA_fetchByObjectIDBlock");
    v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v24 = 0;
    ((void (**)(_QWORD, id, _BOOL8, NSObject *, id *))v18)[2](v18, v8, v5, v17, &v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v24;

    if (v20 && objc_msgSend(v20, "code") != -3000)
    {
      +[REMLog changeTracking](REMLog, "changeTracking");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[REMDAChangeTrackingHelper _fetchModelObjectOfClass:withObjectID:includeConcealedObjects:].cold.2();

    }
  }
  else
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[REMDAChangeTrackingHelper _fetchModelObjectOfClass:withObjectID:includeConcealedObjects:].cold.1();
    v19 = 0;
  }

  return v19;
}

- (id)_fetchModelObjectsOfClass:(Class)a3 withObjectIDs:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v14;
  NSObject *v16;

  v6 = a4;
  if ((-[objc_class rem_DA_supportsFetching](a3, "rem_DA_supportsFetching") & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99768];
    NSStringFromClass(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("The given model class does not support fetching, shouldn't enter this function call {%@}."), v9);

  }
  -[REMDAChangeTrackingHelper changeTracking](self, "changeTracking");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "changeTrackingClientID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMDAChangeTrackingHelper remStore](self, "remStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[REMDAChangeTrackingHelper _fetchModelObjectsOfClass:withObjectIDs:].cold.1();

  }
  -[objc_class rem_DA_fetchByObjectIDsBlock](a3, "rem_DA_fetchByObjectIDsBlock");
  v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, void *, _QWORD))v13)[2](v13, v6, v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)_changeTypeMaskFromChangeType:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return qword_1B4B744F0[a3];
}

- (id)_cachedModeObjectResultsForModelClass:(Class)a3 changeType:(int64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  if (a4 == 1)
  {
    -[REMDAChangeTrackingHelper cached_updatedModelObjectResultsByModelClassName](self, "cached_updatedModelObjectResultsByModelClassName");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      v8 = 0;
      return v8;
    }
    -[REMDAChangeTrackingHelper cached_insertedModelObjectResultsByModelClassName](self, "cached_insertedModelObjectResultsByModelClassName");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  NSStringFromClass(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_setCachedModeObjectResults:(id)a3 forModelClass:(Class)a4 changeType:(int64_t)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a3;
  if (a5 == 1)
  {
    v12 = v8;
    -[REMDAChangeTrackingHelper cached_updatedModelObjectResultsByModelClassName](self, "cached_updatedModelObjectResultsByModelClassName");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!a5)
  {
    v12 = v8;
    -[REMDAChangeTrackingHelper cached_insertedModelObjectResultsByModelClassName](self, "cached_insertedModelObjectResultsByModelClassName");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = (void *)v9;
    NSStringFromClass(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v12, v11);

    v8 = v12;
  }

}

- (void)clearCachedModelObjectResultsForModelClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[REMDAChangeTrackingHelper cached_insertedModelObjectResultsByModelClassName](self, "cached_insertedModelObjectResultsByModelClassName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v6);

  -[REMDAChangeTrackingHelper cached_updatedModelObjectResultsByModelClassName](self, "cached_updatedModelObjectResultsByModelClassName");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v7);

}

- (id)_rem_changeTracking:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  -[REMDAChangeTrackingHelper account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rem_accountObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[REMDAChangeTrackingHelper remStore](self, "remStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "provideChangeTrackingForAccountID:clientName:", v6, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[REMLog changeTracking](REMLog, "changeTracking");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[REMDAChangeTrackingHelper _rem_changeTracking:].cold.1(self, v9);

    v8 = 0;
  }

  return v8;
}

- (id)_rem_accountObjectID
{
  void *v3;
  void *v4;
  void *v5;

  -[REMDAChangeTrackingHelper cached_remAccountObjectID](self, "cached_remAccountObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[REMDAChangeTrackingHelper account](self, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rem_accountObjectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMDAChangeTrackingHelper setCached_remAccountObjectID:](self, "setCached_remAccountObjectID:", v5);

  }
  return -[REMDAChangeTrackingHelper cached_remAccountObjectID](self, "cached_remAccountObjectID");
}

- (NSArray)entityNames
{
  return self->_entityNames;
}

- (void)setEntityNames:(id)a3
{
  objc_storeStrong((id *)&self->_entityNames, a3);
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
  objc_storeStrong((id *)&self->_clientName, a3);
}

- (REMDAAccountProviding)account
{
  return self->_account;
}

- (REMChangeSet)changeSet
{
  return self->_changeSet;
}

- (void)setChangeSet:(id)a3
{
  objc_storeStrong((id *)&self->_changeSet, a3);
}

- (REMChangeToken)sinceToken
{
  return self->_sinceToken;
}

- (void)setSinceToken:(id)a3
{
  objc_storeStrong((id *)&self->_sinceToken, a3);
}

- (REMChangeToken)upToToken
{
  return self->_upToToken;
}

- (void)setUpToToken:(id)a3
{
  objc_storeStrong((id *)&self->_upToToken, a3);
}

- (REMStore)remStore
{
  return self->_remStore;
}

- (void)setRemStore:(id)a3
{
  objc_storeStrong((id *)&self->_remStore, a3);
}

- (REMChangeTracking)changeTracking
{
  return self->_changeTracking;
}

- (void)setChangeTracking:(id)a3
{
  objc_storeStrong((id *)&self->_changeTracking, a3);
}

- (REMObjectID)cached_remAccountObjectID
{
  return self->_cached_remAccountObjectID;
}

- (void)setCached_remAccountObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_cached_remAccountObjectID, a3);
}

- (NSMutableDictionary)cached_insertedModelObjectResultsByModelClassName
{
  return self->_cached_insertedModelObjectResultsByModelClassName;
}

- (void)setCached_insertedModelObjectResultsByModelClassName:(id)a3
{
  objc_storeStrong((id *)&self->_cached_insertedModelObjectResultsByModelClassName, a3);
}

- (NSMutableDictionary)cached_updatedModelObjectResultsByModelClassName
{
  return self->_cached_updatedModelObjectResultsByModelClassName;
}

- (void)setCached_updatedModelObjectResultsByModelClassName:(id)a3
{
  objc_storeStrong((id *)&self->_cached_updatedModelObjectResultsByModelClassName, a3);
}

- (REMChangeToken)cached_currentChangeToken
{
  return self->_cached_currentChangeToken;
}

- (void)setCached_currentChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_cached_currentChangeToken, a3);
}

- (REMChangeTrackingState)cached_currentTrackingState
{
  return self->_cached_currentTrackingState;
}

- (void)setCached_currentTrackingState:(id)a3
{
  objc_storeStrong((id *)&self->_cached_currentTrackingState, a3);
}

- (REMChangeSet)_debug_mockChangeSet
{
  return self->__debug_mockChangeSet;
}

- (void)set_debug_mockChangeSet:(id)a3
{
  objc_storeStrong((id *)&self->__debug_mockChangeSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__debug_mockChangeSet, 0);
  objc_storeStrong((id *)&self->_cached_currentTrackingState, 0);
  objc_storeStrong((id *)&self->_cached_currentChangeToken, 0);
  objc_storeStrong((id *)&self->_cached_updatedModelObjectResultsByModelClassName, 0);
  objc_storeStrong((id *)&self->_cached_insertedModelObjectResultsByModelClassName, 0);
  objc_storeStrong((id *)&self->_cached_remAccountObjectID, 0);
  objc_storeStrong((id *)&self->_changeTracking, 0);
  objc_storeStrong((id *)&self->_remStore, 0);
  objc_storeStrong((id *)&self->_upToToken, 0);
  objc_storeStrong((id *)&self->_sinceToken, 0);
  objc_storeStrong((id *)&self->_changeSet, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_entityNames, 0);
}

- (void)_debug_resetCaches
{
  -[REMDAChangeTrackingHelper setChangeSet:](self, "setChangeSet:", 0);
  -[REMDAChangeTrackingHelper setCached_insertedModelObjectResultsByModelClassName:](self, "setCached_insertedModelObjectResultsByModelClassName:", 0);
  -[REMDAChangeTrackingHelper setCached_updatedModelObjectResultsByModelClassName:](self, "setCached_updatedModelObjectResultsByModelClassName:", 0);
  -[REMDAChangeTrackingHelper setCached_currentChangeToken:](self, "setCached_currentChangeToken:", 0);
  -[REMDAChangeTrackingHelper setCached_currentTrackingState:](self, "setCached_currentTrackingState:", 0);
  -[REMDAChangeTrackingHelper setCached_remAccountObjectID:](self, "setCached_remAccountObjectID:", 0);
}

- (id)_debug_currentChangeTokenWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[REMDAChangeTrackingHelper changeTracking](self, "changeTracking");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentChangeTokenWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)initWithREMDAAccount:clientName:withREMStore:entityNames:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_11();
  _os_log_error_impl(&dword_1B4A39000, v0, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper: ERROR: Couldn't initialize REMDAChangeTrackingHelper without an account.", v1, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)initWithREMDAAccount:(void *)a1 clientName:(NSObject *)a2 withREMStore:entityNames:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1B4A39000, a2, v5, "REMDAChangeTrackingHelper: ERROR: Couldn't initialize REMDAChangeTrackingHelper without an REM store {account: %{public}@}.", v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)initWithREMDAAccount:(void *)a1 clientName:(NSObject *)a2 withREMStore:entityNames:.cold.3(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1B4A39000, a2, v5, "REMDAChangeTrackingHelper: ERROR: Couldn't initialize REMDAChangeTrackingHelper because we failed to obtain a change tracking API handle {account: %{public}@}.", v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)fetchAndInitializeChangeTrackingStateIfNeeded
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_1();
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, v1), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v3, v4, "REMDAChangeTrackingHelper: ERROR: Failed to get change tracking state with error {clientID: %{public}@, error: %@}", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)compareCurrentChangeTokenToLastConsumedWithResult:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1B4A39000, v0, v1, "REMDAChangeTrackingHelper: Cannot get last consumed token when compareCurrentChangeTokenToLastConsumedWithError {clientID: %{public}@}", v2);
  OUTLINED_FUNCTION_3_1();
}

- (void)compareCurrentChangeTokenToLastConsumedWithResult:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1B4A39000, v0, v1, "REMDAChangeTrackingHelper: Cannot get last current change token when compareCurrentChangeTokenToLastConsumedWithError {clientID: %{public}@}", v2);
  OUTLINED_FUNCTION_3_1();
}

- (void)compareCurrentChangeTokenToLastConsumedWithResult:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1B4A39000, v0, v1, "REMDAChangeTrackingHelper: Fails to compare current token with last consumed when compareCurrentChangeTokenToLastConsumedWithError {clientID: %{public}@}", v2);
  OUTLINED_FUNCTION_3_1();
}

- (void)fetchChangesSinceLastConsumed
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1B4A39000, a2, v5, "REMDAChangeTrackingHelper: Had problem getting change history for account \"%{public}@\", v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)_changedModelObjectsOfClass:(uint64_t)a1 ofChangeTypes:(NSObject *)a2 shouldOutputFetchedModels:.cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (objc_class *)OUTLINED_FUNCTION_13_0();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1B4A39000, a2, v5, "REMDAChangeTrackingHelper: ERROR: We didn't get a change tracking client so we have no change set to enumerate from %{public}@.", v6);

  OUTLINED_FUNCTION_2_2();
}

- (void)_changedModelObjectsOfClass:(uint64_t)a1 ofChangeTypes:(NSObject *)a2 shouldOutputFetchedModels:.cold.2(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (objc_class *)OUTLINED_FUNCTION_13_0();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1B4A39000, a2, v5, "REMDAChangeTrackingHelper: ERROR: Couldn't change tracking client ID to enumerate changed objects from %{public}@.", v6);

  OUTLINED_FUNCTION_2_2();
}

- (void)_changedModelObjectsOfClass:ofChangeTypes:shouldOutputFetchedModels:.cold.3()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_13_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v2, v3, "REMDAChangeTrackingHelper: ERROR: Couldn't get REM account objectID to enumerate changed objects from %{public}@ for %{public}@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

void __97__REMDAChangeTrackingHelper__changedModelObjectsOfClass_ofChangeTypes_shouldOutputFetchedModels___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543874;
  v9 = v5;
  v10 = 2114;
  v11 = a2;
  v12 = 2114;
  v13 = v6;
  OUTLINED_FUNCTION_8_0(&dword_1B4A39000, a3, v7, "REMDAChangeTrackingHelper: Why does the just inserted object got a deletionKey? {objectID: %{public}@, deletionKey: %{public}@, clientID: %{public}@}", (uint8_t *)&v8);

}

- (void)_handleIsConcealedUpdatesInChange:(uint64_t)a3 ofModelClass:(NSObject *)a4 forClientID:concealedHandler:unconcealedHandler:.cold.1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543874;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = 0;
  *(_WORD *)(a3 + 22) = 2114;
  *(_QWORD *)(a3 + 24) = a2;
  OUTLINED_FUNCTION_8_0(&dword_1B4A39000, a4, a3, "REMDAChangeTrackingHelper: (Can be legit) Couldn't even fetch the concealed object with includeConcealedObjects=YES and we can only return nil deletion key {objectID: %{public}@, modelObject: %{public}@, clientID: %{public}@}", (uint8_t *)a3);

}

- (void)_fetchModelObjectOfClass:withObjectID:includeConcealedObjects:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  OUTLINED_FUNCTION_7_1();
  v2 = (objc_class *)OUTLINED_FUNCTION_6_0(v0, v1);
  NSStringFromClass(v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v3, v4, "REMDAChangeTrackingHelper: _fetchModelObjectOfClass:withObjectID:includeConcealedObjects: Cannot proceed to fetch because the change objectID is nil {clientID: %{public}@, model: %{public}@}.", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)_fetchModelObjectOfClass:withObjectID:includeConcealedObjects:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_1();
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(v0, v1), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v3, v4, "REMDAChangeTrackingHelper: _fetchModelObjectOfClass:withObjectID:includeConcealedObjects: failed {clientID: %{public}@, error: %@}", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)_fetchModelObjectOfClass:withObjectID:includeConcealedObjects:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, v0, v1, "rem_log_fault_if (!remStore) -- REMDAChangeTrackingHelper: remStore is nil when trying to _fetchModelObjectOfClass:withObjectID:includeConcealedObjects:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_fetchModelObjectsOfClass:withObjectIDs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, v0, v1, "rem_log_fault_if (!remStore) -- REMDAChangeTrackingHelper: remStore is nil when trying to _fetchModelObjectsOfClass:withObjectIDs:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_rem_changeTracking:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_1B4A39000, a2, v5, "REMDAChangeTrackingHelper: ERROR: Couldn't get a change tracking client from store for DataAccess from {account %{public}@}.", v6);

  OUTLINED_FUNCTION_1_1();
}

@end
