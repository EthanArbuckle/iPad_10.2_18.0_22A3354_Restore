@implementation WFCloudKitResolveReferencesOperation

- (WFCloudKitResolveReferencesOperation)initWithRequest:(id)a3 records:(id)a4 operationGroup:(id)a5 task:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  WFCloudKitResolveReferencesOperation *v14;
  WFCloudKitResolveReferencesOperation *v15;
  WFCloudKitResolveReferencesOperation *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)WFCloudKitResolveReferencesOperation;
  v14 = -[WFCloudKitResolveReferencesOperation init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_request, v10);
    objc_storeStrong((id *)&v15->_records, a4);
    objc_storeStrong((id *)&v15->_operationGroup, a5);
    objc_storeStrong((id *)&v15->_task, a6);
    v16 = v15;
  }

  return v15;
}

- (void)start
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  WFCloudKitResolveReferencesOperation *v27;
  void *v28;
  id obj;
  _QWORD v30[4];
  id v31;
  WFCloudKitResolveReferencesOperation *v32;
  id v33;
  id v34;
  SEL v35;
  _QWORD aBlock[5];
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  uint8_t v46[128];
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v45.receiver = self;
  v45.super_class = (Class)WFCloudKitResolveReferencesOperation;
  -[WFCloudKitAsyncOperation start](&v45, sel_start);
  objc_msgSend(MEMORY[0x1E0CB3828], "currentQueue");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  getWFCloudKitLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[WFCloudKitResolveReferencesOperation records](self, "records");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 136315394;
    v48 = "-[WFCloudKitResolveReferencesOperation start]";
    v49 = 2048;
    v50 = v5;
    _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_INFO, "%s Resolve references operation starting for %lu records", buf, 0x16u);

  }
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v27 = self;
  -[WFCloudKitResolveReferencesOperation records](self, "records");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v42 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v12, "record");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "item");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "properties");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __45__WFCloudKitResolveReferencesOperation_start__block_invoke;
        v37[3] = &unk_1E7AF2148;
        v38 = v13;
        v39 = v6;
        v40 = v7;
        v16 = v13;
        objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v37);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v9);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__WFCloudKitResolveReferencesOperation_start__block_invoke_3;
  aBlock[3] = &unk_1E7AF2170;
  aBlock[4] = self;
  v17 = _Block_copy(aBlock);
  if (objc_msgSend(v6, "count"))
  {
    getWFCloudKitLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v28;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v20 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 136315394;
      v48 = "-[WFCloudKitResolveReferencesOperation start]";
      v49 = 2048;
      v50 = v20;
      _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_INFO, "%s Fetching %lu references.", buf, 0x16u);
    }

    -[WFCloudKitResolveReferencesOperation request](v27, "request");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCloudKitResolveReferencesOperation operationGroup](v27, "operationGroup");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __45__WFCloudKitResolveReferencesOperation_start__block_invoke_369;
    v30[3] = &unk_1E7AF3CA8;
    v31 = v6;
    v32 = v27;
    v33 = v28;
    v35 = a2;
    v34 = v17;
    objc_msgSend(v21, "fetchRecordIDs:desiredKeys:operationGroup:completionHandler:", v22, v23, v24, v30);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCloudKitResolveReferencesOperation setCurrentOperation:](v27, "setCurrentOperation:", v25);

  }
  else
  {
    (*((void (**)(void *, _QWORD))v17 + 2))(v17, 0);
    v19 = v28;
  }

}

- (NSArray)records
{
  return self->_records;
}

void __45__WFCloudKitResolveReferencesOperation_start__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "records", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "record");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "item");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFCloudKitItemRequest hydrateItem:withRecord:resolvedReferences:setNilValues:](WFCloudKitItemRequest, "hydrateItem:withRecord:resolvedReferences:setNilValues:", v11, v10, v3, 0);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishExecuting");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_currentOperation, 0);
  objc_storeStrong((id *)&self->_operationGroup, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_destroyWeak((id *)&self->_request);
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  -[WFCloudKitResolveReferencesOperation currentOperation](self, "currentOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)WFCloudKitResolveReferencesOperation;
  -[WFCloudKitResolveReferencesOperation cancel](&v4, sel_cancel);
}

- (WFCloudKitItemRequest)request
{
  return (WFCloudKitItemRequest *)objc_loadWeakRetained((id *)&self->_request);
}

- (CKOperationGroup)operationGroup
{
  return self->_operationGroup;
}

- (CKFetchRecordsOperation)currentOperation
{
  return self->_currentOperation;
}

- (void)setCurrentOperation:(id)a3
{
  objc_storeStrong((id *)&self->_currentOperation, a3);
}

- (WFCloudKitItemTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

void __45__WFCloudKitResolveReferencesOperation_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "type") == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      v9 = objc_msgSend(v6, "itemClass");
      v10 = *(void **)(a1 + 40);
      objc_msgSend(v8, "recordID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v22 = v7;
        objc_msgSend(v7, "objectsMatchingClass:", objc_opt_class());
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v26;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v26 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v16);
              v18 = objc_msgSend(v6, "itemClass");
              v19 = *(void **)(a1 + 40);
              objc_msgSend(v17, "recordID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v20);

              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          }
          while (v14);
        }

        v7 = v22;
      }
    }
    objc_msgSend((id)objc_msgSend(v6, "itemClass"), "properties");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __45__WFCloudKitResolveReferencesOperation_start__block_invoke_2;
    v23[3] = &unk_1E7AF2080;
    v24 = *(id *)(a1 + 48);
    objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v23);

  }
}

void __45__WFCloudKitResolveReferencesOperation_start__block_invoke_369(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  WFCloudKitResolveReferencesOperation *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  WFCloudKitResolveReferencesOperation *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *);
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  getWFCloudKitLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "allKeys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v31 = "-[WFCloudKitResolveReferencesOperation start]_block_invoke";
      v32 = 2112;
      v33 = (uint64_t)v9;
      v34 = 2112;
      v35 = v6;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s Error fetching record IDs: %@, %@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "task");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setError:", v6);

    objc_msgSend(*(id *)(a1 + 48), "cancelAllOperations");
    objc_msgSend(*(id *)(a1 + 40), "finishExecuting");
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[WFCloudKitResolveReferencesOperation start]_block_invoke";
      v32 = 2048;
      v33 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_INFO, "%s Finished fetching %lu references", buf, 0x16u);
    }

    v11 = (void *)objc_opt_new();
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __45__WFCloudKitResolveReferencesOperation_start__block_invoke_370;
    v25 = &unk_1E7AF2198;
    v12 = *(id *)(a1 + 32);
    v29 = *(_QWORD *)(a1 + 64);
    v13 = *(_QWORD *)(a1 + 40);
    v26 = v12;
    v27 = v13;
    v14 = v11;
    v28 = v14;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v22);
    if ((objc_msgSend(*(id *)(a1 + 40), "isCancelled", v22, v23, v24, v25) & 1) == 0)
    {
      v15 = *(void **)(a1 + 48);
      v16 = [WFCloudKitResolveReferencesOperation alloc];
      objc_msgSend(*(id *)(a1 + 40), "request");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "allValues");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "operationGroup");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "task");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[WFCloudKitResolveReferencesOperation initWithRequest:records:operationGroup:task:](v16, "initWithRequest:records:operationGroup:task:", v17, v18, v19, v20);
      objc_msgSend(v15, "addOperation:", v21);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

void __45__WFCloudKitResolveReferencesOperation_start__block_invoke_370(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  objc_class *v7;
  WFCloudKitItemRecord *v8;
  id v9;
  WFCloudKitItemRecord *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = (objc_class *)objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v15, "recordType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", v12, v13, CFSTR("WFCloudKitItemRequest.m"), 755, CFSTR("Received record not in known WFCloudKitItem types: %@"), v14);

  }
  v8 = [WFCloudKitItemRecord alloc];
  v9 = objc_alloc_init(v7);
  v10 = -[WFCloudKitItemRecord initWithRecord:item:](v8, "initWithRecord:item:", v15, v9);
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v10, v6);

}

void __45__WFCloudKitResolveReferencesOperation_start__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if ((objc_msgSend(a3, "isIgnoredByDefault") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

@end
