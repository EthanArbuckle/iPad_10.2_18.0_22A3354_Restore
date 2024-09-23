@implementation WFManagedObjectContext

- (id)executeFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v6 = a3;
  -[WFManagedObjectContext logFaultForIncompatibleSortDescriptorsInFetchRequest:](self, "logFaultForIncompatibleSortDescriptorsInFetchRequest:", v6);
  v9.receiver = self;
  v9.super_class = (Class)WFManagedObjectContext;
  -[WFManagedObjectContext executeFetchRequest:error:](&v9, sel_executeFetchRequest_error_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)logFaultForIncompatibleSortDescriptorsInFetchRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  WFManagedObjectContext *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "includesPendingChanges")
    && objc_msgSend(v4, "resultType") != 2
    && -[WFManagedObjectContext hasChanges](self, "hasChanges"))
  {
    objc_msgSend(v4, "sortDescriptors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __79__WFManagedObjectContext_logFaultForIncompatibleSortDescriptorsInFetchRequest___block_invoke;
    v15 = &unk_1E7AF9AC0;
    v6 = v4;
    v16 = v6;
    v17 = self;
    objc_msgSend(v5, "if_firstObjectPassingTest:", &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      getWFDatabaseLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        -[WFManagedObjectContext insertedObjects](self, "insertedObjects", v12, v13, v14, v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFManagedObjectContext deletedObjects](self, "deletedObjects");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFManagedObjectContext updatedObjects](self, "updatedObjects");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316162;
        v19 = "-[WFManagedObjectContext logFaultForIncompatibleSortDescriptorsInFetchRequest:]";
        v20 = 2114;
        v21 = v6;
        v22 = 2114;
        v23 = v9;
        v24 = 2114;
        v25 = v10;
        v26 = 2114;
        v27 = v11;
        _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_FAULT, "%s Fetch requests with sort descriptors referencing parent entity cannot be run on dirty contexts. Fetch request: %{public}@, inserted: %{public}@, deleted: %{public}@, updated: %{public}@", buf, 0x34u);

      }
    }

  }
}

- (WFDatabase)database
{
  return (WFDatabase *)objc_loadWeakRetained((id *)&self->_database);
}

- (void)setDatabase:(id)a3
{
  objc_storeWeak((id *)&self->_database, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_database);
}

uint64_t __79__WFManagedObjectContext_logFaultForIncompatibleSortDescriptorsInFetchRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C97B20];
    objc_msgSend(*(id *)(a1 + 32), "entityName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entityForName:inManagedObjectContext:", v6, *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "relationshipsByName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "inverseRelationship");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && objc_msgSend(v10, "isToMany") && objc_msgSend(v11, "isToMany"))
      v12 = objc_msgSend(v11, "isOrdered");
    else
      v12 = 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
