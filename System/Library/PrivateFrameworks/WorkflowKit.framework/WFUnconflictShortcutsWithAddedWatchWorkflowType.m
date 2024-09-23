@implementation WFUnconflictShortcutsWithAddedWatchWorkflowType

void __WFUnconflictShortcutsWithAddedWatchWorkflowType_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WFWorkflowRecord *v16;
  WFWorkflowRecord *v17;
  void *v18;
  WFWorkflowRecord *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  id v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id obj;
  void *context;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  _BYTE v43[128];
  _QWORD v44[4];

  v44[2] = *MEMORY[0x1E0C80C00];
  +[WFCoreDataWorkflow fetchRequest](WFCoreDataWorkflow, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFetchLimit:", 5);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("conflictOf"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  v44[0] = CFSTR("conflictOf");
  v44[1] = CFSTR("parents");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRelationshipKeyPathsForPrefetching:", v4);

  objc_msgSend(*(id *)(a1 + 32), "context");
  v42 = 0;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v2;
  objc_msgSend(v32, "executeFetchRequest:error:", v2, &v42);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v42;
  if (objc_msgSend(v5, "count"))
  {
    v7 = *MEMORY[0x1E0DC8510];
    v28 = a1;
    do
    {
      v31 = v6;
      v30 = (void *)MEMORY[0x1C3BB3598]();
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      obj = v5;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v39;
        v33 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v39 != v10)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            v13 = (void *)MEMORY[0x1C3BB3598]();
            objc_msgSend(v12, "workflowTypes");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "containsObject:", v7))
            {

            }
            else
            {
              objc_msgSend(v12, "conflictOf");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
              {
                context = (void *)MEMORY[0x1C3BB3598]();
                v16 = -[WFRecord initWithStorage:]([WFWorkflowRecord alloc], "initWithStorage:", v12);
                v17 = [WFWorkflowRecord alloc];
                objc_msgSend(v12, "conflictOf");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = -[WFRecord initWithStorage:](v17, "initWithStorage:", v18);

                -[WFWorkflowRecord workflowTypes](v19, "workflowTypes");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF != %@"), v7);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "filteredArrayUsingPredicate:", v21);
                v22 = v9;
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFWorkflowRecord setWorkflowTypes:](v19, "setWorkflowTypes:", v23);

                v9 = v22;
                LODWORD(v20) = -[WFWorkflowRecord isEquivalentForSyncTo:](v19, "isEquivalentForSyncTo:", v16);

                v10 = v33;
                objc_autoreleasePoolPop(context);
                if ((_DWORD)v20)
                  objc_msgSend(v32, "deleteObject:", v12);
              }
            }
            objc_autoreleasePoolPop(v13);
          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        }
        while (v9);
      }

      v37 = v31;
      v24 = objc_msgSend(v32, "save:", &v37);
      v25 = v37;

      v26 = *(_QWORD *)(*(_QWORD *)(v28 + 40) + 8);
      if (*(_BYTE *)(v26 + 24))
        v27 = v24;
      else
        v27 = 0;
      *(_BYTE *)(v26 + 24) = v27;
      objc_msgSend(v32, "reset");
      objc_msgSend(v29, "setFetchOffset:", objc_msgSend(v29, "fetchOffset") + objc_msgSend(v29, "fetchLimit"));
      v36 = v25;
      objc_msgSend(v32, "executeFetchRequest:error:", v29, &v36);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v36;

      if (v6)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v28 + 40) + 8) + 24) = 0;
      objc_autoreleasePoolPop(v30);
    }
    while (objc_msgSend(v5, "count"));
  }

}

@end
