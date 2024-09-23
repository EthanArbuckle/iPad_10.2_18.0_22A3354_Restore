@implementation REMAccountsDataView

- (id)fetchPrimaryActiveCloudKitAccountREMObjectIDWithError:(id *)a3
{
  REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  NSObject *v17;

  v5 = -[REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount initWithFetchREMObjectIDOnly:]([REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount alloc], "initWithFetchREMObjectIDOnly:", 1);
  -[REMAccountsDataView store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultFromPerformingInvocation:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  REMDynamicCast(v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    objc_msgSend(v9, "accountIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 >= 2)
    {
      +[REMLogStore read](REMLogStore, "read");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[REMAccountsDataView fetchPrimaryActiveCloudKitAccountREMObjectIDWithError:].cold.1(v9);

    }
    objc_msgSend(v9, "accountIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a3)
  {
    +[REMError noPrimaryActiveCloudKitAccountError](REMError, "noPrimaryActiveCloudKitAccountError");
    v15 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

- (REMAccountsDataView)initWithStore:(id)a3
{
  id v5;
  REMAccountsDataView *v6;
  REMAccountsDataView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAccountsDataView;
  v6 = -[REMAccountsDataView init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (id)fetchAllAccountsWithError:(id *)a3
{
  REMAccountsDataViewInvocation_fetchAll *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = -[REMAccountsDataViewInvocation_fetchAll initWithPurpose:]([REMAccountsDataViewInvocation_fetchAll alloc], "initWithPurpose:", 0);
  -[REMAccountsDataView store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultFromPerformingInvocation:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  REMDynamicCast(v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountStorages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAccountsDataView accountsFromStorages:](self, "accountsFromStorages:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)fetchAllAccountsForAccountManagementWithError:(id *)a3
{
  REMAccountsDataViewInvocation_fetchAll *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = -[REMAccountsDataViewInvocation_fetchAll initWithPurpose:]([REMAccountsDataViewInvocation_fetchAll alloc], "initWithPurpose:", 1);
  -[REMAccountsDataView store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultFromPerformingInvocation:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  REMDynamicCast(v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountStorages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAccountsDataView accountsFromStorages:](self, "accountsFromStorages:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)fetchAllAccountsForDumpingWithError:(id *)a3
{
  REMAccountsDataViewInvocation_fetchAll *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = -[REMAccountsDataViewInvocation_fetchAll initWithPurpose:]([REMAccountsDataViewInvocation_fetchAll alloc], "initWithPurpose:", 2);
  -[REMAccountsDataView store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultFromPerformingInvocation:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  REMDynamicCast(v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountStorages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAccountsDataView accountsFromStorages:](self, "accountsFromStorages:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)fetchPrimaryActiveCloudKitAccountWithError:(id *)a3
{
  REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v14;

  v5 = -[REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount initWithFetchREMObjectIDOnly:]([REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount alloc], "initWithFetchREMObjectIDOnly:", 0);
  -[REMAccountsDataView store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultFromPerformingInvocation:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  REMDynamicCast(v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountStorages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAccountsDataView accountsFromStorages:](self, "accountsFromStorages:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    if ((unint64_t)objc_msgSend(v11, "count") >= 2)
    {
      +[REMLogStore read](REMLogStore, "read");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[REMAccountsDataView fetchPrimaryActiveCloudKitAccountWithError:].cold.1(v11);

    }
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    +[REMError noPrimaryActiveCloudKitAccountError](REMError, "noPrimaryActiveCloudKitAccountError");
    v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)fetchActiveCloudKitAccountObjectIDsWithFetchOption:(int64_t)a3 error:(id *)a4
{
  REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;
  void *v15;
  id v17;

  v6 = -[REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs initWithFetchOption:]([REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs alloc], "initWithFetchOption:", a3);
  -[REMAccountsDataView store](self, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v7, "resultFromPerformingInvocation:error:", v6, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;

  v10 = objc_opt_class();
  REMDynamicCast(v10, (uint64_t)v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = v9 == 0;
  else
    v13 = 0;
  if (v13)
  {
    objc_msgSend(v11, "accountIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    if (v9)
    {
      v14 = objc_retainAutorelease(v9);
    }
    else
    {
      +[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", CFSTR("Unknown error in fetchActiveCloudKitAccountObjectIDsWithOption yielding nil fetchResult.accountIDs"));
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = 0;
    *a4 = v14;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)fetchAccountWithObjectID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAccountsDataView fetchAccountsWithObjectIDs:error:](self, "fetchAccountsWithObjectIDs:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_7;
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[REMLogStore read](REMLogStore, "read");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_1B4A39000, v10, OS_LOG_TYPE_DEFAULT, "REMAccountsDataView: Requested to fetch non-existent account {objectID: %{public}@}", (uint8_t *)&v12, 0xCu);
    }

    if (a4)
    {
      +[REMError noSuchObjectErrorWithObjectID:](REMError, "noSuchObjectErrorWithObjectID:", v6);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v9 = 0;
  }
LABEL_8:

  return v9;
}

- (id)fetchAccountsWithObjectIDs:(id)a3 error:(id *)a4
{
  id v6;
  REMAccountsDataViewInvocation_fetchByObjectID *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v23;
  REMAccountsDataViewInvocation_fetchByObjectID *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = -[REMAccountsDataViewInvocation_fetchByObjectID initWithObjectIDs:]([REMAccountsDataViewInvocation_fetchByObjectID alloc], "initWithObjectIDs:", v6);
    -[REMAccountsDataView store](self, "store");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resultFromPerformingInvocation:error:", v7, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_opt_class();
    REMDynamicCast(v10, (uint64_t)v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accountStorages");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMAccountsDataView accountsFromStorages:](self, "accountsFromStorages:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v23 = v9;
      v24 = v7;
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v13, "count"));
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v15 = v13;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v26 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            objc_msgSend(v20, "objectID", v23, v24, (_QWORD)v25);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, v21);

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v17);
      }

      v9 = v23;
      v7 = v24;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v14;
}

- (id)fetchAccountWithExternalIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAccountsDataView fetchAccountsWithExternalIdentifiers:error:](self, "fetchAccountsWithExternalIdentifiers:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_7;
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[REMLogStore read](REMLogStore, "read");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v6;
      _os_log_impl(&dword_1B4A39000, v10, OS_LOG_TYPE_DEFAULT, "REMAccountsDataView: Requested to fetch non-existent account {externalIdentifier: %{public}@}", (uint8_t *)&v12, 0xCu);
    }

    if (a4)
    {
      +[REMError noSuchObjectErrorWithExternalIdentifier:](REMError, "noSuchObjectErrorWithExternalIdentifier:", v6);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v9 = 0;
  }
LABEL_8:

  return v9;
}

- (id)fetchAccountsWithExternalIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  REMAccountsDataViewInvocation_fetchByExternalIdentifier *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  NSObject *v27;
  void *v29;
  void *v30;
  void *v31;
  REMAccountsDataViewInvocation_fetchByExternalIdentifier *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint8_t v45[4];
  uint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[REMAccountsDataViewInvocation_fetchByExternalIdentifier initWithExternalIdentifiers:]([REMAccountsDataViewInvocation_fetchByExternalIdentifier alloc], "initWithExternalIdentifiers:", v6);
  -[REMAccountsDataView store](self, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resultFromPerformingInvocation:error:", v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  REMDynamicCast(v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountStorages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMAccountsDataView accountsFromStorages:](self, "accountsFromStorages:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = 0;
    goto LABEL_24;
  }
  v30 = v11;
  v31 = v9;
  v32 = v7;
  v33 = v6;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v13, "count"));
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v29 = v13;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (!v16)
    goto LABEL_17;
  v17 = v16;
  v18 = *(_QWORD *)v36;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v36 != v18)
        objc_enumerationMutation(v15);
      v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
      objc_msgSend(v20, "externalIdentifier", v29);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        +[REMLogStore read](REMLogStore, "read");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[REMAccountsDataView fetchAccountsWithExternalIdentifiers:error:].cold.2(v45, v20, &v46, v23);
        goto LABEL_13;
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        +[REMLogStore read](REMLogStore, "read");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v14, "objectForKeyedSubscript:", v21);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "remObjectID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "remObjectID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v40 = v21;
          v41 = 2112;
          v42 = v24;
          v43 = 2112;
          v44 = v25;
          _os_log_error_impl(&dword_1B4A39000, v23, OS_LOG_TYPE_ERROR, "REMAccountsDataView -fetchAccountsWithExternalIdentifiers: More than 1 account found for the given external identifier {extID: %@, acctObjID1: %@, acctObjID2: %@}.", buf, 0x20u);

        }
LABEL_13:

        goto LABEL_15;
      }
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, v21);
LABEL_15:

    }
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  }
  while (v17);
LABEL_17:

  v26 = objc_msgSend(v15, "count");
  v6 = v33;
  if (v26 <= objc_msgSend(v33, "count"))
  {
    v9 = v31;
    v7 = v32;
    v11 = v30;
  }
  else
  {
    +[REMLogStore read](REMLogStore, "read");
    v27 = objc_claimAutoreleasedReturnValue();
    v11 = v30;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      -[REMAccountsDataView fetchAccountsWithExternalIdentifiers:error:].cold.1(v33, v15, v27);

    v9 = v31;
    v7 = v32;
  }
  v13 = v29;
LABEL_24:

  return v14;
}

- (id)accountsFromStorages:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  REMAccount *v12;
  void *v13;
  REMAccount *v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v16 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          v12 = [REMAccount alloc];
          -[REMAccountsDataView store](self, "store");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[REMAccount initWithStore:storage:](v12, "initWithStore:storage:", v13, v11);

          objc_msgSend(v5, "addObject:", v14);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    v4 = v16;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)accountsFromAccountStorages:(id)a3 store:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  REMAccount *v14;
  REMAccount *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
          v14 = [REMAccount alloc];
          v15 = -[REMAccount initWithStore:storage:](v14, "initWithStore:storage:", v6, v13, (_QWORD)v18);
          -[REMAccount objectID](v15, "objectID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v16);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)fetchPrimaryActiveCloudKitAccountREMObjectIDWithError:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "accountIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberWithUnsignedInteger:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v4, v5, "rem_log_fault_if (fetchResult.accountIDs.count > 1) -- Unexpectedly fetched more than 1 primary active cloudkit account REMObjectID {count: %@}", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)fetchPrimaryActiveCloudKitAccountWithError:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v2, v3, "rem_log_fault_if (accounts.count > 1) -- Unexpectedly fetched more than 1 primary active cloudkit account {count: %@}", v4, v5, v6, v7, 2u);

}

- (void)fetchAccountsWithExternalIdentifiers:(NSObject *)a3 error:.cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_fault_impl(&dword_1B4A39000, a3, OS_LOG_TYPE_FAULT, "REMAccountsDataView -fetchAccountsWithExternalIdentifiers: fetched more accounts than the number of external identifiers {expected: %@, actual: %@}.", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

- (void)fetchAccountsWithExternalIdentifiers:(_QWORD *)a3 error:(NSObject *)a4 .cold.2(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "remObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1B4A39000, a4, OS_LOG_TYPE_ERROR, "Request results with account without externalIdentifier {objectID: %@}", a1, 0xCu);

}

@end
