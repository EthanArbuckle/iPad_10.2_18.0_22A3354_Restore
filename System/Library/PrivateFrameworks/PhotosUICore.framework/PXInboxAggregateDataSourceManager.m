@implementation PXInboxAggregateDataSourceManager

- (PXInboxAggregateDataSourceManager)initWithDataSourceManagers:(id)a3
{
  id v4;
  PXInboxAggregateDataSourceManager *v5;
  uint64_t v6;
  NSArray *dataSourceManagers;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXInboxAggregateDataSourceManager;
  v5 = -[PXSectionedDataSourceManager init](&v18, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dataSourceManagers = v5->_dataSourceManagers;
    v5->_dataSourceManagers = (NSArray *)v6;

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "registerChangeObserver:context:", v5, PXDataSourceManagerObservationContext_296112, (_QWORD)v14);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v10);
    }

  }
  return v5;
}

- (void)_updateDataSource
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXInboxAggregateDataSourceManager _dataSourceSnapshot](self, "_dataSourceSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E50B1608, "changeDetailsWithNoIncrementalChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc((Class)off_1E50B4A18);
  v7 = objc_msgSend(v3, "identifier");
  v8 = objc_msgSend(v4, "identifier");
  objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = &unk_1E53EF7E0;
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v6, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v7, v8, v9, v10, 0);

  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v4, v11);
}

- (id)_dataSourceSnapshot
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  PXInboxAggregateDataSource *v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[PXInboxAggregateDataSourceManager dataSourceManagers](self, "dataSourceManagers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v9, "dataSource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "models");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "addObjectsFromArray:", v11);
        objc_msgSend(v9, "providerSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v13 = v11;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v24 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j));
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
          }
          while (v15);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortUsingDescriptors:", v19);

  v20 = -[PXInboxAggregateDataSource initWithModels:providerSourceDictionary:]([PXInboxAggregateDataSource alloc], "initWithModels:providerSourceDictionary:", v3, v4);
  return v20;
}

- (NSArray)dataSourceManagers
{
  return self->_dataSourceManagers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceManagers, 0);
}

@end
