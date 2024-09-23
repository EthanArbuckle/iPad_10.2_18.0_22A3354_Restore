@implementation REMSmartListsDataView

- (REMSmartListsDataView)initWithStore:(id)a3
{
  id v5;
  REMSmartListsDataView *v6;
  REMSmartListsDataView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMSmartListsDataView;
  v6 = -[REMSmartListsDataView init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (id)fetchNonCustomSmartListWithSmartListType:(id)a3 createIfNeeded:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  REMSmartListsDataViewInvocation_fetchSmartList *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a4;
  v8 = a3;
  v9 = -[REMSmartListsDataViewInvocation_fetchSmartList initWithSmartListType:objectID:createIfNeeded:]([REMSmartListsDataViewInvocation_fetchSmartList alloc], "initWithSmartListType:objectID:createIfNeeded:", v8, 0, v6);

  -[REMSmartListsDataView store](self, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resultFromPerformingInvocation:error:", v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_opt_class();
  REMDynamicCast(v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "smartListStorages");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v13, "smartListStorages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accountStorages");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "parentListStorages");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMSmartListsDataView store](self, "store");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[REMSmartListsDataView smartListsFromSmartListStorages:accountStorages:parentListStorages:store:](REMSmartListsDataView, "smartListsFromSmartListStorages:accountStorages:parentListStorages:store:", v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)fetchCustomSmartListWithObjectID:(id)a3 error:(id *)a4
{
  id v6;
  REMSmartListsDataViewInvocation_fetchSmartList *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = -[REMSmartListsDataViewInvocation_fetchSmartList initWithSmartListType:objectID:createIfNeeded:]([REMSmartListsDataViewInvocation_fetchSmartList alloc], "initWithSmartListType:objectID:createIfNeeded:", CFSTR("com.apple.reminders.smartlist.custom"), v6, 0);

  -[REMSmartListsDataView store](self, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resultFromPerformingInvocation:error:", v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  REMDynamicCast(v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "smartListStorages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v11, "smartListStorages");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accountStorages");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "parentListStorages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMSmartListsDataView store](self, "store");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[REMSmartListsDataView smartListsFromSmartListStorages:accountStorages:parentListStorages:store:](REMSmartListsDataView, "smartListsFromSmartListStorages:accountStorages:parentListStorages:store:", v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)fetchCustomSmartListsWithError:(id *)a3
{
  REMSmartListsDataViewInvocation_fetchAllCustomSmartLists *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = objc_alloc_init(REMSmartListsDataViewInvocation_fetchAllCustomSmartLists);
  -[REMSmartListsDataView store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultFromPerformingInvocation:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  REMDynamicCast(v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "smartListStorages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v9, "smartListStorages");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accountStorages");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "parentListStorages");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMSmartListsDataView store](self, "store");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[REMSmartListsDataView smartListsFromSmartListStorages:accountStorages:parentListStorages:store:](REMSmartListsDataView, "smartListsFromSmartListStorages:accountStorages:parentListStorages:store:", v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)fetchCustomSmartListsInAccount:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  REMSmartListsDataViewInvocation_fetchCustomSmartListsInAccount *v9;
  void *v10;
  REMSmartListsDataViewInvocation_fetchCustomSmartListsInAccount *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;

  v6 = a3;
  objc_msgSend(v6, "capabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportsCustomSmartLists");

  if ((v8 & 1) != 0)
  {
    v9 = [REMSmartListsDataViewInvocation_fetchCustomSmartListsInAccount alloc];
    objc_msgSend(v6, "objectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[REMSmartListsDataViewInvocation_fetchCustomSmartListsInAccount initWithParentAccountObjectID:](v9, "initWithParentAccountObjectID:", v10);

    -[REMSmartListsDataView store](self, "store");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resultFromPerformingInvocation:error:", v11, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_opt_class();
    REMDynamicCast(v14, (uint64_t)v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "smartListStorages");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v15, "smartListStorages");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "accountStorages");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "parentListStorages");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSmartListsDataView store](self, "store");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[REMSmartListsDataView smartListsFromSmartListStorages:accountStorages:parentListStorages:store:](REMSmartListsDataView, "smartListsFromSmartListStorages:accountStorages:parentListStorages:store:", v17, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    +[REMLogStore read](REMLogStore, "read");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[REMSmartListsDataView fetchCustomSmartListsInAccount:error:].cold.1(v6);

    v21 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v21;
}

- (id)fetchCustomSmartListsInGroup:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  REMSmartListsDataViewInvocation_fetchCustomSmartListsInGroup *v10;
  void *v11;
  REMSmartListsDataViewInvocation_fetchCustomSmartListsInGroup *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;

  v6 = a3;
  objc_msgSend(v6, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "capabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportsCustomSmartLists");

  if ((v9 & 1) != 0)
  {
    v10 = [REMSmartListsDataViewInvocation_fetchCustomSmartListsInGroup alloc];
    objc_msgSend(v6, "objectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[REMSmartListsDataViewInvocation_fetchCustomSmartListsInGroup initWithParentGroupObjectID:](v10, "initWithParentGroupObjectID:", v11);

    -[REMSmartListsDataView store](self, "store");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resultFromPerformingInvocation:error:", v12, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_opt_class();
    REMDynamicCast(v15, (uint64_t)v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "smartListStorages");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v16, "smartListStorages");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "accountStorages");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "parentListStorages");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSmartListsDataView store](self, "store");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[REMSmartListsDataView smartListsFromSmartListStorages:accountStorages:parentListStorages:store:](REMSmartListsDataView, "smartListsFromSmartListStorages:accountStorages:parentListStorages:store:", v18, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    +[REMLogStore read](REMLogStore, "read");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[REMSmartListsDataView fetchCustomSmartListsInGroup:error:].cold.1(v6);

    v22 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v22;
}

+ (id)smartListsFromSmartListStorages:(id)a3 accountStorages:(id)a4 parentListStorages:(id)a5 store:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  BOOL v22;
  REMSmartList *v23;
  REMAccount *v24;
  REMList *v25;
  REMSmartList *v26;
  id obj;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v31 = a4;
  v30 = a5;
  v10 = a6;
  v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v15, "remObjectID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "remObjectID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "smartListType");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.reminders.smartlist.custom"));

        if (v21)
          v22 = v17 == 0;
        else
          v22 = 1;
        if (v22)
        {
          v23 = -[REMSmartList initWithStore:storage:]([REMSmartList alloc], "initWithStore:storage:", v10, v15);
          objc_msgSend(v29, "addObject:", v23);
        }
        else
        {
          v24 = -[REMAccount initWithStore:storage:]([REMAccount alloc], "initWithStore:storage:", v10, v17);
          v23 = (REMSmartList *)v24;
          if (v19)
            v25 = -[REMList initWithStore:account:storage:]([REMList alloc], "initWithStore:account:storage:", v10, v24, v19);
          else
            v25 = 0;
          v26 = -[REMSmartList initWithStore:account:parentList:storage:]([REMSmartList alloc], "initWithStore:account:parentList:storage:", v10, v23, v25, v15);
          objc_msgSend(v29, "addObject:", v26);

        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v12);
  }

  return v29;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)fetchCustomSmartListsInAccount:(void *)a1 error:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "objectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v2, v3, "The given account does not support CSL fetching {accountID: %{public}@}", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)fetchCustomSmartListsInGroup:(void *)a1 error:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "objectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v2, v3, "The given group is not from an account that supports CSL fetching {groupID: %{public}@}", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_2();
}

@end
