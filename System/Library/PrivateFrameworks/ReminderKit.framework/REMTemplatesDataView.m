@implementation REMTemplatesDataView

- (REMTemplatesDataView)initWithStore:(id)a3
{
  id v5;
  REMTemplatesDataView *v6;
  REMTemplatesDataView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMTemplatesDataView;
  v6 = -[REMTemplatesDataView init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (id)fetchTemplatesInAccount:(id)a3 error:(id *)a4
{
  id v6;
  REMTemplatesDataViewInvocation_fetchTemplatesInAccount *v7;
  void *v8;
  REMTemplatesDataViewInvocation_fetchTemplatesInAccount *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = [REMTemplatesDataViewInvocation_fetchTemplatesInAccount alloc];
  objc_msgSend(v6, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[REMTemplatesDataViewInvocation_fetchTemplatesInAccount initWithParentAccountObjectID:](v7, "initWithParentAccountObjectID:", v8);
  -[REMTemplatesDataView store](self, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resultFromPerformingInvocation:error:", v9, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_opt_class();
  REMDynamicCast(v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "templateStorages");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTemplatesDataView store](self, "store");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTemplatesDataView templatesFromTemplateStorages:store:](self, "templatesFromTemplateStorages:store:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)fetchTemplatesWithObjectIDs:(id)a3 error:(id *)a4
{
  id v6;
  REMTemplatesDataViewInvocation_fetchByObjectIDs *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v24;
  REMTemplatesDataViewInvocation_fetchByObjectIDs *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = -[REMTemplatesDataViewInvocation_fetchByObjectIDs initWithObjectIDs:]([REMTemplatesDataViewInvocation_fetchByObjectIDs alloc], "initWithObjectIDs:", v6);
    -[REMTemplatesDataView store](self, "store");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resultFromPerformingInvocation:error:", v7, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_opt_class();
    REMDynamicCast(v10, (uint64_t)v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "templateStorages");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMTemplatesDataView store](self, "store");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMTemplatesDataView templatesFromTemplateStorages:store:](self, "templatesFromTemplateStorages:store:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v24 = v9;
      v25 = v7;
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v14, "count"));
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v16 = v14;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v27 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_msgSend(v21, "objectID", v24, v25, (_QWORD)v26);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, v22);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v18);
      }

      v9 = v24;
      v7 = v25;
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v15;
}

- (id)fetchTemplateWithObjectID:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);
  -[REMTemplatesDataView fetchTemplatesWithObjectIDs:error:](self, "fetchTemplatesWithObjectIDs:error:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_7;
  objc_msgSend(v10, "objectForKeyedSubscript:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[REMLogStore read](REMLogStore, "read");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[REMTemplatesDataView fetchTemplateWithObjectID:error:].cold.1((uint64_t)v6, v12);

    if (a4)
    {
      +[REMError noSuchObjectErrorWithObjectID:](REMError, "noSuchObjectErrorWithObjectID:", v6);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v11 = 0;
  }
LABEL_8:

  return v11;
}

- (id)templatesFromTemplateStorages:(id)a3 store:(id)a4
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
  REMTemplate *v14;
  REMTemplate *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        v14 = [REMTemplate alloc];
        v15 = -[REMTemplate initWithStore:storage:](v14, "initWithStore:storage:", v6, v13, (_QWORD)v17);
        objc_msgSend(v7, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)fetchTemplateWithObjectID:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_ERROR, "REMTemplatesDataView: Requested to fetch non-existent template {objectID: %{public}@}", (uint8_t *)&v2, 0xCu);
}

@end
