@implementation REMTemplateSectionsDataView

- (REMTemplateSectionsDataView)initWithStore:(id)a3
{
  id v5;
  REMTemplateSectionsDataView *v6;
  REMTemplateSectionsDataView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMTemplateSectionsDataView;
  v6 = -[REMTemplateSectionsDataView init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (id)fetchTemplateSectionsWithTemplateObjectID:(id)a3 error:(id *)a4
{
  id v7;
  REMTemplateSectionsDataViewInvocation_fetchTemplateSectionsInTemplate *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;

  v7 = a3;
  if (v7)
  {
    v8 = -[REMTemplateSectionsDataViewInvocation_fetchTemplateSectionsInTemplate initWithParentTemplateObjectID:]([REMTemplateSectionsDataViewInvocation_fetchTemplateSectionsInTemplate alloc], "initWithParentTemplateObjectID:", v7);
    -[REMTemplateSectionsDataView store](self, "store");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resultFromPerformingInvocation:error:", v8, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_opt_class();
    REMDynamicCast(v11, (uint64_t)v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "templateStorages");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "templateSectionStorages");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMTemplateSectionsDataView store](self, "store");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMTemplateSectionsDataView templateSectionsFromTemplateStorages:templateSectionStorages:store:](self, "templateSectionsFromTemplateStorages:templateSectionStorages:store:", v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[REMLogStore read](REMLogStore, "read");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[REMTemplateSectionsDataView fetchTemplateSectionsWithTemplateObjectID:error:].cold.1((uint64_t)self, a2);

    NSLog(CFSTR("'%s' is unexpectedly nil"), "templateObjectID");
    v16 = 0;
  }

  return v16;
}

- (id)fetchTemplateSectionsInTemplate:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTemplateSectionsDataView fetchTemplateSectionsWithTemplateObjectID:error:](self, "fetchTemplateSectionsWithTemplateObjectID:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fetchTemplateSectionsWithObjectIDs:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  REMTemplateSectionsDataViewInvocation_fetchByObjectIDs *v9;
  void *v10;
  void *v11;
  uint64_t v12;
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
  REMTemplateSectionsDataViewInvocation_fetchByObjectIDs *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "count"))
    {
      v9 = -[REMTemplateSectionsDataViewInvocation_fetchByObjectIDs initWithObjectIDs:]([REMTemplateSectionsDataViewInvocation_fetchByObjectIDs alloc], "initWithObjectIDs:", v8);
      -[REMTemplateSectionsDataView store](self, "store");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "resultFromPerformingInvocation:error:", v9, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_opt_class();
      REMDynamicCast(v12, (uint64_t)v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "templateStorages");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "templateSectionStorages");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMTemplateSectionsDataView store](self, "store");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMTemplateSectionsDataView templateSectionsFromTemplateStorages:templateSectionStorages:store:](self, "templateSectionsFromTemplateStorages:templateSectionStorages:store:", v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v28 = v11;
        v29 = v9;
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

        v11 = v28;
        v9 = v29;
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
      -[REMTemplateSectionsDataView fetchTemplateSectionsWithObjectIDs:error:].cold.1((uint64_t)self, a2);

    NSLog(CFSTR("'%s' is unexpectedly nil"), "objectIDs");
    v18 = 0;
  }

  return v18;
}

- (id)fetchTemplateSectionWithObjectID:(id)a3 error:(id *)a4
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
    -[REMTemplateSectionsDataView fetchTemplateSectionsWithObjectIDs:error:](self, "fetchTemplateSectionsWithObjectIDs:error:", v9, a4);
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
        -[REMTemplateSectionsDataView fetchTemplateSectionWithObjectID:error:].cold.2((uint64_t)v8, v12);

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

- (id)templateSectionsFromTemplateStorages:(id)a3 templateSectionStorages:(id)a4 store:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  REMTemplate *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  REMTemplateSection *v26;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v7;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(obj);
        v15 = -[REMTemplate initWithStore:storage:]([REMTemplate alloc], "initWithStore:storage:", v9, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
        -[REMTemplate objectID](v15, "objectID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, v16);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v12);
  }

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v28 = v8;
  v18 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v28);
        v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        objc_msgSend(v22, "parentTemplateID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
          NSLog(CFSTR("'%s' is unexpectedly nil"), "templateSectionStorage.parentTemplateID");
        objc_msgSend(v22, "parentTemplateID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[REMTemplateSection initWithStore:parentTemplate:storage:]([REMTemplateSection alloc], "initWithStore:parentTemplate:storage:", v9, v25, v22);
        objc_msgSend(v17, "addObject:", v26);

      }
      v19 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v19);
  }

  return v17;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)fetchTemplateSectionsWithTemplateObjectID:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
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

- (void)fetchTemplateSectionsWithObjectIDs:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
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

- (void)fetchTemplateSectionWithObjectID:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
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

- (void)fetchTemplateSectionWithObjectID:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_ERROR, "REMTemplateSectionsDataView: Requested to fetch non-existent templateSection {objectID: %{public}@}", (uint8_t *)&v2, 0xCu);
}

@end
