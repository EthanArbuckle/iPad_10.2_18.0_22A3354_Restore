@implementation REMListSectionsDataView

- (REMListSectionsDataView)initWithStore:(id)a3
{
  id v5;
  REMListSectionsDataView *v6;
  REMListSectionsDataView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListSectionsDataView;
  v6 = -[REMListSectionsDataView init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (id)fetchListSectionsWithListObjectID:(id)a3 error:(id *)a4
{
  id v6;
  REMListSectionsDataViewInvocation_fetchListSectionsInList *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;

  v6 = a3;
  if (v6)
  {
    v7 = -[REMListSectionsDataViewInvocation_fetchListSectionsInList initWithParentListObjectID:]([REMListSectionsDataViewInvocation_fetchListSectionsInList alloc], "initWithParentListObjectID:", v6);
    -[REMListSectionsDataView store](self, "store");
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
    objc_msgSend(v11, "listSectionStorages");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMListSectionsDataView store](self, "store");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMListSectionsDataView listSectionsFromAccountStorages:listStorages:listSectionStorages:store:](self, "listSectionsFromAccountStorages:listStorages:listSectionStorages:store:", v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[REMLogStore read](REMLogStore, "read");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[REMListSectionsDataView fetchListSectionsWithListObjectID:error:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "listObjectID");
    v16 = 0;
  }

  return v16;
}

- (id)fetchListSectionsInList:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListSectionsDataView fetchListSectionsWithListObjectID:error:](self, "fetchListSectionsWithListObjectID:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fetchListSectionsWithObjectIDs:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  REMListSectionsDataViewInvocation_fetchByObjectIDs *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v28;
  REMListSectionsDataViewInvocation_fetchByObjectIDs *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "count"))
    {
      v8 = -[REMListSectionsDataViewInvocation_fetchByObjectIDs initWithObjectIDs:]([REMListSectionsDataViewInvocation_fetchByObjectIDs alloc], "initWithObjectIDs:", v7);
      -[REMListSectionsDataView store](self, "store");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "resultFromPerformingInvocation:error:", v8, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_opt_class();
      REMDynamicCast(v11, (uint64_t)v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "accountStorages");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "listStorages");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "listSectionStorages");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListSectionsDataView store](self, "store");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListSectionsDataView listSectionsFromAccountStorages:listStorages:listSectionStorages:store:](self, "listSectionsFromAccountStorages:listStorages:listSectionStorages:store:", v13, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v28 = v10;
        v29 = v8;
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v17, "count"));
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v19 = v17;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v31 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
              objc_msgSend(v24, "objectID");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, v25);

            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          }
          while (v21);
        }

        v10 = v28;
        v8 = v29;
      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = (void *)MEMORY[0x1E0C9AA70];
    }
  }
  else
  {
    +[REMLogStore read](REMLogStore, "read");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      -[REMListSectionsDataView fetchListSectionsWithObjectIDs:error:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "objectIDs");
    v18 = 0;
  }

  return v18;
}

- (id)fetchListSectionWithObjectID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v20[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMListSectionsDataView fetchListSectionsWithObjectIDs:error:](self, "fetchListSectionsWithObjectIDs:error:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
LABEL_12:

        goto LABEL_13;
      }
      +[REMLogStore read](REMLogStore, "read");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[REMListSectionsDataView fetchListSectionWithObjectID:error:].cold.2((uint64_t)v7, v11, v12, v13, v14, v15, v16, v17);

      if (a4)
      {
        +[REMError noSuchObjectErrorWithObjectID:](REMError, "noSuchObjectErrorWithObjectID:", v7);
        v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    v10 = 0;
    goto LABEL_12;
  }
  +[REMLogStore read](REMLogStore, "read");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    -[REMListSectionsDataView fetchListSectionWithObjectID:error:].cold.1();

  NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
  v10 = 0;
LABEL_13:

  return v10;
}

- (id)fetchListSectionsCountWithListObjectID:(id)a3 error:(id *)a4
{
  id v6;
  REMListSectionsDataViewInvocation_fetchListSectionsCountInList *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a3;
  if (v6)
  {
    v7 = -[REMListSectionsDataViewInvocation_fetchListSectionsCountInList initWithParentListObjectID:]([REMListSectionsDataViewInvocation_fetchListSectionsCountInList alloc], "initWithParentListObjectID:", v6);
    -[REMListSectionsDataView store](self, "store");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resultFromPerformingInvocation:error:", v7, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_opt_class();
    objc_msgSend(v9, "storedPropertyForKey:", CFSTR("SectionsCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    REMDynamicCast(v10, (uint64_t)v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      +[REMLogStore read](REMLogStore, "read");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[REMListSectionsDataView fetchListSectionsCountWithListObjectID:error:].cold.2((uint64_t)v6, v15, v16, v17, v18, v19, v20, v21);

      if (a4 && !*a4)
      {
        +[REMError unexpectedError](REMError, "unexpectedError");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else
  {
    +[REMLogStore read](REMLogStore, "read");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[REMListSectionsDataView fetchListSectionsWithListObjectID:error:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "listObjectID");
    v12 = 0;
  }

  return v12;
}

- (id)listSectionsFromAccountStorages:(id)a3 listStorages:(id)a4 listSectionStorages:(id)a5 store:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  REMListSection *v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  +[REMListsDataView listsFromAccountStorages:listStorages:store:](REMListsDataView, "listsFromAccountStorages:listStorages:store:", a3, a4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v9;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v17, "listID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
          NSLog(CFSTR("'%s' is unexpectedly nil"), "listSectionStorage.listID");
        objc_msgSend(v17, "listID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[REMListSection initWithStore:list:storage:]([REMListSection alloc], "initWithStore:list:storage:", v10, v20, v17);
        objc_msgSend(v12, "addObject:", v21);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v14);
  }

  return v12;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)fetchListSectionsWithListObjectID:error:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)fetchListSectionsWithObjectIDs:error:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)fetchListSectionWithObjectID:error:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)fetchListSectionWithObjectID:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, a2, a3, "REMListSectionsDataView: Requested to fetch non-existent listSection {objectID: %{public}@}", a5, a6, a7, a8, 2u);
}

- (void)fetchListSectionsCountWithListObjectID:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, a2, a3, "Failed to fetch Sections count from list with listObjectID {listObjectID: %@}", a5, a6, a7, a8, 2u);
}

@end
