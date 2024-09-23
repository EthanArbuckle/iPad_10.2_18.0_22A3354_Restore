@implementation REMSmartListSectionsDataView

- (REMSmartListSectionsDataView)initWithStore:(id)a3
{
  id v5;
  REMSmartListSectionsDataView *v6;
  REMSmartListSectionsDataView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMSmartListSectionsDataView;
  v6 = -[REMSmartListSectionsDataView init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (id)fetchSmartListSectionsInSmartList:(id)a3 error:(id *)a4
{
  id v7;
  REMSmartListSectionsDataViewInvocation_fetchSmartListSectionsInSmartList *v8;
  void *v9;
  REMSmartListSectionsDataViewInvocation_fetchSmartListSectionsInSmartList *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;

  v7 = a3;
  if (v7)
  {
    v8 = [REMSmartListSectionsDataViewInvocation_fetchSmartListSectionsInSmartList alloc];
    objc_msgSend(v7, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[REMSmartListSectionsDataViewInvocation_fetchSmartListSectionsInSmartList initWithParentSmartListObjectID:](v8, "initWithParentSmartListObjectID:", v9);

    -[REMSmartListSectionsDataView store](self, "store");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resultFromPerformingInvocation:error:", v10, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_opt_class();
    REMDynamicCast(v13, (uint64_t)v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "accountStorages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "smartListStorages");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "groupStorages");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "smartListSectionStorages");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMSmartListSectionsDataView store](self, "store");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMSmartListSectionsDataView smartListSectionsFromAccountStorages:smartListStorages:groupStorages:smartListSectionStorages:store:](self, "smartListSectionsFromAccountStorages:smartListStorages:groupStorages:smartListSectionStorages:store:", v15, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[REMLogStore read](REMLogStore, "read");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[REMSmartListSectionsDataView fetchSmartListSectionsInSmartList:error:].cold.1((uint64_t)self, a2);

    NSLog(CFSTR("'%s' is unexpectedly nil"), "smartList");
    v20 = 0;
  }

  return v20;
}

- (id)fetchSmartListSectionsWithObjectIDs:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  REMSmartListSectionsDataViewInvocation_fetchByObjectIDs *v9;
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
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v30;
  REMSmartListSectionsDataViewInvocation_fetchByObjectIDs *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "count"))
    {
      v9 = -[REMSmartListSectionsDataViewInvocation_fetchByObjectIDs initWithObjectIDs:]([REMSmartListSectionsDataViewInvocation_fetchByObjectIDs alloc], "initWithObjectIDs:", v8);
      -[REMSmartListSectionsDataView store](self, "store");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "resultFromPerformingInvocation:error:", v9, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_opt_class();
      REMDynamicCast(v12, (uint64_t)v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "accountStorages");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "smartListStorages");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "groupStorages");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "smartListSectionStorages");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSmartListSectionsDataView store](self, "store");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSmartListSectionsDataView smartListSectionsFromAccountStorages:smartListStorages:groupStorages:smartListSectionStorages:store:](self, "smartListSectionsFromAccountStorages:smartListStorages:groupStorages:smartListSectionStorages:store:", v14, v15, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v30 = v11;
        v31 = v9;
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v19, "count"));
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v21 = v19;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v33 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              objc_msgSend(v26, "objectID");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setObject:forKeyedSubscript:", v26, v27);

            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          }
          while (v23);
        }

        v11 = v30;
        v9 = v31;
      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = (void *)MEMORY[0x1E0C9AA70];
    }
  }
  else
  {
    +[REMLogStore read](REMLogStore, "read");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      -[REMTemplateSectionsDataView fetchTemplateSectionsWithObjectIDs:error:].cold.1((uint64_t)self, a2);

    NSLog(CFSTR("'%s' is unexpectedly nil"), "objectIDs");
    v20 = 0;
  }

  return v20;
}

- (id)fetchSmartListSectionWithObjectID:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    v15[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMSmartListSectionsDataView fetchSmartListSectionsWithObjectIDs:error:](self, "fetchSmartListSectionsWithObjectIDs:error:", v9, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
LABEL_12:

        goto LABEL_13;
      }
      +[REMLogStore read](REMLogStore, "read");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[REMSmartListSectionsDataView fetchSmartListSectionWithObjectID:error:].cold.2((uint64_t)v8, v12);

      if (a4)
      {
        +[REMError noSuchObjectErrorWithObjectID:](REMError, "noSuchObjectErrorWithObjectID:", v8);
        v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    v11 = 0;
    goto LABEL_12;
  }
  +[REMLogStore read](REMLogStore, "read");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    -[REMTemplateSectionsDataView fetchTemplateSectionWithObjectID:error:].cold.1((uint64_t)self, a2);

  NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
  v11 = 0;
LABEL_13:

  return v11;
}

- (id)smartListSectionsFromAccountStorages:(id)a3 smartListStorages:(id)a4 groupStorages:(id)a5 smartListSectionStorages:(id)a6 store:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  REMAccount *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  REMList *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  REMSmartList *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  REMSmartListSection *v53;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id obj;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v57 = a4;
  v12 = a5;
  v55 = a6;
  v13 = a7;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = v11;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v75 != v17)
          objc_enumerationMutation(obj);
        v19 = -[REMAccount initWithStore:storage:]([REMAccount alloc], "initWithStore:storage:", v13, *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i));
        -[REMAccount objectID](v19, "objectID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, v20);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
    }
    while (v16);
  }

  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v12, "count"));
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v59 = v12;
  v21 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v71;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v71 != v23)
          objc_enumerationMutation(v59);
        v25 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
        objc_msgSend(v25, "accountID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v26)
          NSLog(CFSTR("'%s' is unexpectedly nil"), "groupStorage.accountID");
        objc_msgSend(v25, "accountID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = -[REMList initWithStore:account:storage:]([REMList alloc], "initWithStore:account:storage:", v13, v28, v25);
        -[REMList objectID](v29, "objectID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setObject:forKeyedSubscript:", v29, v30);

      }
      v22 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
    }
    while (v22);
  }

  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v57, "count"));
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v58 = v57;
  v32 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v67;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v67 != v34)
          objc_enumerationMutation(v58);
        v36 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * k);
        objc_msgSend(v36, "accountID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v37)
          NSLog(CFSTR("'%s' is unexpectedly nil"), "smartListStorage.accountID");
        objc_msgSend(v36, "accountID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v36, "parentListID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          objc_msgSend(v36, "parentListID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "objectForKeyedSubscript:", v41);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v42 = -[REMSmartList initWithStore:account:parentList:storage:]([REMSmartList alloc], "initWithStore:account:parentList:storage:", v13, v39, v40, v36);
        -[REMSmartList objectID](v42, "objectID");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v42, v43);

      }
      v33 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
    }
    while (v33);
  }

  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v55, "count"));
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v56 = v55;
  v45 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v63;
    do
    {
      for (m = 0; m != v46; ++m)
      {
        if (*(_QWORD *)v63 != v47)
          objc_enumerationMutation(v56);
        v49 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * m);
        objc_msgSend(v49, "smartListID");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v50)
          NSLog(CFSTR("'%s' is unexpectedly nil"), "smartListSectionStorage.smartListID");
        objc_msgSend(v49, "smartListID");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = -[REMSmartListSection initWithStore:smartList:storage:]([REMSmartListSection alloc], "initWithStore:smartList:storage:", v13, v52, v49);
        objc_msgSend(v44, "addObject:", v53);

      }
      v46 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
    }
    while (v46);
  }

  return v44;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)fetchSmartListSectionsInSmartList:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  uint8_t v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v8, v9, "[%{public}@] Passing in nil '%s'", v10, v11, v12, v13, (uint64_t)v5, (uint64_t)v6, v14);

  OUTLINED_FUNCTION_1();
}

- (void)fetchSmartListSectionWithObjectID:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_ERROR, "REMSmartListSectionsDataView: Requested to fetch non-existent smartListSection {objectID: %{public}@}", (uint8_t *)&v2, 0xCu);
}

@end
