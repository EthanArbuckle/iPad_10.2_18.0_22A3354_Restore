@implementation SSMetricsEventController

void __55__SSMetricsEventController_insertEventSummaries_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  int v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 72));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    v8 = 2;
    do
    {
      v9 = 0;
      v10 = v8;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        SSSQLiteBindFoundationValueToStatement(a2, v10 + v9, v11);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      v8 = v10 + v9;
    }
    while (v6);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "statementDidFinishAfterStepping:", a2);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = objc_msgSend(v12, "shouldLog");
    if (objc_msgSend(v12, "shouldLogToDisk"))
      v14 = v13 | 2;
    else
      v14 = v13;
    objc_msgSend(v12, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      v14 &= 2u;
    if (v14)
    {
      v16 = (void *)objc_opt_class();
      v17 = *(_QWORD *)(a1 + 56);
      v18 = *(_QWORD *)(a1 + 32);
      v32 = 138412802;
      v33 = v16;
      v34 = 2112;
      v35 = v17;
      v36 = 2112;
      v37 = v18;
      v19 = v16;
      LODWORD(v27) = 32;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_20:

        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v20, 4, &v32, v27, (_QWORD)v28);
      v15 = objc_claimAutoreleasedReturnValue();
      free(v20);
      SSFileLog(v12, CFSTR("%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v15);
    }

    goto LABEL_20;
  }
}

BOOL __55__SSMetricsEventController_insertEventSummaries_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  const __CFUUID *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  int v21;
  int v22;
  void *v23;
  int v24;
  int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t *v40;
  _BOOL8 v41;
  int *v43;
  uint64_t v44;
  id v45;
  void *v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  void *context;
  void *v51;
  _QWORD v52[5];
  id v53;
  uint64_t v54;
  id v55;
  uint64_t *v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  char v73;
  int v74;
  void *v75;
  __int16 v76;
  const __CFString *v77;
  __int16 v78;
  void *v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v45 = a2;
  v70 = 0;
  v71 = &v70;
  v72 = 0x2020000000;
  v73 = 1;
  +[SSMetricsEventTableEntity databaseTable](SSMetricsEventTableEntity, "databaseTable");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
  if (v3)
  {
    v48 = *(_QWORD *)v67;
    do
    {
      v5 = 0;
      v49 = v3;
      do
      {
        if (*(_QWORD *)v67 != v48)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v5);
        context = (void *)MEMORY[0x1A8585BF8](v3, v4);
        objc_msgSend(v6, "objectForKey:", CFSTR("report_url"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v51, "length"))
        {
          +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig", v43, v44);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v23)
          {
            +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v24 = objc_msgSend(v23, "shouldLog");
          v25 = objc_msgSend(v23, "shouldLogToDisk");
          objc_msgSend(v23, "OSLogObject");
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v25)
            v24 |= 2u;
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            v24 &= 2u;
          if (v24)
          {
            v28 = (void *)objc_opt_class();
            v74 = 138412802;
            v75 = v28;
            v76 = 2112;
            v77 = CFSTR("report_url");
            v78 = 2112;
            v79 = v6;
            v29 = v28;
            LODWORD(v44) = 32;
            v43 = &v74;
            v30 = (void *)_os_log_send_and_compose_impl();

            if (v30)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v30, 4, &v74, v44);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              free(v30);
              SSFileLog(v23, CFSTR("%@"), v31, v32, v33, v34, v35, v36, (uint64_t)v27);
              goto LABEL_32;
            }
          }
          else
          {
LABEL_32:

          }
LABEL_36:
          v22 = 0;
          goto LABEL_37;
        }
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("INSERT OR REPLACE INTO "));
        objc_msgSend(v7, "appendString:", v46);
        objc_msgSend(v7, "appendString:", CFSTR(" ("));
        objc_msgSend(v7, "appendString:", CFSTR("pid"));
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v8 = v6;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v62, v81, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v63;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v63 != v10)
                objc_enumerationMutation(v8);
              v12 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
              objc_msgSend(v7, "appendString:", CFSTR(", "), v43);
              objc_msgSend(v7, "appendString:", v12);
            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v62, v81, 16);
          }
          while (v9);
        }

        objc_msgSend(v7, "appendString:", CFSTR(") VALUES (?"));
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v13 = v8;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v58, v80, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v59;
          while (1)
          {
            if (*(_QWORD *)v59 != v15)
              objc_enumerationMutation(v13);
            objc_msgSend(v7, "appendString:", CFSTR(", ?"), v43);
            if (!--v14)
            {
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v58, v80, 16);
              if (!v14)
                break;
            }
          }
        }

        objc_msgSend(v7, "appendString:", CFSTR(");"));
        v16 = CFUUIDCreate(0);
        v17 = *(_OWORD *)&CFUUIDGetUUIDBytes(v16);
        CFRelease(v16);
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __55__SSMetricsEventController_insertEventSummaries_error___block_invoke_3;
        v52[3] = &unk_1E47C0568;
        v52[4] = v13;
        v56 = &v70;
        v57 = v17;
        v18 = v45;
        v19 = *(_QWORD *)(a1 + 40);
        v53 = v18;
        v54 = v19;
        v20 = v7;
        v55 = v20;
        objc_msgSend(v18, "prepareStatementForSQL:cache:usingBlock:", v20, 1, v52);
        v21 = *((unsigned __int8 *)v71 + 24);
        if (*((_BYTE *)v71 + 24))
        {
          v22 = 0;
        }
        else
        {
          SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v39 = *(void **)(v38 + 40);
          *(_QWORD *)(v38 + 40) = v37;

          v22 = 2;
        }

        if (v21)
          goto LABEL_36;
LABEL_37:

        objc_autoreleasePoolPop(context);
        v3 = v49;
        if (v22)
          goto LABEL_40;
        ++v5;
      }
      while (v5 != v49);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
    }
    while (v3);
  }
LABEL_40:

  v40 = v71;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *((_BYTE *)v71 + 24);
  v41 = *((unsigned __int8 *)v40 + 24) != 0;

  _Block_object_dispose(&v70, 8);
  return v41;
}

void __55__SSMetricsEventController_insertEventSummaries_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  __int128 v9;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __55__SSMetricsEventController_insertEventSummaries_error___block_invoke_2;
  v6[3] = &unk_1E47C0590;
  v6[1] = 3221225472;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  v9 = *(_OWORD *)(a1 + 48);
  objc_msgSend(v3, "performTransactionWithBlock:", v6);

}

- (BOOL)insertEventSummaries:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v24;
  _QWORD block[5];
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  int v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__82;
  v37 = __Block_byref_object_dispose__82;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 1;
  if (objc_msgSend(v6, "count"))
  {
    -[SSMetricsController serialQueue](self, "serialQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__SSMetricsEventController_insertEventSummaries_error___block_invoke;
    block[3] = &unk_1E47C05B8;
    block[4] = self;
    v26 = v6;
    v27 = &v33;
    v28 = &v29;
    dispatch_sync(v7, block);

    goto LABEL_14;
  }
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_msgSend(v8, "shouldLog");
  v10 = objc_msgSend(v8, "shouldLogToDisk");
  objc_msgSend(v8, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
    v9 |= 2u;
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    v9 &= 2u;
  if (!v9)
    goto LABEL_12;
  v13 = (void *)objc_opt_class();
  v39 = 138412290;
  v40 = v13;
  v14 = v13;
  LODWORD(v24) = 12;
  v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, &v39, v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    free(v15);
    SSFileLog(v8, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v12);
LABEL_12:

  }
LABEL_14:
  if (a4)
    *a4 = objc_retainAutorelease((id)v34[5]);
  v22 = *((_BYTE *)v30 + 24) != 0;
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v22;
}

- (SSMetricsEventController)init
{
  SSMetricsEventController *v2;
  SSMetricsEventTable *v3;
  SSMetricsEventTable *table;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSMetricsEventController;
  v2 = -[SSMetricsController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SSMetricsEventTable);
    table = v2->_table;
    v2->_table = v3;

  }
  return v2;
}

- (void)_serialQueueInsertEvents:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SSMetricsEventTable *table;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  SSMetricsEventController *v22;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[SSMetricsController configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportingURLString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsController _cookieValuesForConfiguration:](self, "_cookieValuesForConfiguration:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v10, CFSTR("cookies"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  table = self->_table;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__SSMetricsEventController__serialQueueInsertEvents_withCompletionHandler___block_invoke;
  v17[3] = &unk_1E47C04C8;
  v18 = v6;
  v19 = v8;
  v20 = v11;
  v21 = v9;
  v22 = self;
  v13 = v9;
  v14 = v11;
  v15 = v8;
  v16 = v6;
  -[SSMetricsEventTable performTransactionWithBlock:](table, "performTransactionWithBlock:", v17);
  if (v7)
    v7[2](v7, 0);

}

BOOL __75__SSMetricsEventController__serialQueueInsertEvents_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  const __CFUUID *v30;
  uint64_t v31;
  void *v32;
  int v33;
  int v34;
  NSObject *v35;
  int v36;
  int v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _BOOL8 v48;
  int *v50;
  uint64_t v51;
  id v52;
  void *v53;
  id obj;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  _QWORD v62[4];
  id v63;
  id v64;
  uint64_t *v65;
  uint64_t v66;
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
  __int128 v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  char v82;
  int v83;
  void *v84;
  __int16 v85;
  void *v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v52 = a2;
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = *(id *)(a1 + 32);
  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
  if (v56)
  {
    v55 = *(_QWORD *)v76;
    do
    {
      v61 = 0;
      do
      {
        if (*(_QWORD *)v76 != v55)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v61);
        if ((objc_msgSend(v3, "isBlacklistedByConfiguration:", *(_QWORD *)(a1 + 40), v50, v51) & 1) != 0)
        {
          +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v4)
          {
            +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v5 = objc_msgSend(v4, "shouldLog");
          v6 = objc_msgSend(v4, "shouldLogToDisk");
          objc_msgSend(v4, "OSLogObject");
          v7 = objc_claimAutoreleasedReturnValue();
          v8 = v7;
          if (v6)
            v9 = v5 | 2;
          else
            v9 = v5;
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            v10 = v9;
          else
            v10 = v9 & 2;
          if (v10)
          {
            v11 = (void *)objc_opt_class();
            v83 = 138412546;
            v84 = v11;
            v85 = 2112;
            v86 = v3;
            v12 = v11;
            LODWORD(v51) = 22;
            v50 = &v83;
            v13 = (void *)_os_log_send_and_compose_impl();

            if (v13)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v83, v51);
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              free(v13);
              SSFileLog(v4, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v8);
              goto LABEL_18;
            }
          }
          else
          {
LABEL_18:

          }
          goto LABEL_37;
        }
        v20 = (void *)MEMORY[0x1A8585BF8]();
        objc_msgSend(v3, "allTableEntityPropertiesPermittedByConfiguration:externalValues:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v58, "count"))
        {
          objc_msgSend(v3, "decorateReportingURL:", *(_QWORD *)(a1 + 56));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setObject:forKey:", v53, CFSTR("timestampInserted"));
          objc_msgSend(v58, "setObject:forKey:", &unk_1E481E828, CFSTR("timestampReported"));
          objc_msgSend(v58, "setObject:forKey:", v57, CFSTR("report_url"));
          +[SSMetricsEventTableEntity databaseTable](SSMetricsEventTableEntity, "databaseTable");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("INSERT OR REPLACE INTO "));
          objc_msgSend(v21, "appendString:", v59);
          objc_msgSend(v21, "appendString:", CFSTR(" ("));
          objc_msgSend(v21, "appendString:", CFSTR("pid"));
          v73 = 0u;
          v74 = 0u;
          v71 = 0u;
          v72 = 0u;
          v22 = v58;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
          if (v23)
          {
            v24 = *(_QWORD *)v72;
            do
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v72 != v24)
                  objc_enumerationMutation(v22);
                v26 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i);
                objc_msgSend(v21, "appendString:", CFSTR(", "));
                objc_msgSend(v21, "appendString:", v26);
              }
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
            }
            while (v23);
          }

          objc_msgSend(v21, "appendString:", CFSTR(") VALUES (?"));
          v69 = 0u;
          v70 = 0u;
          v67 = 0u;
          v68 = 0u;
          v27 = v22;
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
          if (v28)
          {
            v29 = *(_QWORD *)v68;
            while (1)
            {
              if (*(_QWORD *)v68 != v29)
                objc_enumerationMutation(v27);
              objc_msgSend(v21, "appendString:", CFSTR(", ?"));
              if (!--v28)
              {
                v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
                if (!v28)
                  break;
              }
            }
          }

          objc_msgSend(v21, "appendString:", CFSTR(");"));
          v30 = CFUUIDCreate(0);
          v31 = *(_OWORD *)&CFUUIDGetUUIDBytes(v30);
          CFRelease(v30);
          v62[0] = MEMORY[0x1E0C809B0];
          v62[1] = 3221225472;
          v62[2] = __75__SSMetricsEventController__serialQueueInsertEvents_withCompletionHandler___block_invoke_19;
          v62[3] = &unk_1E47C04A0;
          v66 = v31;
          v63 = v27;
          v65 = &v79;
          v64 = v52;
          objc_msgSend(v64, "prepareStatementForSQL:cache:usingBlock:", v21, 0, v62);

LABEL_35:
          goto LABEL_36;
        }
        +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v32)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v33 = objc_msgSend(v32, "shouldLog");
        v34 = objc_msgSend(v32, "shouldLogToDisk");
        v57 = v32;
        objc_msgSend(v32, "OSLogObject");
        v35 = objc_claimAutoreleasedReturnValue();
        if (v34)
          v36 = v33 | 2;
        else
          v36 = v33;
        v59 = v35;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          v37 = v36;
        else
          v37 = v36 & 2;
        if (!v37)
          goto LABEL_35;
        v38 = (void *)objc_opt_class();
        v83 = 138412546;
        v84 = v38;
        v85 = 2112;
        v86 = v3;
        v39 = v38;
        LODWORD(v51) = 22;
        v50 = &v83;
        v40 = (void *)_os_log_send_and_compose_impl();

        if (v40)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v40, 4, &v83, v51);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          free(v40);
          SSFileLog(v32, CFSTR("%@"), v41, v42, v43, v44, v45, v46, (uint64_t)v60);

        }
LABEL_36:

        objc_autoreleasePoolPop(v20);
        if (!*((_BYTE *)v80 + 24))
          goto LABEL_51;
LABEL_37:
        ++v61;
      }
      while (v61 != v56);
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
      v56 = v47;
    }
    while (v47);
  }
LABEL_51:

  v48 = *((_BYTE *)v80 + 24) != 0;
  _Block_object_dispose(&v79, 8);

  return v48;
}

uint64_t __75__SSMetricsEventController__serialQueueInsertEvents_withCompletionHandler___block_invoke_19(uint64_t a1, sqlite3_stmt *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t result;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 56));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = 2;
    do
    {
      v9 = 0;
      v10 = v8;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        SSSQLiteBindFoundationValueToStatement(a2, v10 + v9, v11);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v8 = v10 + v9;
    }
    while (v6);
  }

  result = objc_msgSend(*(id *)(a1 + 40), "statementDidFinishAfterStepping:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int64_t)countUnreportedEventsBefore:(int64_t)a3
{
  NSObject *v5;
  int64_t v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[SSMetricsController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SSMetricsEventController_countUnreportedEventsBefore___block_invoke;
  block[3] = &unk_1E47B9F00;
  block[5] = &v9;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(v5, block);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __56__SSMetricsEventController_countUnreportedEventsBefore___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[6];

  v1 = a1[5];
  v2 = *(void **)(a1[4] + 72);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __56__SSMetricsEventController_countUnreportedEventsBefore___block_invoke_2;
  v5[3] = &unk_1E47C04F0;
  v5[1] = 3221225472;
  v3 = a1[6];
  v5[4] = v1;
  v5[5] = v3;
  return objc_msgSend(v2, "performTransactionWithBlock:", v5);
}

uint64_t __56__SSMetricsEventController_countUnreportedEventsBefore___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = a2;
  +[SSMetricsEventTableEntity databaseTable](SSMetricsEventTableEntity, "databaseTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("SELECT COUNT(%@) FROM %@ WHERE %@ = 0 AND %@ < %lld"), CFSTR("pid"), v4, CFSTR("timestampReported"), CFSTR("timestampInserted"), *(_QWORD *)(a1 + 40));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__SSMetricsEventController_countUnreportedEventsBefore___block_invoke_3;
  v7[3] = &unk_1E47C0478;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "prepareStatementForSQL:cache:usingBlock:", v5, 0, v7);

  return 1;
}

void __56__SSMetricsEventController_countUnreportedEventsBefore___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  id v4;

  if (+[SSSQLiteDatabase statementHasRowAfterStepping:](SSSQLiteDatabase, "statementHasRowAfterStepping:", a2))
  {
    v4 = (id)SSSQLiteCopyFoundationValueForStatementColumn(a2, 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v4, "integerValue");

  }
}

- (BOOL)deleteEventsInsertedBefore:(int64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  +[SSMetricsEventTableEntity databaseTable](SSMetricsEventTableEntity, "databaseTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ < %lld;"),
                 v5,
                 CFSTR("timestampInserted"),
                 a3);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[SSMetricsController serialQueue](self, "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__SSMetricsEventController_deleteEventsInsertedBefore___block_invoke;
  block[3] = &unk_1E47C0540;
  v11 = v6;
  v12 = &v13;
  block[4] = self;
  v8 = v6;
  dispatch_sync(v7, block);

  LOBYTE(v6) = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return (char)v6;
}

void __55__SSMetricsEventController_deleteEventsInsertedBefore___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 72);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __55__SSMetricsEventController_deleteEventsInsertedBefore___block_invoke_2;
  v6[3] = &unk_1E47C0518;
  v9 = a1[6];
  v6[1] = 3221225472;
  v4 = v2;
  v5 = a1[4];
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "performTransactionWithBlock:", v6);

}

uint64_t __55__SSMetricsEventController_deleteEventsInsertedBefore___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  int v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  _BYTE v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "executeSQL:", v3);
  v5 = objc_msgSend(v4, "countChanges");

  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  objc_msgSend(v6, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    v8 &= 2u;
  if (!v8)
    goto LABEL_11;
  v10 = (void *)objc_opt_class();
  v11 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  *(_DWORD *)v22 = 138412802;
  *(_QWORD *)&v22[4] = v10;
  *(_WORD *)&v22[12] = 1024;
  *(_DWORD *)&v22[14] = v11;
  *(_WORD *)&v22[18] = 1024;
  *(_DWORD *)&v22[20] = v5;
  v12 = v10;
  LODWORD(v21) = 24;
  v13 = (void *)_os_log_send_and_compose_impl();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, v22, v21, *(_OWORD *)v22, *(_QWORD *)&v22[16], v23);
    v9 = objc_claimAutoreleasedReturnValue();
    free(v13);
    SSFileLog(v6, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v9);
LABEL_11:

  }
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

- (BOOL)deleteReportedEvents
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  +[SSMetricsEventTableEntity databaseTable](SSMetricsEventTableEntity, "databaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ != 0;"),
                 v3,
                 CFSTR("timestampReported"));
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[SSMetricsController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SSMetricsEventController_deleteReportedEvents__block_invoke;
  block[3] = &unk_1E47C0540;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v4;
}

void __48__SSMetricsEventController_deleteReportedEvents__block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 72);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __48__SSMetricsEventController_deleteReportedEvents__block_invoke_2;
  v6[3] = &unk_1E47C0518;
  v9 = a1[6];
  v6[1] = 3221225472;
  v4 = v2;
  v5 = a1[4];
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "performTransactionWithBlock:", v6);

}

uint64_t __48__SSMetricsEventController_deleteReportedEvents__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  int v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  _BYTE v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "executeSQL:", v3);
  v5 = objc_msgSend(v4, "countChanges");

  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  objc_msgSend(v6, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    v8 &= 2u;
  if (!v8)
    goto LABEL_11;
  v10 = (void *)objc_opt_class();
  v11 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  *(_DWORD *)v22 = 138412802;
  *(_QWORD *)&v22[4] = v10;
  *(_WORD *)&v22[12] = 1024;
  *(_DWORD *)&v22[14] = v11;
  *(_WORD *)&v22[18] = 1024;
  *(_DWORD *)&v22[20] = v5;
  v12 = v10;
  LODWORD(v21) = 24;
  v13 = (void *)_os_log_send_and_compose_impl();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, v22, v21, *(_OWORD *)v22, *(_QWORD *)&v22[16], v23);
    v9 = objc_claimAutoreleasedReturnValue();
    free(v13);
    SSFileLog(v6, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v9);
LABEL_11:

  }
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

- (void)flushUnreportedEventsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    v7 &= 2u;
  if (!v7)
    goto LABEL_11;
  v19 = 138412290;
  v20 = (id)objc_opt_class();
  v9 = v20;
  LODWORD(v17) = 12;
  v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v19, v17);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v10);
    SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
LABEL_11:

  }
  v18.receiver = self;
  v18.super_class = (Class)SSMetricsEventController;
  -[SSMetricsController flushUnreportedEventsWithCompletionHandler:](&v18, sel_flushUnreportedEventsWithCompletionHandler_, v4);

}

- (BOOL)markEventsAsReported:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v6 = (uint64_t)v5;
  +[SSMetricsEventTableEntity databaseTable](SSMetricsEventTableEntity, "databaseTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("UPDATE %@ SET %@ = %lld WHERE (%@ IN (%@)) AND %@ = 0;"),
                 v7,
                 CFSTR("timestampReported"),
                 v6,
                 CFSTR("pid"),
                 v8,
                 CFSTR("timestampReported"));
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[SSMetricsController serialQueue](self, "serialQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SSMetricsEventController_markEventsAsReported___block_invoke;
  block[3] = &unk_1E47C0540;
  v14 = v9;
  v15 = &v16;
  block[4] = self;
  v11 = v9;
  dispatch_sync(v10, block);

  LOBYTE(v9) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return (char)v9;
}

void __49__SSMetricsEventController_markEventsAsReported___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  __int128 v3;
  _QWORD v4[4];
  __int128 v5;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__SSMetricsEventController_markEventsAsReported___block_invoke_2;
  v4[3] = &unk_1E47C05E0;
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v5 = v3;
  objc_msgSend(v1, "performTransactionWithBlock:", v4);

}

uint64_t __49__SSMetricsEventController_markEventsAsReported___block_invoke_2(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "executeSQL:", *(_QWORD *)(a1 + 32));
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

- (id)unreportedEventsForURL:(id)a3 since:(int64_t)a4 suppressUserInfo:(BOOL)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD block[5];
  id v17;
  id v18;
  int64_t v19;
  BOOL v20;

  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[SSMetricsEventController _maximumUnreportedToSelect](self, "_maximumUnreportedToSelect"));
  -[SSMetricsController serialQueue](self, "serialQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__SSMetricsEventController_unreportedEventsForURL_since_suppressUserInfo___block_invoke;
  block[3] = &unk_1E47C0630;
  block[4] = self;
  v17 = v8;
  v19 = a4;
  v20 = a5;
  v11 = v9;
  v18 = v11;
  v12 = v8;
  dispatch_sync(v10, block);

  v13 = v18;
  v14 = v11;

  return v14;
}

void __74__SSMetricsEventController_unreportedEventsForURL_since_suppressUserInfo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;
  char v12;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 72);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = __74__SSMetricsEventController_unreportedEventsForURL_since_suppressUserInfo___block_invoke_2;
  v8[3] = &unk_1E47C0608;
  v8[1] = 3221225472;
  v8[4] = v2;
  v5 = v3;
  v7 = *(void **)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v9 = v5;
  v11 = v6;
  v12 = *(_BYTE *)(a1 + 64);
  v10 = v7;
  objc_msgSend(v4, "performTransactionWithBlock:", v8);

}

uint64_t __74__SSMetricsEventController_unreportedEventsForURL_since_suppressUserInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  SSMetricsEventTableEntity *v14;
  SSMetricsEventTableEntity *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A8585BF8]();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_collectUnreportedPIDsFromDatabase:matchingReportURLString:since:suppressUserInfo:", v3, v6, *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v7;
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
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
        v14 = [SSMetricsEventTableEntity alloc];
        v15 = -[SSSQLiteEntity initWithPersistentID:inDatabase:](v14, "initWithPersistentID:inDatabase:", objc_msgSend(v13, "longLongValue", (_QWORD)v17), v3);
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  objc_autoreleasePoolPop(v4);
  return 1;
}

- (id)unreportedEventsSince:(int64_t)a3
{
  NSObject *v5;
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__82;
  v13 = __Block_byref_object_dispose__82;
  v14 = 0;
  -[SSMetricsController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SSMetricsEventController_unreportedEventsSince___block_invoke;
  block[3] = &unk_1E47B9F00;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __50__SSMetricsEventController_unreportedEventsSince___block_invoke(uint64_t a1)
{
  __int128 v1;
  void *v2;
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;

  v1 = *(_OWORD *)(a1 + 32);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__SSMetricsEventController_unreportedEventsSince___block_invoke_2;
  v4[3] = &unk_1E47C0658;
  v5 = v1;
  v6 = *(_QWORD *)(a1 + 48);
  return objc_msgSend(v2, "performTransactionWithBlock:", v4);
}

uint64_t __50__SSMetricsEventController_unreportedEventsSince___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = (void *)MEMORY[0x1A8585BF8]();
  objc_msgSend(*(id *)(a1 + 32), "_collectUnreportedEventsFromDatabase:since:", v3, *(_QWORD *)(a1 + 48));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_autoreleasePoolPop(v4);
  return 1;
}

- (id)unreportedEventURLsSince:(int64_t)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD block[5];
  id v12;
  int64_t v13;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SSMetricsController serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SSMetricsEventController_unreportedEventURLsSince___block_invoke;
  block[3] = &unk_1E47B9F28;
  block[4] = self;
  v13 = a3;
  v7 = v5;
  v12 = v7;
  dispatch_sync(v6, block);

  v8 = v12;
  v9 = v7;

  return v9;
}

void __53__SSMetricsEventController_unreportedEventURLsSince___block_invoke(_QWORD *a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  v1 = (void *)a1[5];
  v2 = *(void **)(a1[4] + 72);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[2] = __53__SSMetricsEventController_unreportedEventURLsSince___block_invoke_2;
  v3[3] = &unk_1E47C0680;
  v3[1] = 3221225472;
  v5 = a1[6];
  v4 = v1;
  objc_msgSend(v2, "performTransactionWithBlock:", v3);

}

uint64_t __53__SSMetricsEventController_unreportedEventURLsSince___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x1A8585BF8]();
  +[SSMetricsEventTableEntity databaseTable](SSMetricsEventTableEntity, "databaseTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("SELECT DISTINCT(%@) FROM %@ WHERE %@ = 0 AND %@ <= %lld ORDER BY %@ ASC"), CFSTR("report_url"), v5, CFSTR("timestampReported"), CFSTR("timestampInserted"), *(_QWORD *)(a1 + 40), CFSTR("timestampInserted"));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__SSMetricsEventController_unreportedEventURLsSince___block_invoke_3;
  v9[3] = &unk_1E47C0028;
  v7 = v3;
  v10 = v7;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v7, "prepareStatementForSQL:cache:usingBlock:", v6, 0, v9);

  objc_autoreleasePoolPop(v4);
  return 1;
}

void __53__SSMetricsEventController_unreportedEventURLsSince___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  const unsigned __int8 *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1A8585BF8]();
  if (objc_msgSend(*(id *)(a1 + 32), "statementHasRowAfterStepping:", a2))
  {
    do
    {
      if (sqlite3_column_type(a2, 0) == 3)
      {
        v5 = sqlite3_column_text(a2, 0);
        if (v5)
        {
          if (*v5)
          {
            v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v5);
            v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v6);
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

          }
        }
      }
    }
    while ((objc_msgSend(*(id *)(a1 + 32), "statementHasRowAfterStepping:", a2) & 1) != 0);
  }
  objc_autoreleasePoolPop(v4);
}

- (id)_collectUnreportedEventsFromDatabase:(id)a3 since:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a3;
  +[SSMetricsEventTableEntity databaseTable](SSMetricsEventTableEntity, "databaseTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SSMetricsEventController _maximumUnreportedToSelect](self, "_maximumUnreportedToSelect");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = 0 AND %@ <= %lld ORDER BY %@ ASC LIMIT %d"), CFSTR("pid"), v7, CFSTR("timestampReported"), CFSTR("timestampInserted"), a4, CFSTR("timestampInserted"), v8);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (int)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__SSMetricsEventController__collectUnreportedEventsFromDatabase_since___block_invoke;
  v16[3] = &unk_1E47C0028;
  v17 = v6;
  v11 = v10;
  v18 = v11;
  v12 = v6;
  objc_msgSend(v12, "prepareStatementForSQL:cache:usingBlock:", v9, 0, v16);
  v13 = v18;
  v14 = v11;

  return v14;
}

void __71__SSMetricsEventController__collectUnreportedEventsFromDatabase_since___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  SSMetricsEventTableEntity *v5;

  v4 = (void *)MEMORY[0x1A8585BF8]();
  if (objc_msgSend(*(id *)(a1 + 32), "statementHasRowAfterStepping:", a2))
  {
    do
    {
      if (sqlite3_column_type(a2, 0) == 1)
      {
        v5 = -[SSSQLiteEntity initWithPersistentID:inDatabase:]([SSMetricsEventTableEntity alloc], "initWithPersistentID:inDatabase:", sqlite3_column_int64(a2, 0), *(_QWORD *)(a1 + 32));
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

      }
    }
    while ((objc_msgSend(*(id *)(a1 + 32), "statementHasRowAfterStepping:", a2) & 1) != 0);
  }
  objc_autoreleasePoolPop(v4);
}

- (id)_collectUnreportedPIDsFromDatabase:(id)a3 matchingReportURLString:(id)a4 since:(int64_t)a5 suppressUserInfo:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  +[SSMetricsEventTableEntity databaseTable](SSMetricsEventTableEntity, "databaseTable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SSMetricsEventController _maximumUnreportedToSelect](self, "_maximumUnreportedToSelect");
  v14 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v15 = CFSTR("0");
  if (v6)
    v15 = CFSTR("1");
  v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = '%@' AND %@ = 0 AND %@ <= %lld AND %@ = %@ ORDER BY %@ ASC LIMIT %d"), CFSTR("pid"), v12, CFSTR("report_url"), v11, CFSTR("timestampReported"), CFSTR("timestampInserted"), a5, CFSTR("supressDsid"), v15, CFSTR("timestampInserted"), v13);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (int)v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __110__SSMetricsEventController__collectUnreportedPIDsFromDatabase_matchingReportURLString_since_suppressUserInfo___block_invoke;
  v23[3] = &unk_1E47C0028;
  v24 = v10;
  v18 = v17;
  v25 = v18;
  v19 = v10;
  objc_msgSend(v19, "prepareStatementForSQL:cache:usingBlock:", v16, 0, v23);
  v20 = v25;
  v21 = v18;

  return v21;
}

void __110__SSMetricsEventController__collectUnreportedPIDsFromDatabase_matchingReportURLString_since_suppressUserInfo___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;

  v4 = (void *)MEMORY[0x1A8585BF8]();
  if (objc_msgSend(*(id *)(a1 + 32), "statementHasRowAfterStepping:", a2))
  {
    do
    {
      if (sqlite3_column_type(a2, 0) == 1)
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", sqlite3_column_int64(a2, 0));
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

      }
    }
    while ((objc_msgSend(*(id *)(a1 + 32), "statementHasRowAfterStepping:", a2) & 1) != 0);
  }
  objc_autoreleasePoolPop(v4);
}

- (int)_maximumUnreportedToSelect
{
  return 1000;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
}

@end
