@implementation REMListsDataView

- (REMListsDataView)initWithStore:(id)a3
{
  id v5;
  REMListsDataView *v6;
  REMListsDataView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListsDataView;
  v6 = -[REMListsDataView init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (id)fetchListsInAccount:(id)a3 error:(id *)a4
{
  id v6;
  REMListsDataViewInvocation_fetchListsInAccount *v7;
  void *v8;
  REMListsDataViewInvocation_fetchListsInAccount *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = [REMListsDataViewInvocation_fetchListsInAccount alloc];
  objc_msgSend(v6, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[REMListsDataViewInvocation_fetchListsInAccount initWithParentAccountObjectID:](v7, "initWithParentAccountObjectID:", v8);
  -[REMListsDataView store](self, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resultFromPerformingInvocation:error:", v9, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_opt_class();
  REMDynamicCast(v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accountStorages");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "listStorages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListsDataView store](self, "store");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMListsDataView listsFromAccountStorages:listStorages:store:requestedListIDs:](REMListsDataView, "listsFromAccountStorages:listStorages:store:requestedListIDs:", v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)fetchListsAndSublistsInAccount:(id)a3 error:(id *)a4
{
  id v6;
  REMListsDataViewInvocation_fetchListsAndSublistsInAccount *v7;
  void *v8;
  REMListsDataViewInvocation_fetchListsAndSublistsInAccount *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = [REMListsDataViewInvocation_fetchListsAndSublistsInAccount alloc];
  objc_msgSend(v6, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[REMListsDataViewInvocation_fetchListsAndSublistsInAccount initWithParentAccountObjectID:](v7, "initWithParentAccountObjectID:", v8);
  -[REMListsDataView store](self, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resultFromPerformingInvocation:error:", v9, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_opt_class();
  REMDynamicCast(v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accountStorages");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "listStorages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListsDataView store](self, "store");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMListsDataView listsFromAccountStorages:listStorages:store:requestedListIDs:](REMListsDataView, "listsFromAccountStorages:listStorages:store:requestedListIDs:", v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)fetchListsInGroup:(id)a3 error:(id *)a4
{
  id v6;
  REMListsDataViewInvocation_fetchListsInGroup *v7;
  void *v8;
  REMListsDataViewInvocation_fetchListsInGroup *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = [REMListsDataViewInvocation_fetchListsInGroup alloc];
  objc_msgSend(v6, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[REMListsDataViewInvocation_fetchListsInGroup initWithParentGroupObjectID:](v7, "initWithParentGroupObjectID:", v8);
  -[REMListsDataView store](self, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resultFromPerformingInvocation:error:", v9, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_opt_class();
  REMDynamicCast(v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accountStorages");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "listStorages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListsDataView store](self, "store");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMListsDataView listsFromAccountStorages:listStorages:store:requestedListIDs:](REMListsDataView, "listsFromAccountStorages:listStorages:store:requestedListIDs:", v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)fetchListWithObjectID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListsDataView fetchListsWithObjectIDs:error:](self, "fetchListsWithObjectIDs:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_7;
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[REMLogStore read](REMLogStore, "read");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[REMListsDataView fetchListWithObjectID:error:].cold.1((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);

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

- (id)fetchListsWithObjectIDs:(id)a3 error:(id *)a4
{
  id v6;
  REMListsDataViewInvocation_fetchByObjectIDs *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v25;
  REMListsDataViewInvocation_fetchByObjectIDs *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = -[REMListsDataViewInvocation_fetchByObjectIDs initWithObjectIDs:]([REMListsDataViewInvocation_fetchByObjectIDs alloc], "initWithObjectIDs:", v6);
    -[REMListsDataView store](self, "store");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resultFromPerformingInvocation:error:", v7, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_opt_class();
    REMDynamicCast(v10, (uint64_t)v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accountStorages");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "listStorages");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMListsDataView store](self, "store");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[REMListsDataView listsFromAccountStorages:listStorages:store:requestedListIDs:](REMListsDataView, "listsFromAccountStorages:listStorages:store:requestedListIDs:", v12, v13, v14, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v25 = v9;
      v26 = v7;
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v15, "count"));
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v17 = v15;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v28 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_msgSend(v22, "objectID", v25, v26, (_QWORD)v27);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, v23);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v19);
      }

      v9 = v25;
      v7 = v26;
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v16;
}

- (id)fetchEligibleDefaultListsWithError:(id *)a3
{
  void *v5;
  _BOOL8 v6;
  REMListsDataViewInvocation_fetchUserSelectableDefaultLists *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[REMListsDataView store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mode") == 4599;

  v7 = -[REMListsDataViewInvocation_fetchUserSelectableDefaultLists initWithDebugUseInMemoryPreferredDefaultListStorage:]([REMListsDataViewInvocation_fetchUserSelectableDefaultLists alloc], "initWithDebugUseInMemoryPreferredDefaultListStorage:", v6);
  -[REMListsDataView store](self, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resultFromPerformingInvocation:error:", v7, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  REMDynamicCast(v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountStorages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "listStorages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListsDataView store](self, "store");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMListsDataView listsFromAccountStorages:listStorages:store:requestedListIDs:](REMListsDataView, "listsFromAccountStorages:listStorages:store:requestedListIDs:", v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)fetchDefaultListWithError:(id *)a3
{
  void *v5;
  _BOOL8 v6;
  REMListsDataViewInvocation_fetchDefaultList *v7;
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

  -[REMListsDataView store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mode") == 4599;

  v7 = -[REMListsDataViewInvocation_fetchDefaultList initWithDebugUseInMemoryPreferredDefaultListStorage:]([REMListsDataViewInvocation_fetchDefaultList alloc], "initWithDebugUseInMemoryPreferredDefaultListStorage:", v6);
  -[REMListsDataView store](self, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resultFromPerformingInvocation:error:", v7, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  REMDynamicCast(v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountStorages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "listStorages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListsDataView store](self, "store");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMListsDataView listsFromAccountStorages:listStorages:store:requestedListIDs:](REMListsDataView, "listsFromAccountStorages:listStorages:store:requestedListIDs:", v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)fetchDefaultListRequiringCloudKitWithAccountID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  _BOOL8 v8;
  REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit *v9;
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

  v6 = a3;
  -[REMListsDataView store](self, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mode") == 4599;

  v9 = -[REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit initWithAccountObjectID:debugUseInMemoryPreferredDefaultListStorage:]([REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit alloc], "initWithAccountObjectID:debugUseInMemoryPreferredDefaultListStorage:", v6, v8);
  -[REMListsDataView store](self, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resultFromPerformingInvocation:error:", v9, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_opt_class();
  REMDynamicCast(v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accountStorages");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "listStorages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListsDataView store](self, "store");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMListsDataView listsFromAccountStorages:listStorages:store:requestedListIDs:](REMListsDataView, "listsFromAccountStorages:listStorages:store:requestedListIDs:", v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)debugFetchPhantomListsWithError:(id *)a3
{
  REMListsDataViewInvocation_debugFetchPhantomLists *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = objc_alloc_init(REMListsDataViewInvocation_debugFetchPhantomLists);
  -[REMListsDataView store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultFromPerformingInvocation:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  REMDynamicCast(v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountStorages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "listStorages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListsDataView store](self, "store");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMListsDataView listsFromAccountStorages:listStorages:store:requestedListIDs:](REMListsDataView, "listsFromAccountStorages:listStorages:store:requestedListIDs:", v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)listsFromAccountStorages:(id)a3 listStorages:(id)a4 store:(id)a5 requestedListIDs:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  +[REMListsDataView listsFromAccountStorages:listStorages:store:](REMListsDataView, "listsFromAccountStorages:listStorages:store:", a3, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)listsFromAccountStorages:(id)a3 listStorages:(id)a4 store:(id)a5 requestedExternalIdentifiers:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  +[REMListsDataView listsFromAccountStorages:listStorages:store:](REMListsDataView, "listsFromAccountStorages:listStorages:store:", a3, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v34 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v19, "externalIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, v20);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v16);
    }

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v22 = v9;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v30 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j), (_QWORD)v29);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
            objc_msgSend(v21, "addObject:", v27);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v24);
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)listsFromAccounts:(id)a3 listStorages:(id)a4 store:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  REMList *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v7 = a4;
  v8 = a5;
  if (v7)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v30 = v7;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v37 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v15, "accountID", v30);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = -[REMList initWithStore:account:storage:]([REMList alloc], "initWithStore:account:storage:", v8, v17, v15);
          -[REMList objectID](v18, "objectID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, v19);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v12);
    }

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v9, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v33 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j), v30);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "storage");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "parentListID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setParentList:", v28);

          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v22);
    }

    v7 = v30;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)listsFromAccountStorages:(id)a3 listStorages:(id)a4 store:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  +[REMAccountsDataView accountsFromAccountStorages:store:](REMAccountsDataView, "accountsFromAccountStorages:store:", a3, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMListsDataView listsFromAccounts:listStorages:store:](REMListsDataView, "listsFromAccounts:listStorages:store:", v9, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

- (id)fetchListsIncludingSpecialContainersInAccount:(id)a3 error:(id *)a4
{
  id v6;
  REMListsDataViewInvocation_dataAccessFetchListsInAccount *v7;
  void *v8;
  REMListsDataViewInvocation_dataAccessFetchListsInAccount *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = [REMListsDataViewInvocation_dataAccessFetchListsInAccount alloc];
  objc_msgSend(v6, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[REMListsDataViewInvocation_dataAccessFetchListsInAccount initWithParentAccountObjectID:](v7, "initWithParentAccountObjectID:", v8);
  -[REMListsDataView store](self, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resultFromPerformingInvocation:error:", v9, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_opt_class();
  REMDynamicCast(v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accountStorages");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "listStorages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListsDataView store](self, "store");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMListsDataView listsFromAccountStorages:listStorages:store:](REMListsDataView, "listsFromAccountStorages:listStorages:store:", v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)fetchListIncludingSpecialContainerWithObjectID:(id)a3 error:(id *)a4
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
  -[REMListsDataView fetchListsIncludingSpecialContainersWithObjectIDs:error:](self, "fetchListsIncludingSpecialContainersWithObjectIDs:error:", v7, a4);
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
      _os_log_impl(&dword_1B4A39000, v10, OS_LOG_TYPE_DEFAULT, "REMListsDataView: Requested to fetch non-existent list {objectID: %{public}@}", (uint8_t *)&v12, 0xCu);
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

- (id)fetchListsIncludingSpecialContainersWithObjectIDs:(id)a3 error:(id *)a4
{
  id v6;
  REMListsDataViewInvocation_dataAccessFetchByObjectID *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v25;
  REMListsDataViewInvocation_dataAccessFetchByObjectID *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[REMListsDataViewInvocation_dataAccessFetchByObjectID initWithObjectIDs:]([REMListsDataViewInvocation_dataAccessFetchByObjectID alloc], "initWithObjectIDs:", v6);
  -[REMListsDataView store](self, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resultFromPerformingInvocation:error:", v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  REMDynamicCast(v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountStorages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "listStorages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListsDataView store](self, "store");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMListsDataView listsFromAccountStorages:listStorages:store:requestedListIDs:](REMListsDataView, "listsFromAccountStorages:listStorages:store:requestedListIDs:", v12, v13, v14, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v25 = v9;
    v26 = v7;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v22, "objectID", v25, v26, (_QWORD)v27);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, v23);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v19);
    }

    v9 = v25;
    v7 = v26;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)fetchListIncludingSpecialContainerWithExternalIdentifier:(id)a3 inAccount:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v18[0] = v8;
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a4;
  objc_msgSend(v9, "arrayWithObjects:count:", v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListsDataView fetchListsWithExternalIdentifiers:inAccount:error:](self, "fetchListsWithExternalIdentifiers:inAccount:error:", v11, v10, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_7;
  objc_msgSend(v12, "objectForKeyedSubscript:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    +[REMLogStore read](REMLogStore, "read");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = v8;
      _os_log_impl(&dword_1B4A39000, v14, OS_LOG_TYPE_DEFAULT, "REMListsDataView: Requested to fetch non-existent list {externalIdentifier: %{public}@}", (uint8_t *)&v16, 0xCu);
    }

    if (a5)
    {
      +[REMError noSuchObjectErrorWithExternalIdentifier:](REMError, "noSuchObjectErrorWithExternalIdentifier:", v8);
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v13 = 0;
  }
LABEL_8:

  return v13;
}

- (id)fetchListsWithExternalIdentifiers:(id)a3 inAccount:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier *v10;
  void *v11;
  REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v30;
  REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = [REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier alloc];
  objc_msgSend(v9, "objectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier initWithExternalIdentifiers:accountObjectID:](v10, "initWithExternalIdentifiers:accountObjectID:", v8, v11);

  -[REMListsDataView store](self, "store");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resultFromPerformingInvocation:error:", v12, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_opt_class();
  REMDynamicCast(v15, (uint64_t)v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accountStorages");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "listStorages");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListsDataView store](self, "store");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMListsDataView listsFromAccountStorages:listStorages:store:requestedExternalIdentifiers:](REMListsDataView, "listsFromAccountStorages:listStorages:store:requestedExternalIdentifiers:", v17, v18, v19, v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v30 = v14;
    v31 = v12;
    v32 = v9;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v20, "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v22 = v20;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v34 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v27, "externalIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v27, v28);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v24);
    }

    v12 = v31;
    v9 = v32;
    v14 = v30;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)fetchListIncludingConcealedWithObjectID:(id)a3 includeMarkedForDeletionOnly:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed *v9;
  void *v10;
  REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  int v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v34;
  void *v35;
  REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed *v36;
  id *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  id v43;
  _BYTE v44[128];
  id v45;
  _QWORD v46[3];

  v6 = a4;
  v46[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = [REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed alloc];
  v46[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed initWithObjectIDs:](v9, "initWithObjectIDs:", v10);

  -[REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed setIncludeMarkedForDeletionOnly:](v11, "setIncludeMarkedForDeletionOnly:", v6);
  -[REMListsDataView store](self, "store");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = a5;
  objc_msgSend(v12, "resultFromPerformingInvocation:error:", v11, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_opt_class();
  REMDynamicCast(v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accountStorages");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "listStorages");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListsDataView store](self, "store");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMListsDataView listsFromAccountStorages:listStorages:store:requestedListIDs:](REMListsDataView, "listsFromAccountStorages:listStorages:store:requestedListIDs:", v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    goto LABEL_18;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (!v22)
  {

    goto LABEL_14;
  }
  v23 = v22;
  v34 = v15;
  v35 = v13;
  v36 = v11;
  v24 = 0;
  v25 = *(_QWORD *)v39;
  do
  {
    for (i = 0; i != v23; ++i)
    {
      if (*(_QWORD *)v39 != v25)
        objc_enumerationMutation(v21);
      v27 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
      objc_msgSend(v27, "objectID", v34, v35, v36);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isEqual:", v8);

      if (v29)
      {
        v30 = v27;

        v24 = v30;
      }
    }
    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  }
  while (v23);

  v13 = v35;
  v11 = v36;
  v15 = v34;
  if (!v24)
  {
LABEL_14:
    +[REMLogStore read](REMLogStore, "read");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v43 = v8;
      _os_log_impl(&dword_1B4A39000, v31, OS_LOG_TYPE_DEFAULT, "REMListsDataView: Requested to fetch non-existent list {objectID: %{public}@}", buf, 0xCu);
    }

    if (v37)
    {
      +[REMError noSuchObjectErrorWithObjectID:](REMError, "noSuchObjectErrorWithObjectID:", v8);
      v24 = 0;
      *v37 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_18:
    v24 = 0;
  }
LABEL_19:
  v32 = v24;

  return v32;
}

- (id)fetchAllListsWithExternalIdentifier:(id)a3 inAccount:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  REMListsDataViewInvocation_userActivityFetchByExternalIdentifier *v10;
  void *v11;
  REMListsDataViewInvocation_userActivityFetchByExternalIdentifier *v12;
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
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = [REMListsDataViewInvocation_userActivityFetchByExternalIdentifier alloc];
  v28 = v9;
  objc_msgSend(v9, "objectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[REMListsDataViewInvocation_userActivityFetchByExternalIdentifier initWithExternalIdentifier:accountObjectID:](v10, "initWithExternalIdentifier:accountObjectID:", v8, v11);

  -[REMListsDataView store](self, "store");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resultFromPerformingInvocation:error:", v12, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_opt_class();
  REMDynamicCast(v15, (uint64_t)v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accountStorages");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "listStorages");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListsDataView store](self, "store");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMListsDataView listsFromAccountStorages:listStorages:store:](REMListsDataView, "listsFromAccountStorages:listStorages:store:", v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "allValues");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21 && objc_msgSend(v21, "count"))
  {
    v23 = v22;
    v24 = v28;
  }
  else
  {
    +[REMLogStore read](REMLogStore, "read");
    v25 = objc_claimAutoreleasedReturnValue();
    v24 = v28;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v28, "remObjectID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v8;
      v31 = 2114;
      v32 = v26;
      _os_log_impl(&dword_1B4A39000, v25, OS_LOG_TYPE_DEFAULT, "REMListsDataView: Requested to fetch non-existent lists in account with {externalIdentifier: %{public}@, account.remObjectID: %{public}@}", buf, 0x16u);

    }
    if (a5)
    {
      +[REMError noSuchObjectErrorWithExternalIdentifier:](REMError, "noSuchObjectErrorWithExternalIdentifier:", v8);
      v23 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

- (id)fetchListRepresentationOfTemplateWithObjectID:(id)a3 error:(id *)a4
{
  id v6;
  REMListsDataViewInvocation_fetchByTemplateObjectID *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  char v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id *v34;
  REMListsDataViewInvocation_fetchByTemplateObjectID *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _QWORD v41[3];

  v41[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[REMListsDataViewInvocation_fetchByTemplateObjectID initWithTemplateObjectID:]([REMListsDataViewInvocation_fetchByTemplateObjectID alloc], "initWithTemplateObjectID:", v6);
  -[REMListsDataView store](self, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = a4;
  v35 = v7;
  objc_msgSend(v8, "resultFromPerformingInvocation:error:", v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  REMDynamicCast(v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountStorages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "listStorages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListsDataView store](self, "store");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMListsDataView listsFromAccountStorages:listStorages:store:requestedListIDs:](REMListsDataView, "listsFromAccountStorages:listStorages:store:requestedListIDs:", v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v37 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v22, "objectID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqual:", v6);

        if ((v24 & 1) != 0)
        {
          v32 = v22;

          goto LABEL_14;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v19)
        continue;
      break;
    }
  }

  if (v34)
  {
    +[REMLogStore read](REMLogStore, "read");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[REMListsDataView(Templates) fetchListRepresentationOfTemplateWithObjectID:error:].cold.1((uint64_t)v6, v25, v26, v27, v28, v29, v30, v31);

    +[REMError noSuchObjectErrorWithObjectID:](REMError, "noSuchObjectErrorWithObjectID:", v6);
    v32 = 0;
    *v34 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }
LABEL_14:

  return v32;
}

- (void)fetchListWithObjectID:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, a2, a3, "REMListsDataView: Requested to fetch non-existent list {objectID: %{public}@}", a5, a6, a7, a8, 2u);
}

@end
