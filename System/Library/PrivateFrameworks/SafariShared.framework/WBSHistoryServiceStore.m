@implementation WBSHistoryServiceStore

- (void)getHighLevelHTTPFamilyDomainsVisitedAfterDate:(id)a3 beforeDate:(id)a4 onlyFromThisDevice:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __120__WBSHistoryServiceStore_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke;
  v16[3] = &unk_1E4B3BC28;
  v18 = v11;
  v19 = v12;
  v17 = v10;
  v20 = a5;
  v13 = v11;
  v14 = v10;
  v15 = v12;
  -[WBSHistoryServiceStore _waitForDatabase:](self, "_waitForDatabase:", v16);

}

- (void)computeFrequentlyVisitedSites:(unint64_t)a3 minimalVisitCountScore:(unint64_t)a4 blockList:(id)a5 allowList:(id)a6 options:(unint64_t)a7 currentTime:(double)a8 completionHandler:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  double v29;

  v16 = a5;
  v17 = a6;
  v18 = a9;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __137__WBSHistoryServiceStore_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler___block_invoke;
  v22[3] = &unk_1E4B3C230;
  v25 = v18;
  v26 = a3;
  v23 = v16;
  v24 = v17;
  v27 = a4;
  v28 = a7;
  v29 = a8;
  v19 = v17;
  v20 = v16;
  v21 = v18;
  -[WBSHistoryServiceStore _waitForDatabase:](self, "_waitForDatabase:", v22);

}

- (void)_waitForDatabase:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  NSObject *databaseQueue;
  _QWORD v7[5];
  void (**v8)(id, void *);

  v4 = (void (**)(id, void *))a3;
  -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v4[2](v4, v5);

  }
  else
  {
    databaseQueue = self->_databaseQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__WBSHistoryServiceStore__waitForDatabase___block_invoke;
    v7[3] = &unk_1E4B29E18;
    v7[4] = self;
    v8 = v4;
    dispatch_async(databaseQueue, v7);

  }
}

void __46__WBSHistoryServiceStore_releaseCloudHistory___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "releaseCloudHistory:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 14, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
}

void __137__WBSHistoryServiceStore_computeFrequentlyVisitedSites_minimalVisitCountScore_blockList_allowList_options_currentTime_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    objc_msgSend(v3, "computeFrequentlyVisitedSites:minimalVisitCountScore:blockList:allowList:options:currentTime:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(double *)(a1 + 80));
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 14, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  }
}

void __120__WBSHistoryServiceStore_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(unsigned __int8 *)(a1 + 56);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __120__WBSHistoryServiceStore_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke_2;
    v7[3] = &unk_1E4B3BBC0;
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v3, "getHighLevelHTTPFamilyDomainsVisitedAfterDate:beforeDate:onlyFromThisDevice:completionHandler:", v4, v5, v6, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)_load:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  double v17;
  void *v18;
  NSObject *v19;
  double v20;
  NSObject *v21;
  void *v22;
  id loadCompletionBlock;
  atomic<WBSHistoryServiceStoreState> *p_state;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *group;
  id v31;
  void *v32;
  void (**v33)(void);
  _QWORD v34[4];
  id v35;
  id v36;
  void (**v37)(void);
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  id v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[3];
  char v45;
  id location;
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  NSObject *v50;
  _QWORD v51[5];
  NSObject *v52;
  _QWORD v53[4];
  id v54;
  NSObject *v55;
  _QWORD *v56;
  _QWORD v57[5];
  id v58;
  _QWORD v59[4];
  NSObject *v60;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t *v63;
  _QWORD *v64;
  _QWORD v65[5];
  id v66;
  _QWORD v67[5];
  id v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint8_t buf[16];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v33 = (void (**)(void))a3;
  v4 = dispatch_group_create();
  group = dispatch_group_create();
  v29 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v81 = 0;
  v82 = &v81;
  v83 = 0x2020000000;
  v84 = 0;
  v75 = 0;
  v76 = &v75;
  v77 = 0x3032000000;
  v78 = __Block_byref_object_copy__23;
  v79 = __Block_byref_object_dispose__23;
  v80 = 0;
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__23;
  v73 = __Block_byref_object_dispose__23;
  v74 = 0;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x3032000000;
  v67[3] = __Block_byref_object_copy__23;
  v67[4] = __Block_byref_object_dispose__23;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v68 = (id)objc_claimAutoreleasedReturnValue();
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x3032000000;
  v65[3] = __Block_byref_object_copy__23;
  v65[4] = __Block_byref_object_dispose__23;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v66 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v4);
  -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v7 = MEMORY[0x1E0C809B0];
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __32__WBSHistoryServiceStore__load___block_invoke;
  v59[3] = &unk_1E4B3BA58;
  v61 = &v81;
  v62 = &v75;
  v63 = &v69;
  v64 = v65;
  v8 = v4;
  v60 = v8;
  objc_msgSend(v5, "fetchWithOptions:predicate:completionHandler:", 27, v6, v59);

  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy__23;
  v57[4] = __Block_byref_object_dispose__23;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v58 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(group);
  -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v7;
  v53[1] = 3221225472;
  v53[2] = __32__WBSHistoryServiceStore__load___block_invoke_32;
  v53[3] = &unk_1E4B3BAA8;
  v31 = v29;
  v54 = v31;
  v56 = v57;
  v10 = group;
  v55 = v10;
  objc_msgSend(v9, "fetchDomainExpansions:", v53);

  dispatch_group_enter(v10);
  -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v7;
  v51[1] = 3221225472;
  v51[2] = __32__WBSHistoryServiceStore__load___block_invoke_38;
  v51[3] = &unk_1E4B3BAD0;
  v51[4] = self;
  v12 = v10;
  v52 = v12;
  objc_msgSend(v11, "fetchDatabaseURL:", v51);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("last_maintenance_date"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v12);
  -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v7;
  v49[1] = 3221225472;
  v49[2] = __32__WBSHistoryServiceStore__load___block_invoke_41;
  v49[3] = &unk_1E4B3BAF8;
  v49[4] = self;
  v15 = v12;
  v50 = v15;
  objc_msgSend(v14, "fetchMetadataForKeys:completionHandler:", v13, v49);

  v16 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v32, "timeIntervalSinceNow");
    -[WBSHistoryServiceStore _load:].cold.3(v17);
  }

  v48[0] = v7;
  v48[1] = 3221225472;
  v48[2] = __32__WBSHistoryServiceStore__load___block_invoke_44;
  v48[3] = &unk_1E4B39388;
  v48[4] = self;
  if ((waitForGroupOrStopCondition(v8, (uint64_t)v48) & 1) != 0)
  {
    if (v70[5])
    {
      v33[2]();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSHistoryServiceStore _loadOnDatabaseQueue:readHandle:](self, "_loadOnDatabaseQueue:readHandle:", v82[3], v76[5]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v27, "timeIntervalSinceNow");
        -[WBSHistoryServiceStore _load:].cold.2(v20);
      }

      v21 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[WBSHistoryServiceStore _load:].cold.1(buf, objc_msgSend(v28, "count"), v21);

      v47[0] = v7;
      v47[1] = 3221225472;
      v47[2] = __32__WBSHistoryServiceStore__load___block_invoke_46;
      v47[3] = &unk_1E4B39388;
      v47[4] = self;
      if ((waitForGroupOrStopCondition(v15, (uint64_t)v47) & 1) != 0)
      {
        objc_initWeak(&location, self);
        v44[0] = 0;
        v44[1] = v44;
        v44[2] = 0x2020000000;
        v45 = 0;
        v42[0] = 0;
        v42[1] = v42;
        v42[2] = 0x3032000000;
        v42[3] = __Block_byref_object_copy__23;
        v42[4] = __Block_byref_object_dispose__23;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v43 = (id)objc_claimAutoreleasedReturnValue();
        v34[0] = v7;
        v34[1] = 3221225472;
        v34[2] = __32__WBSHistoryServiceStore__load___block_invoke_2;
        v34[3] = &unk_1E4B3BB20;
        v38 = v44;
        objc_copyWeak(&v41, &location);
        v37 = v33;
        v39 = v42;
        v40 = v67;
        v35 = v28;
        v36 = v31;
        v22 = (void *)MEMORY[0x1A8599ED0](v34);
        loadCompletionBlock = self->_loadCompletionBlock;
        self->_loadCompletionBlock = v22;

        -[WBSHistoryServiceStore _scheduleMaintenance](self, "_scheduleMaintenance");
        p_state = &self->_state;
        while (!__ldaxr((unint64_t *)p_state))
        {
          if (!__stlxr(1uLL, (unint64_t *)p_state))
            goto LABEL_18;
        }
        __clrex();
LABEL_18:
        dispatch_async(MEMORY[0x1E0C80D38], self->_loadCompletionBlock);

        objc_destroyWeak(&v41);
        _Block_object_dispose(v42, 8);

        _Block_object_dispose(v44, 8);
        objc_destroyWeak(&location);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 89, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (*)(void (**)(void), void *))v33[2])(v33, v26);

      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 89, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(void), void *))v33[2])(v33, v18);

  }
  _Block_object_dispose(v57, 8);

  _Block_object_dispose(v65, 8);
  _Block_object_dispose(v67, 8);

  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v75, 8);

  _Block_object_dispose(&v81, 8);
}

- (WBSHistoryServiceDatabaseProtocol)databaseProxy
{
  return (WBSHistoryServiceDatabaseProtocol *)objc_getProperty(self, a2, 136, 1);
}

BOOL __32__WBSHistoryServiceStore__load___block_invoke_44(uint64_t a1)
{
  unint64_t v1;

  v1 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 24));
  return v1 == 2;
}

BOOL __52__WBSHistoryServiceStore_loadWithCompletionHandler___block_invoke_15(uint64_t a1)
{
  unint64_t v1;

  v1 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 24));
  return v1 == 2;
}

BOOL __32__WBSHistoryServiceStore__load___block_invoke_46(uint64_t a1)
{
  unint64_t v1;

  v1 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 24));
  return v1 == 2;
}

- (void)_scheduleMaintenance
{
  id WeakRetained;
  WBSPeriodicActivityScheduler *v4;
  NSDate *lastMaintenanceDate;
  uint64_t v6;
  WBSPeriodicActivityScheduler *v7;
  WBSPeriodicActivityScheduler *maintenanceScheduler;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(WeakRetained, "historyStoreShouldScheduleMaintenance:", self) & 1) != 0)
  {
    objc_initWeak(&location, self);
    v4 = [WBSPeriodicActivityScheduler alloc];
    lastMaintenanceDate = self->_lastMaintenanceDate;
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke;
    v11[3] = &unk_1E4B2C008;
    objc_copyWeak(&v12, &location);
    v7 = -[WBSPeriodicActivityScheduler initWithInterval:minimumDelay:lastFireDate:block:](v4, "initWithInterval:minimumDelay:lastFireDate:block:", lastMaintenanceDate, v11, 86400.0, 30.0);
    maintenanceScheduler = self->_maintenanceScheduler;
    self->_maintenanceScheduler = v7;

    -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_4;
    v10[3] = &unk_1E4B3AA10;
    v10[4] = self;
    objc_msgSend(v9, "fetchEventsForListener:completionHandler:", CFSTR("Safari"), v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (id)_loadOnDatabaseQueue:(unint64_t)a3 readHandle:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t **i;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v17;
  _QWORD v18[5];
  _QWORD v19[6];
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  uint64_t (*v26)(uint64_t);
  _BYTE v27[32];
  uint64_t v28;
  int v29;
  unint64_t *v30;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSHistoryObjectCache reserveItemCapacity:](self->_cache, "reserveItemCapacity:", a3);
  v22 = 0;
  v23 = &v22;
  v24 = 0x5812000000;
  v25 = __Block_byref_object_copy__21;
  v26 = __Block_byref_object_dispose__22;
  memset(v27, 0, sizeof(v27));
  v28 = 0;
  v29 = 1065353216;
  v8 = objc_msgSend(v6, "fileDescriptor");
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __58__WBSHistoryServiceStore__loadOnDatabaseQueue_readHandle___block_invoke;
  v20[3] = &unk_1E4B3BA08;
  v20[4] = self;
  v10 = v7;
  v21 = v10;
  v18[4] = self;
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __58__WBSHistoryServiceStore__loadOnDatabaseQueue_readHandle___block_invoke_24;
  v19[3] = &unk_1E4B3BA30;
  v19[4] = self;
  v19[5] = &v22;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __58__WBSHistoryServiceStore__loadOnDatabaseQueue_readHandle___block_invoke_27;
  v18[3] = &unk_1E4B39388;
  SafariShared::ReadStreamedObjects(v8, v20, v19, v18);
  objc_msgSend(v6, "closeFile");
  for (i = (uint64_t **)v23[8]; i; i = (uint64_t **)*i)
  {
    v12 = i[3];
    v13 = objc_msgSend(v12, "redirectSourceDatabaseID");
    if (v13)
    {
      v17 = v13;
      v30 = (unint64_t *)&v17;
      objc_msgSend(v12, "setRedirectSource:", std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t)(v23 + 6), (unint64_t *)&v17, (uint64_t)&std::piecewise_construct, &v30)[3]);
    }
    v14 = objc_msgSend(v12, "redirectDestinationDatabaseID");
    if (v14)
    {
      v17 = v14;
      v30 = (unint64_t *)&v17;
      objc_msgSend(v12, "setRedirectDestination:", std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t)(v23 + 6), (unint64_t *)&v17, (uint64_t)&std::piecewise_construct, &v30)[3]);
    }

  }
  v15 = v10;

  _Block_object_dispose(&v22, 8);
  std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::~__hash_table((uint64_t)&v27[8]);

  return v15;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

uint64_t __52__WBSHistoryServiceStore_loadWithCompletionHandler___block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_load:", *(_QWORD *)(a1 + 40));
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

void __32__WBSHistoryServiceStore__load___block_invoke_48(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 72);
  *(_QWORD *)(v1 + 72) = 0;

}

void __32__WBSHistoryServiceStore__load___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id *WeakRetained;
  id v4;
  id v5;
  NSObject *v6;
  double v7;
  NSObject *v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
    if (WeakRetained)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0D89D00]);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __32__WBSHistoryServiceStore__load___block_invoke_48;
      v14[3] = &unk_1E4B2A2C8;
      v14[4] = WeakRetained;
      objc_msgSend(v4, "setHandler:", v14);
      v5 = objc_loadWeakRetained(WeakRetained + 14);
      if (v5)
      {
        v6 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "timeIntervalSinceNow");
          __32__WBSHistoryServiceStore__load___block_invoke_2_cold_3(v7);
        }

        v8 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "timeIntervalSinceNow");
          *(_DWORD *)buf = 136446466;
          v16 = "load";
          v17 = 2048;
          v18 = -v9;
          _os_log_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_INFO, "#perf - %{public}s: %f", buf, 0x16u);
        }

        v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = objc_msgSend(*(id *)(a1 + 32), "count");
          *(_DWORD *)buf = 134217984;
          v16 = (const char *)v11;
          _os_log_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_INFO, "Finished loading history. Total item count: <%zi>", buf, 0xCu);
        }

        objc_msgSend(v5, "historyLoader:didLoadItems:stringsForUserTypeDomainExpansion:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        objc_msgSend(v5, "historyLoaderDidFinishLoading:", WeakRetained);
      }
      else
      {
        v13 = WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          __32__WBSHistoryServiceStore__load___block_invoke_2_cold_2();
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
    else
    {
      v12 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __32__WBSHistoryServiceStore__load___block_invoke_2_cold_1();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

- (void)loadWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *databaseQueue;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[WBSHistoryServiceStore _connectOptions](self, "_connectOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__WBSHistoryServiceStore_loadWithCompletionHandler___block_invoke;
  block[3] = &unk_1E4B2B178;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(databaseQueue, block);

}

- (id)_connectOptions
{
  void *v3;
  void *v4;
  NSString *databaseID;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Safari"), CFSTR("WBSHistoryConnectionOptionEventListenerName"));
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -self->_historyAgeLimit);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("WBSHistoryConnectionOptionLegacyDatabaseImportAfterDate"));

  databaseID = self->_databaseID;
  if (databaseID)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", databaseID, CFSTR("WBSHistoryConnectionOptionDatabaseID"));
  return v3;
}

void __32__WBSHistoryServiceStore__load___block_invoke_41(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v3, "safari_numberForKey:", CFSTR("last_maintenance_date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  v6 = objc_claimAutoreleasedReturnValue();
  v8 = (id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v7 + 80);
  *(_QWORD *)(v7 + 80) = v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "timeIntervalSinceReferenceDate");
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v14 = v13;

  if (v11 > v14)
  {
    v15 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __32__WBSHistoryServiceStore__load___block_invoke_41_cold_1(a1 + 32, v15);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)*v8 + 10);
    *((_QWORD *)*v8 + 10) = v16;

    objc_msgSend(*v8, "_updateLastMaintenanceDate");
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (BOOL)isUsingInMemoryDatabase
{
  NSURL *databaseURL;
  void *v3;

  databaseURL = self->_databaseURL;
  WBSHistoryInMemoryDatabaseURL();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(databaseURL) = -[NSURL isEqual:](databaseURL, "isEqual:", v3);

  return (char)databaseURL;
}

void __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_4_cold_1();
    }
LABEL_12:

    goto LABEL_13;
  }
  if (objc_msgSend(v5, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v13;
      v10 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(a1 + 32), "handleEvent:completionHandler:", v10, 3221225472, __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_74, &unk_1E4B3BD98, *(_QWORD *)(a1 + 32), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
    goto LABEL_12;
  }
LABEL_13:

}

- (WBSHistoryServiceStore)initWithDatabaseID:(id)a3 itemCountLimit:(unint64_t)a4 historyAgeLimit:(double)a5 historyItemClass:(Class)a6
{
  id v10;
  WBSHistoryConnectionProxy *v11;
  WBSHistoryServiceStore *v12;

  v10 = a3;
  v11 = objc_alloc_init(WBSHistoryConnectionProxy);
  v12 = -[WBSHistoryServiceStore initWithDatabaseID:itemCountLimit:historyAgeLimit:historyItemClass:connectionProxy:](self, "initWithDatabaseID:itemCountLimit:historyAgeLimit:historyItemClass:connectionProxy:", v10, a4, a6, v11, a5);

  return v12;
}

- (WBSHistoryServiceStore)initWithDatabaseID:(id)a3 itemCountLimit:(unint64_t)a4 historyAgeLimit:(double)a5 historyItemClass:(Class)a6 connectionProxy:(id)a7
{
  id v13;
  id v14;
  WBSHistoryServiceStore *v15;
  WBSHistoryServiceStore *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *databaseQueue;
  NSObject *v19;
  NSObject *v20;
  WBSHistoryObjectCache *v21;
  WBSHistoryObjectCache *cache;
  WBSHistoryCrypto *v23;
  WBSHistoryCrypto *crypto;
  void *v25;
  WBSHistoryServiceStore *v26;
  objc_super v28;

  v13 = a3;
  v14 = a7;
  v28.receiver = self;
  v28.super_class = (Class)WBSHistoryServiceStore;
  v15 = -[WBSHistoryServiceStore init](&v28, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_historyAgeLimit = a5;
    v15->_historyItemClass = a6;
    v15->_itemCountLimit = a4;
    atomic_store(0, (unint64_t *)&v15->_state);
    objc_storeStrong((id *)&v15->_connection, a7);
    v17 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryServiceStore", 0);
    databaseQueue = v16->_databaseQueue;
    v16->_databaseQueue = (OS_dispatch_queue *)v17;

    v19 = v16->_databaseQueue;
    +[WBSHistoryItem synchronizationQueue](WBSHistoryItem, "synchronizationQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v19, v20);

    objc_storeStrong((id *)&v16->_databaseID, a3);
    v21 = objc_alloc_init(WBSHistoryObjectCache);
    cache = v16->_cache;
    v16->_cache = v21;

    v23 = objc_alloc_init(WBSHistoryCrypto);
    crypto = v16->_crypto;
    v16->_crypto = v23;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v16, sel_connectionProxyConnectionWasInterrupted_, CFSTR("WBSHistoryConnectionWasInterrupted"), v14);

    v26 = v16;
  }

  return v16;
}

void __64__WBSHistoryServiceStore__connectWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  NSObject *v9;
  id WeakRetained;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a5;
  if ((objc_msgSend(v8, "safari_isSQLiteCorruptionError") & 1) != 0)
  {
    v9 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __64__WBSHistoryServiceStore__connectWithOptions_completionHandler___block_invoke_cold_1();
    }

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
    objc_msgSend(WeakRetained, "historyStoreDidFailDatabaseIntegrityCheck:", *(_QWORD *)(a1 + 32));

    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__WBSHistoryServiceStore__connectWithOptions_completionHandler___block_invoke_11;
    v16[3] = &unk_1E4B3B9B8;
    v13 = *(_QWORD *)(a1 + 48);
    v20 = *(id *)(a1 + 56);
    v14 = *(id *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 32);
    v17 = v14;
    v18 = v15;
    v19 = *(id *)(a1 + 48);
    objc_msgSend(v12, "connectWithOptions:delegate:completionHandler:", v11, v13, v16);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __52__WBSHistoryServiceStore_loadWithCompletionHandler___block_invoke_13(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  NSObject *v11;
  double v12;
  int v13;
  const char *v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a5;
  if (v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a5);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = a3;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = a4;
    objc_msgSend(*(id *)(a1 + 32), "setDatabaseProxy:", v9);
  }
  v11 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "timeIntervalSinceNow");
    v13 = 136446466;
    v14 = "connect_with_options_call";
    v15 = 2048;
    v16 = -v12;
    _os_log_impl(&dword_1A3D90000, v11, OS_LOG_TYPE_INFO, "#perf - %{public}s: %f", (uint8_t *)&v13, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)setDatabaseProxy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void)releaseCloudHistory:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__WBSHistoryServiceStore_releaseCloudHistory___block_invoke;
  v6[3] = &unk_1E4B3C2A8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WBSHistoryServiceStore _waitForDatabase:](self, "_waitForDatabase:", v6);

}

void __52__WBSHistoryServiceStore_loadWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  dispatch_block_t v10;
  _QWORD block[5];
  id v12;
  _QWORD v13[5];
  _QWORD v14[5];
  NSObject *v15;
  uint64_t *v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_group_create();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__23;
  v24 = __Block_byref_object_dispose__23;
  v25 = 0;
  dispatch_group_enter(v2);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__23;
  v18[4] = __Block_byref_object_dispose__23;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__WBSHistoryServiceStore_loadWithCompletionHandler___block_invoke_13;
  v14[3] = &unk_1E4B3B9E0;
  v14[4] = v3;
  v16 = &v20;
  v17 = v18;
  v6 = v2;
  v15 = v6;
  objc_msgSend(v3, "_connectWithOptions:completionHandler:", v4, v14);
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __52__WBSHistoryServiceStore_loadWithCompletionHandler___block_invoke_15;
  v13[3] = &unk_1E4B39388;
  v13[4] = *(_QWORD *)(a1 + 32);
  if ((waitForGroupOrStopCondition(v6, (uint64_t)v13) & 1) == 0)
  {
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 89, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
LABEL_8:

    goto LABEL_9;
  }
  if (!v21[5])
  {
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __52__WBSHistoryServiceStore_loadWithCompletionHandler___block_invoke_18;
    block[3] = &unk_1E4B2A250;
    block[4] = *(_QWORD *)(a1 + 32);
    v12 = *(id *)(a1 + 48);
    v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
    _os_activity_initiate(&dword_1A3D90000, "Load history", OS_ACTIVITY_FLAG_DETACHED, v10);

    v9 = v12;
    goto LABEL_8;
  }
  v7 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend((id)v21[5], "safari_privacyPreservingDescription");
    objc_claimAutoreleasedReturnValue();
    __52__WBSHistoryServiceStore_loadWithCompletionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_9:

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

}

- (void)_connectWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  WBSHistoryServiceDatabaseDelegateWeakProxy *v8;
  WBSHistoryConnectionProxy *connection;
  id v10;
  id v11;
  WBSHistoryServiceDatabaseDelegateWeakProxy *v12;
  _QWORD v13[5];
  id v14;
  WBSHistoryServiceDatabaseDelegateWeakProxy *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = -[WBSHistoryServiceDatabaseDelegateWeakProxy initWithDelegate:]([WBSHistoryServiceDatabaseDelegateWeakProxy alloc], "initWithDelegate:", self);
  connection = self->_connection;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__WBSHistoryServiceStore__connectWithOptions_completionHandler___block_invoke;
  v13[3] = &unk_1E4B3B9B8;
  v10 = v7;
  v16 = v10;
  v13[4] = self;
  v11 = v6;
  v14 = v11;
  v15 = v8;
  v12 = v8;
  -[WBSHistoryConnectionProxy connectWithOptions:delegate:completionHandler:](connection, "connectWithOptions:delegate:completionHandler:", v11, v12, v13);

}

void __120__WBSHistoryServiceStore_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __120__WBSHistoryServiceStore_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke_2_cold_1();
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __32__WBSHistoryServiceStore__load___block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __32__WBSHistoryServiceStore__load___block_invoke_38_cold_1();
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), a2);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

void __32__WBSHistoryServiceStore__load___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  double v12;

  v8 = a3;
  v9 = a4;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a4);
  if (v9)
  {
    v10 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __32__WBSHistoryServiceStore__load___block_invoke_cold_2();
    }

  }
  v11 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "timeIntervalSinceNow");
    __32__WBSHistoryServiceStore__load___block_invoke_cold_1(v12);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __32__WBSHistoryServiceStore__load___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  double v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __32__WBSHistoryServiceStore__load___block_invoke_32_cold_2();
    }

  }
  else
  {
    v8 = objc_msgSend(v5, "fileDescriptor");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __32__WBSHistoryServiceStore__load___block_invoke_33;
    v11[3] = &unk_1E4B3BA80;
    v12 = *(id *)(a1 + 32);
    SafariShared::ReadStreamedDomainExpansions(v8, v11);

  }
  v9 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "timeIntervalSinceNow");
    __32__WBSHistoryServiceStore__load___block_invoke_32_cold_1(v10);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __43__WBSHistoryServiceStore__waitForDatabase___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "databaseProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

void __43__WBSHistoryServiceStore__waitForDatabase___block_invoke(uint64_t a1)
{
  qos_class_t v2;
  NSObject *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v2 = qos_class_self();
  dispatch_get_global_queue(v2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__WBSHistoryServiceStore__waitForDatabase___block_invoke_2;
  v5[3] = &unk_1E4B29E18;
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_async(v3, v5);

}

void __64__WBSHistoryServiceStore__connectWithOptions_completionHandler___block_invoke_11(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v7 = a2;
  v8 = a5;
  if ((objc_msgSend(v8, "safari_isSQLiteCorruptionError") & 1) != 0)
  {
    v9 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __64__WBSHistoryServiceStore__connectWithOptions_completionHandler___block_invoke_11_cold_1();
    }

    v10 = (void *)a1[4];
    if (v10)
    {
      v11 = objc_msgSend(v10, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;
    WBSHistoryInMemoryDatabaseURL();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("WBSHistoryConnectionOptionDatabaseURL"));

    objc_msgSend(*(id *)(a1[5] + 32), "connectWithOptions:delegate:completionHandler:", v12, a1[6], a1[7]);
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }

}

void __58__WBSHistoryServiceStore__loadOnDatabaseQueue_readHandle___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  if (*(_QWORD *)(a2 + 48))
  {
    v4 = (void *)objc_msgSend(objc_alloc(*(Class *)(*(_QWORD *)(a1 + 32) + 8)), "initWithHistoryStreamedItem:", a2);
    if (v4)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setItem:forID:", v4, *(_QWORD *)(a2 + 8));
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
    }
    else
    {
      v6 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_INFO, "Failed to create WBSHistoryItem", v7, 2u);
      }
    }

  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __58__WBSHistoryServiceStore__loadOnDatabaseQueue_readHandle___block_invoke_cold_1();
  }
}

void __58__WBSHistoryServiceStore__loadOnDatabaseQueue_readHandle___block_invoke_24(uint64_t a1, uint64_t a2)
{
  void *v4;
  WBSHistoryVisit *v5;
  uint64_t v6;
  WBSHistoryVisit *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "itemForID:", *(_QWORD *)(a2 + 16));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[WBSHistoryVisit initWithHistoryItem:streamedVisit:]([WBSHistoryVisit alloc], "initWithHistoryItem:streamedVisit:", v4, a2);
    if (v5)
    {
      objc_msgSend(v4, "updateLastVisitIfNil:", v5);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48;
      *(_QWORD *)&v11 = *(_QWORD *)(a2 + 8);
      v7 = v5;
      *((_QWORD *)&v11 + 1) = v7;
      std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::__emplace_unique_key_args<long long,std::pair<long long,WBSHistoryItem * {__strong}>>(v6, (unint64_t *)&v11, (uint64_t *)&v11);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setVisit:forID:", v7, *(_QWORD *)(a2 + 8), (_QWORD)v11);
    }
    else
    {
      v10 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_INFO, "Failed to create WBSHistoryVisit", (uint8_t *)&v11, 2u);
      }
    }

  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a2 + 16);
      LODWORD(v11) = 134217984;
      *(_QWORD *)((char *)&v11 + 4) = v9;
      _os_log_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_INFO, "Failed to retrieve item %lli", (uint8_t *)&v11, 0xCu);
    }
  }

}

BOOL __58__WBSHistoryServiceStore__loadOnDatabaseQueue_readHandle___block_invoke_27(uint64_t a1)
{
  unint64_t v1;

  v1 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 24));
  return v1 == 2;
}

void __32__WBSHistoryServiceStore__load___block_invoke_33(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)(a2 + 8));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (*(uint64_t *)(a2 + 16) >= 1)
  {
    v4 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
      ++v4;
    }
    while (v4 < *(_QWORD *)(a2 + 16));
  }

}

- (void)waitForLoadingToComplete
{
  NSObject *databaseQueue;
  uint64_t v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__51;
  v9 = __Block_byref_object_dispose__52;
  v10 = 0;
  databaseQueue = self->_databaseQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__WBSHistoryServiceStore_waitForLoadingToComplete__block_invoke;
  v4[3] = &unk_1E4B2BDF8;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(databaseQueue, v4);
  v3 = v6[5];
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  _Block_object_dispose(&v5, 8);

}

void __50__WBSHistoryServiceStore_waitForLoadingToComplete__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = MEMORY[0x1A8599ED0](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_databaseFetchWithOptions:(unint64_t)a3 predicate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id WeakRetained;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a4;
  v9 = a5;
  -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __80__WBSHistoryServiceStore__databaseFetchWithOptions_predicate_completionHandler___block_invoke;
    v15[3] = &unk_1E4B3BB70;
    v17 = v9;
    v15[4] = self;
    v13 = WeakRetained;
    v16 = v13;
    objc_msgSend(v12, "fetchWithOptions:predicate:completionHandler:", a3, v8, v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSHistoryErrorDomain"), 4, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v14);

  }
}

void __80__WBSHistoryServiceStore__databaseFetchWithOptions_predicate_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __80__WBSHistoryServiceStore__databaseFetchWithOptions_predicate_completionHandler___block_invoke_2;
    v12[3] = &unk_1E4B39360;
    v9 = v6;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v13 = v9;
    v14 = v10;
    v15 = v11;
    v16 = *(id *)(a1 + 48);
    dispatch_async(v8, v12);

  }
}

void __80__WBSHistoryServiceStore__databaseFetchWithOptions_predicate_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "fileDescriptor");
  v4 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __80__WBSHistoryServiceStore__databaseFetchWithOptions_predicate_completionHandler___block_invoke_3;
  v22[3] = &unk_1E4B3BA08;
  v5 = *(void **)(a1 + 48);
  v22[4] = *(_QWORD *)(a1 + 40);
  v23 = v5;
  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __80__WBSHistoryServiceStore__databaseFetchWithOptions_predicate_completionHandler___block_invoke_4;
  v20[3] = &unk_1E4B3BB48;
  v20[4] = *(_QWORD *)(a1 + 40);
  v6 = v2;
  v21 = v6;
  SafariShared::ReadStreamedObjects(v3, v22, v20, 0);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "redirectSourceDatabaseID", (_QWORD)v16);
        if (v12)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "visitForID:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setRedirectSource:", v13);

        }
        v14 = objc_msgSend(v11, "redirectDestinationDatabaseID", v12);
        if (v14)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "visitForID:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setRedirectDestination:", v15);

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v8);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __80__WBSHistoryServiceStore__databaseFetchWithOptions_predicate_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "itemForID:", *(_QWORD *)(a2 + 8));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    objc_msgSend(v4, "updateWithStreamedItem:", a2);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)(a2 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "historyStore:itemForURLString:createIfNeeded:", v6, v7, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "updateWithStreamedItem:", a2);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setItem:forID:", v8, *(_QWORD *)(a2 + 8));
    }
    else
    {
      v8 = 0;
    }
  }

}

void __80__WBSHistoryServiceStore__databaseFetchWithOptions_predicate_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  WBSHistoryVisit *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "visitForID:", *(_QWORD *)(a2 + 8));
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "itemForID:", *(_QWORD *)(a2 + 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v5 = -[WBSHistoryVisit initWithHistoryItem:streamedVisit:]([WBSHistoryVisit alloc], "initWithHistoryItem:streamedVisit:", v6, a2);
      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setVisit:forID:", v5, *(_QWORD *)(a2 + 8));
LABEL_12:

        goto LABEL_13;
      }
      v12 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        v9 = "Failed to create WBSHistoryVisit";
        v10 = v12;
        v11 = 2;
        goto LABEL_10;
      }
    }
    else
    {
      v7 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = *(_QWORD *)(a2 + 16);
        v13 = 134217984;
        v14 = v8;
        v9 = "Failed to retrieve item %lli";
        v10 = v7;
        v11 = 12;
LABEL_10:
        _os_log_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v13, v11);
      }
    }
    v5 = 0;
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  v5 = (WBSHistoryVisit *)v4;
LABEL_13:

}

- (id)_fetchVisitsOnDatabaseQueue:(unint64_t)a3 predicate:(id)a4 error:(id *)a5
{
  unint64_t v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__23;
  v27 = __Block_byref_object_dispose__23;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__23;
  v21 = __Block_byref_object_dispose__23;
  v7 = a3 & 0xB;
  v22 = 0;
  v8 = a4;
  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__WBSHistoryServiceStore__fetchVisitsOnDatabaseQueue_predicate_error___block_invoke;
  v13[3] = &unk_1E4B3BB98;
  v15 = &v17;
  v16 = &v23;
  v14 = v9;
  v10 = v9;
  -[WBSHistoryServiceStore _databaseFetchWithOptions:predicate:completionHandler:](self, "_databaseFetchWithOptions:predicate:completionHandler:", v7, v8, v13);

  dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (a5)
    *a5 = objc_retainAutorelease((id)v18[5]);
  v11 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __70__WBSHistoryServiceStore__fetchVisitsOnDatabaseQueue_predicate_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)getVisitsCreatedAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBSHistoryVisitsInTimeRangePredicate *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[WBSHistoryVisitsInTimeRangePredicate initWithStartDate:endDate:urlString:urlHash:urlSalt:]([WBSHistoryVisitsInTimeRangePredicate alloc], "initWithStartDate:endDate:urlString:urlHash:urlSalt:", v8, v9, 0, 0, 0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__WBSHistoryServiceStore_getVisitsCreatedAfterDate_beforeDate_completionHandler___block_invoke;
  v13[3] = &unk_1E4B3BBC0;
  v12 = v10;
  v14 = v12;
  -[WBSHistoryServiceStore _databaseFetchWithOptions:predicate:completionHandler:](self, "_databaseFetchWithOptions:predicate:completionHandler:", 2, v11, v13);

}

void __81__WBSHistoryServiceStore_getVisitsCreatedAfterDate_beforeDate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __81__WBSHistoryServiceStore_getVisitsCreatedAfterDate_beforeDate_completionHandler___block_invoke_cold_1();
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)checkIfLocalVisitExistsInAnyOfItems:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *databaseQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "safari_arrayByMappingObjectsUsingBlock:", &__block_literal_global_64);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__WBSHistoryServiceStore_checkIfLocalVisitExistsInAnyOfItems_withCompletion___block_invoke_2;
  block[3] = &unk_1E4B2B178;
  block[4] = self;
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(databaseQueue, block);

}

id __77__WBSHistoryServiceStore_checkIfLocalVisitExistsInAnyOfItems_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v2, "databaseID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __77__WBSHistoryServiceStore_checkIfLocalVisitExistsInAnyOfItems_withCompletion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "databaseProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "checkIfLocalVisitExistsForDatabaseIDs:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)removePastHistoryVisitsForItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  WBSHistoryServiceStore *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke;
  block[3] = &unk_1E4B2A278;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(databaseQueue, block);

}

void __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  WBSHistoryServiceURLRepresentation *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void (**v17)(void);
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  objc_msgSend(a1[4], "urlString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C99E60];
    v4 = -[WBSHistoryServiceURLRepresentation initWithURLString:]([WBSHistoryServiceURLRepresentation alloc], "initWithURLString:", v2);
    objc_msgSend(v3, "setWithObject:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(a1[4], "lastVisitOnSynchronizationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "visitTime");
    objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v6, "compare:", v9);
    objc_msgSend(a1[5], "databaseProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke_60;
    v21[3] = &unk_1E4B3BC50;
    v13 = v2;
    v22 = v13;
    v23 = a1[6];
    objc_msgSend(v11, "clearHistoryItems:afterDate:beforeDate:tombstoneMode:completionHandler:", v18, v5, v6, 1, v21);

    if (v10 == -1)
    {
      objc_msgSend(a1[5], "databaseProxy");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke_62;
      v19[3] = &unk_1E4B2AD70;
      v20 = v13;
      objc_msgSend(v14, "clearHistoryItems:afterDate:beforeDate:tombstoneMode:completionHandler:", v18, v5, v15, 0, v19);

    }
  }
  else
  {
    v16 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke_cold_1();
    v17 = (void (**)(void))a1[6];
    if (v17)
      v17[2]();
  }

}

void __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke_60(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke_60_cold_1();
    }

  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

void __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke_62(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke_62_cold_1();
    }

  }
}

- (void)visitsWereAdded:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = WBSHistoryItemSynchronizationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__WBSHistoryServiceStore_visitsWereAdded___block_invoke;
  v7[3] = &unk_1E4B2B448;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __42__WBSHistoryServiceStore_visitsWereAdded___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42__WBSHistoryServiceStore_visitsWereAdded___block_invoke_2;
  v2[3] = &unk_1E4B3BC98;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_waitForDatabase:", v2);

}

void __42__WBSHistoryServiceStore_visitsWereAdded___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  WBSHistoryVisitIdentifier *v7;
  void *v8;
  WBSHistoryVisitIdentifier *v9;
  void *v10;
  WBSHistoryVisitIdentifier *v11;
  void *v12;
  void *v13;
  WBSHistoryVisitIdentifier *v14;
  void *v15;
  id obj;
  uint64_t v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = a2;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v3)
  {
    v17 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v5, "item");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = [WBSHistoryVisitIdentifier alloc];
        objc_msgSend(v6, "urlString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "visitTime");
        v9 = -[WBSHistoryVisitIdentifier initWithURLString:visitTime:](v7, "initWithURLString:visitTime:", v8);

        objc_msgSend(v5, "redirectSource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = [WBSHistoryVisitIdentifier alloc];
          objc_msgSend(v10, "item");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "urlString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "visitTime");
          v14 = -[WBSHistoryVisitIdentifier initWithURLString:visitTime:](v11, "initWithURLString:visitTime:", v13);

        }
        else
        {
          v14 = 0;
        }

        objc_msgSend(v5, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "recordVisitWithIdentifier:sourceVisit:title:wasHTTPNonGet:loadSuccessful:origin:attributes:statusCode:completionHandler:", v9, v14, v15, objc_msgSend(v5, "wasHTTPNonGet"), objc_msgSend(v5, "loadWasSuccessful"), objc_msgSend(v5, "origin"), objc_msgSend(v5, "attributes"), objc_msgSend(v6, "statusCode"), &__block_literal_global_64);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v3);
  }

}

void __42__WBSHistoryServiceStore_visitsWereAdded___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __42__WBSHistoryServiceStore_visitsWereAdded___block_invoke_3_cold_1();
    }

  }
}

- (void)visitTitleWasUpdated:(id)a3
{
  id v4;
  void *v5;
  WBSHistoryVisitIdentifier *v6;
  void *v7;
  void *v8;
  WBSHistoryVisitIdentifier *v9;
  id v10;
  WBSHistoryVisitIdentifier *v11;
  _QWORD v12[4];
  WBSHistoryVisitIdentifier *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSHistoryServiceStore visitsWereModified:](self, "visitsWereModified:", v5);

  v6 = [WBSHistoryVisitIdentifier alloc];
  objc_msgSend(v4, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "urlString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visitTime");
  v9 = -[WBSHistoryVisitIdentifier initWithURLString:visitTime:](v6, "initWithURLString:visitTime:", v8);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__WBSHistoryServiceStore_visitTitleWasUpdated___block_invoke;
  v12[3] = &unk_1E4B3BCE0;
  v13 = v9;
  v10 = v4;
  v14 = v10;
  v11 = v9;
  -[WBSHistoryServiceStore _waitForDatabase:](self, "_waitForDatabase:", v12);

}

void __47__WBSHistoryServiceStore_visitTitleWasUpdated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateVisitWithIdentifier:title:completionHandler:", v3, v4, &__block_literal_global_66);

}

void __47__WBSHistoryServiceStore_visitTitleWasUpdated___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __47__WBSHistoryServiceStore_visitTitleWasUpdated___block_invoke_2_cold_1();
    }

  }
}

- (void)visitAttributeWasUpdated:(id)a3 removeAttributes:(unint64_t)a4 addAttributes:(unint64_t)a5
{
  id v8;
  WBSHistoryVisitIdentifier *v9;
  void *v10;
  void *v11;
  WBSHistoryVisitIdentifier *v12;
  WBSHistoryVisitIdentifier *v13;
  _QWORD v14[4];
  WBSHistoryVisitIdentifier *v15;
  unint64_t v16;
  unint64_t v17;

  v8 = a3;
  v9 = [WBSHistoryVisitIdentifier alloc];
  objc_msgSend(v8, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "urlString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "visitTime");
  v12 = -[WBSHistoryVisitIdentifier initWithURLString:visitTime:](v9, "initWithURLString:visitTime:", v11);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__WBSHistoryServiceStore_visitAttributeWasUpdated_removeAttributes_addAttributes___block_invoke;
  v14[3] = &unk_1E4B3BD28;
  v15 = v12;
  v16 = a4;
  v17 = a5;
  v13 = v12;
  -[WBSHistoryServiceStore _waitForDatabase:](self, "_waitForDatabase:", v14);

}

uint64_t __82__WBSHistoryServiceStore_visitAttributeWasUpdated_removeAttributes_addAttributes___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "updateVisitWithIdentifier:removeAttributes:addAttributes:completionHandler:", a1[4], a1[5], a1[6], &__block_literal_global_67_0);
}

void __82__WBSHistoryServiceStore_visitAttributeWasUpdated_removeAttributes_addAttributes___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __82__WBSHistoryServiceStore_visitAttributeWasUpdated_removeAttributes_addAttributes___block_invoke_2_cold_1();
    }

  }
}

- (void)clearHistoryWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *databaseQueue;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v4 = a3;
  v5 = operator new();
  MEMORY[0x1A8599720](v5, CFSTR("com.apple.SafariShared.WBSHistoryServiceStore"));
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__WBSHistoryServiceStore_clearHistoryWithCompletionHandler___block_invoke;
  block[3] = &unk_1E4B393B0;
  v9 = v4;
  v10 = v5;
  block[4] = self;
  v7 = v4;
  dispatch_async(databaseQueue, block);

}

void __60__WBSHistoryServiceStore_clearHistoryWithCompletionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;

  v2 = *(id **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "databaseProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearAllHistoryInsertingTombstoneUpToDate:completionHandler:", v4, &__block_literal_global_68);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "clear");
  if (*(_QWORD *)(a1 + 40))
    dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 40));
  if (v2)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v2);
    JUMPOUT(0x1A85998ACLL);
  }
}

void __60__WBSHistoryServiceStore_clearHistoryWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __60__WBSHistoryServiceStore_clearHistoryWithCompletionHandler___block_invoke_2_cold_1();
    }

  }
}

- (void)vacuumHistoryWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__WBSHistoryServiceStore_vacuumHistoryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

void __61__WBSHistoryServiceStore_vacuumHistoryWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "databaseProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__WBSHistoryServiceStore_vacuumHistoryWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E4B2B320;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "vacuumHistoryWithCompletionHandler:", v3);

}

void __61__WBSHistoryServiceStore_vacuumHistoryWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __61__WBSHistoryServiceStore_vacuumHistoryWithCompletionHandler___block_invoke_2_cold_1();
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)clearHistoryVisitsAddedAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *databaseQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  WBSHistoryServiceStore *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  databaseQueue = self->_databaseQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__WBSHistoryServiceStore_clearHistoryVisitsAddedAfterDate_beforeDate_completionHandler___block_invoke;
  v15[3] = &unk_1E4B3BDC0;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(databaseQueue, v15);

}

void __88__WBSHistoryServiceStore_clearHistoryVisitsAddedAfterDate_beforeDate_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v3 = (uint64_t *)(a1 + 32);
  v2 = *(void **)(a1 + 32);
  if (v2 && *(_QWORD *)(a1 + 40) && objc_msgSend(v2, "compare:") == -1)
  {
    objc_msgSend(*(id *)(a1 + 48), "databaseProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __88__WBSHistoryServiceStore_clearHistoryVisitsAddedAfterDate_beforeDate_completionHandler___block_invoke_69;
    v16[3] = &unk_1E4B3BD70;
    v17 = v6;
    v18 = *(id *)(a1 + 40);
    v19 = *(id *)(a1 + 56);
    objc_msgSend(v5, "clearHistoryVisitsAddedAfterDate:beforeDate:tombstoneMode:completionHandler:", v17, v7, 1, v16);

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "databaseProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)*v3;
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __88__WBSHistoryServiceStore_clearHistoryVisitsAddedAfterDate_beforeDate_completionHandler___block_invoke_70;
    v13[3] = &unk_1E4B3BD98;
    v14 = v11;
    v12 = v9;
    v15 = v12;
    objc_msgSend(v10, "clearHistoryVisitsAddedAfterDate:beforeDate:tombstoneMode:completionHandler:", v14, v12, 0, v13);

  }
  else
  {
    v4 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __88__WBSHistoryServiceStore_clearHistoryVisitsAddedAfterDate_beforeDate_completionHandler___block_invoke_cold_1(v3, a1, v4);
    if (*(_QWORD *)(a1 + 56))
      dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 56));
  }
}

void __88__WBSHistoryServiceStore_clearHistoryVisitsAddedAfterDate_beforeDate_completionHandler___block_invoke_69(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412802;
      v9 = v6;
      v10 = 2112;
      v11 = v5;
      v12 = 2114;
      v13 = v7;
      _os_log_fault_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_FAULT, "Failed to perform history maintenance between %@ - %@: %{public}@", (uint8_t *)&v8, 0x20u);

    }
  }
  if (*(_QWORD *)(a1 + 48))
    dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 48));

}

void __88__WBSHistoryServiceStore_clearHistoryVisitsAddedAfterDate_beforeDate_completionHandler___block_invoke_70(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412802;
      v9 = v6;
      v10 = 2112;
      v11 = v5;
      v12 = 2114;
      v13 = v7;
      _os_log_error_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_ERROR, "Failed to perform history maintenance between %@ - %@: %{public}@", (uint8_t *)&v8, 0x20u);

    }
  }

}

void __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = operator new();
    MEMORY[0x1A8599720](v2, CFSTR("com.apple.SafariShared.WBSHistoryServiceStore"));
    v3 = WeakRetained[5];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_2;
    v4[3] = &unk_1E4B2AA60;
    v4[4] = WeakRetained;
    v4[5] = v2;
    dispatch_async(v3, v4);
  }

}

uint64_t __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_3;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "_performMaintenance:", v3);
}

id *__46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_3(uint64_t a1)
{
  id *result;

  result = *(id **)(a1 + 32);
  if (result)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(result);
    JUMPOUT(0x1A85998ACLL);
  }
  return result;
}

void __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_74(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  WBSSetInt64 *v5;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "databaseProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[WBSSetInt64 initWithInt64:]([WBSSetInt64 alloc], "initWithInt64:", objc_msgSend(*(id *)(a1 + 40), "eventID"));
    objc_msgSend(v4, "markEventsAsReceivedByListener:eventIDs:completionHandler:", CFSTR("Safari"), v5, &__block_literal_global_77);

    v3 = 0;
  }

}

void __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_2_76(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_2_76_cold_1();
    }

  }
}

- (void)_expireOldVisits
{
  double v2;
  id v3;

  -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[WBSHistoryItem timeIntervalForDailyAndWeeklyVisitCountScores](WBSHistoryItem, "timeIntervalForDailyAndWeeklyVisitCountScores");
  objc_msgSend(v3, "expireOldVisits:completionHandler:", &__block_literal_global_79, v2 + v2);

}

void __42__WBSHistoryServiceStore__expireOldVisits__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __42__WBSHistoryServiceStore__expireOldVisits__block_invoke_cold_1();
    }

  }
}

- (double)_ageLimitSinceReferenceDate
{
  double v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return v3 - self->_historyAgeLimit;
}

- (void)_updateLastMaintenanceDate
{
  void *v3;
  void *v4;
  id v5;

  -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSinceReferenceDate](self->_lastMaintenanceDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMetadataValue:forKey:completionHandler:", v4, CFSTR("last_maintenance_date"), &__block_literal_global_80);

}

void __52__WBSHistoryServiceStore__updateLastMaintenanceDate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __52__WBSHistoryServiceStore__updateLastMaintenanceDate__block_invoke_cold_1();
    }

  }
}

- (void)_performMaintenance:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  double v7;
  double v8;
  unint64_t itemCountLimit;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = atomic_load((unint64_t *)&self->_state);
  if (v5 != 2)
  {
    -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSHistoryServiceStore _ageLimitSinceReferenceDate](self, "_ageLimitSinceReferenceDate");
    v8 = v7;
    itemCountLimit = self->_itemCountLimit;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__WBSHistoryServiceStore__performMaintenance___block_invoke;
    v10[3] = &unk_1E4B3BE48;
    v10[4] = self;
    v11 = v4;
    objc_msgSend(v6, "performMaintenanceWithAgeLimit:itemCountLimit:completionHandler:", itemCountLimit, v10, v8);

  }
}

void __46__WBSHistoryServiceStore__performMaintenance___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__WBSHistoryServiceStore__performMaintenance___block_invoke_2;
  v4[3] = &unk_1E4B2A250;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __46__WBSHistoryServiceStore__performMaintenance___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_updateLastMaintenanceDate");
  if (*(_QWORD *)(a1 + 40))
    dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 40));
}

- (void)performMaintenance:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__WBSHistoryServiceStore_performMaintenance___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

void __45__WBSHistoryServiceStore_performMaintenance___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "databaseProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_performMaintenance:", *(_QWORD *)(a1 + 40));
  }
  else if (*(_QWORD *)(a1 + 40))
  {
    dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 40));
  }
}

- (void)closeWithCompletionHandler:(id)a3
{
  WBSPeriodicActivityScheduler *maintenanceScheduler;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  atomic_store(2uLL, (unint64_t *)&self->_state);
  -[WBSPeriodicActivityScheduler invalidate](self->_maintenanceScheduler, "invalidate");
  maintenanceScheduler = self->_maintenanceScheduler;
  self->_maintenanceScheduler = 0;

  if (v5)
    v5[2]();

}

- (void)addAutocompleteTrigger:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "urlString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__WBSHistoryServiceStore_addAutocompleteTrigger_forItem___block_invoke;
  v12[3] = &unk_1E4B3BD98;
  v10 = v6;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  objc_msgSend(v8, "addAutocompleteTrigger:forURL:completionHandler:", v10, v9, v12);

}

void __57__WBSHistoryServiceStore_addAutocompleteTrigger_forItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __57__WBSHistoryServiceStore_addAutocompleteTrigger_forItem___block_invoke_cold_1();
    }

    v5 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "urlString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138478339;
      v10 = v6;
      v11 = 2113;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      _os_log_debug_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_DEBUG, "Failed to add autocomplete trigger %{private}@ for %{private}@: %{public}@", (uint8_t *)&v9, 0x20u);

    }
  }

}

- (void)getAutocompleteTriggersForItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "urlString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75__WBSHistoryServiceStore_getAutocompleteTriggersForItem_completionHandler___block_invoke;
    v10[3] = &unk_1E4B3BE70;
    v11 = v6;
    v12 = v7;
    objc_msgSend(v8, "fetchAutocompleteTriggersForURLString:completionHandler:", v9, v10);

  }
}

void __75__WBSHistoryServiceStore_getAutocompleteTriggersForItem_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __75__WBSHistoryServiceStore_getAutocompleteTriggersForItem_completionHandler___block_invoke_cold_2();
    }

    v8 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "urlString");
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __75__WBSHistoryServiceStore_getAutocompleteTriggersForItem_completionHandler___block_invoke_cold_1();
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)getItemCountBeforeDate:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getItemCountBeforeDate:completionHandler:", v8, v6);

}

- (void)_fetchTags:(unint64_t)a3 fromStartDate:(id)a4 toEndDate:(id)a5 withIdentifiers:(id)a6 limit:(unint64_t)a7 minimumItemCount:(unint64_t)a8 sortOrder:(int64_t)a9 completionHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  WBSHistoryTagsPredicate *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a10;
  -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = -[WBSHistoryTagsPredicate initWithStartDate:endDate:tagType:]([WBSHistoryTagsPredicate alloc], "initWithStartDate:endDate:tagType:", v16, v17, a3);
    -[WBSHistoryTagsPredicate setLimit:](v21, "setLimit:", a7);
    -[WBSHistoryTagsPredicate setMinimumItemCount:](v21, "setMinimumItemCount:", a8);
    -[WBSHistoryTagsPredicate setSortOrder:](v21, "setSortOrder:", a9);
    if (objc_msgSend(v18, "count"))
      -[WBSHistoryTagsPredicate setIdentifiers:](v21, "setIdentifiers:", v18);
    -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __128__WBSHistoryServiceStore__fetchTags_fromStartDate_toEndDate_withIdentifiers_limit_minimumItemCount_sortOrder_completionHandler___block_invoke;
    v23[3] = &unk_1E4B3BF80;
    v24 = v19;
    objc_msgSend(v22, "fetchWithOptions:predicate:completionHandler:", 32, v21, v23);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSHistoryErrorDomain"), 4, 0);
    v21 = (WBSHistoryTagsPredicate *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, WBSHistoryTagsPredicate *))v19 + 2))(v19, 0, v21);
  }

}

void __128__WBSHistoryServiceStore__fetchTags_fromStartDate_toEndDate_withIdentifiers_limit_minimumItemCount_sortOrder_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "fileDescriptor");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __128__WBSHistoryServiceStore__fetchTags_fromStartDate_toEndDate_withIdentifiers_limit_minimumItemCount_sortOrder_completionHandler___block_invoke_4;
    v11[3] = &unk_1E4B3BF18;
    v10 = v8;
    v12 = v10;
    SafariShared::ReadStreamedObjects(v9, &__block_literal_global_84, &__block_literal_global_85, v11, &__block_literal_global_89, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __128__WBSHistoryServiceStore__fetchTags_fromStartDate_toEndDate_withIdentifiers_limit_minimumItemCount_sortOrder_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  WBSHistoryTopicTag *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)(a2 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)(a2 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a2 + 16) == 1)
  {
    v5 = *(void **)(a1 + 32);
    v6 = -[WBSHistoryTopicTag initWithTitle:identifier:databaseID:modificationTimestamp:level:]([WBSHistoryTopicTag alloc], "initWithTitle:identifier:databaseID:modificationTimestamp:level:", v7, v4, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 24), *(double *)(a2 + 48));
    objc_msgSend(v5, "addObject:", v6);

  }
}

- (void)_createTagsForIdentifiers:(id)a3 withTitles:(id)a4 type:(unint64_t)a5 level:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  int64_t v24;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __92__WBSHistoryServiceStore__createTagsForIdentifiers_withTitles_type_level_completionHandler___block_invoke;
  v19[3] = &unk_1E4B3BFA8;
  v16 = v14;
  v22 = v16;
  v17 = v12;
  v20 = v17;
  v18 = v13;
  v21 = v18;
  v23 = a5;
  v24 = a6;
  objc_msgSend(v15, "createTagsForIdentifiers:withTitles:type:level:completionHandler:", v17, v18, a5, a6, v19);

}

void __92__WBSHistoryServiceStore__createTagsForIdentifiers_withTitles_type_level_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  unint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  WBSHistoryTopicTag *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v8 = v7;
    for (i = 0; i < objc_msgSend(v15, "count"); ++i)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "longLongValue");

      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_QWORD *)(a1 + 56) == 1)
      {
        v14 = -[WBSHistoryTopicTag initWithTitle:identifier:databaseID:modificationTimestamp:level:]([WBSHistoryTopicTag alloc], "initWithTitle:identifier:databaseID:modificationTimestamp:level:", v13, v12, v11, *(_QWORD *)(a1 + 64), v8);
        objc_msgSend(v6, "addObject:", v14);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)tagsWithIdentifiers:(id)a3 type:(unint64_t)a4 level:(int64_t)a5 creatingIfNecessary:(BOOL)a6 withTitles:(id)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  WBSHistoryServiceStore *v26;
  id v27;
  unint64_t v28;
  int64_t v29;

  v13 = a3;
  v14 = a7;
  v15 = a8;
  v22 = v14;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __106__WBSHistoryServiceStore_tagsWithIdentifiers_type_level_creatingIfNecessary_withTitles_completionHandler___block_invoke;
  v23[3] = &unk_1E4B3BFF8;
  v19 = v13;
  v24 = v19;
  v20 = v22;
  v25 = v20;
  v26 = self;
  v28 = a4;
  v29 = a5;
  v21 = v15;
  v27 = v21;
  -[WBSHistoryServiceStore _fetchTags:fromStartDate:toEndDate:withIdentifiers:limit:minimumItemCount:sortOrder:completionHandler:](self, "_fetchTags:fromStartDate:toEndDate:withIdentifiers:limit:minimumItemCount:sortOrder:completionHandler:", a4, v16, v17, v18, 0, 0, 0, v23);

}

void __106__WBSHistoryServiceStore_tagsWithIdentifiers_type_level_creatingIfNecessary_withTitles_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v17 = a2;
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  v4 = *(void **)(a1 + 40);
  if (v4)
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
  else
    v5 = 0;
  if (*(_QWORD *)(a1 + 64) == 1)
    v6 = v17;
  else
    v6 = 0;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v10), "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v3, "indexOfObject:", v11);

        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v3, "removeObjectAtIndex:", v12);
          objc_msgSend(v5, "removeObjectAtIndex:", v12);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  v13 = *(_QWORD *)(a1 + 64);
  v14 = *(_QWORD *)(a1 + 72);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __106__WBSHistoryServiceStore_tagsWithIdentifiers_type_level_creatingIfNecessary_withTitles_completionHandler___block_invoke_2;
  v18[3] = &unk_1E4B3BFD0;
  v15 = *(void **)(a1 + 48);
  v20 = *(id *)(a1 + 56);
  v16 = v7;
  v19 = v16;
  objc_msgSend(v15, "_createTagsForIdentifiers:withTitles:type:level:completionHandler:", v3, v5, v13, v14, v18);

}

uint64_t __106__WBSHistoryServiceStore_tagsWithIdentifiers_type_level_creatingIfNecessary_withTitles_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32), a3);
}

- (void)assignHistoryItem:(id)a3 toTopicTags:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "urlString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WBSSetOfIdentifiersFromTags(v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assignURLString:toTopicTagsWithIDs:completionHandler:", v12, v13, v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSHistoryErrorDomain"), 4, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v11);
  }

}

- (void)_fetchHistoryItemsForTopics:(id)a3 fromStartDate:(id)a4 toEndDate:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  WBSHistoryItemToTagPairsPredicate *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = -[WBSHistoryItemToTagPairsPredicate initWithStartDate:endDate:]([WBSHistoryItemToTagPairsPredicate alloc], "initWithStartDate:endDate:", v11, v12);
    -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __96__WBSHistoryServiceStore__fetchHistoryItemsForTopics_fromStartDate_toEndDate_completionHandler___block_invoke;
    v17[3] = &unk_1E4B3BB70;
    v19 = v13;
    v17[4] = self;
    v18 = v10;
    objc_msgSend(v16, "fetchWithOptions:predicate:completionHandler:", 64, v15, v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSHistoryErrorDomain"), 4, 0);
    v15 = (WBSHistoryItemToTagPairsPredicate *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, WBSHistoryItemToTagPairsPredicate *))v13 + 2))(v13, 0, v15);
  }

}

void __96__WBSHistoryServiceStore__fetchHistoryItemsForTopics_fromStartDate_toEndDate_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v8 = *(void **)(a1 + 40);
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __96__WBSHistoryServiceStore__fetchHistoryItemsForTopics_fromStartDate_toEndDate_completionHandler___block_invoke_2;
    v12[3] = &unk_1E4B39360;
    v13 = v8;
    v10 = v6;
    v11 = *(_QWORD *)(a1 + 32);
    v14 = v10;
    v15 = v11;
    v16 = *(id *)(a1 + 48);
    dispatch_async(v9, v12);

  }
}

uint64_t __96__WBSHistoryServiceStore__fetchHistoryItemsForTopics_fromStartDate_toEndDate_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t *v7;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  qos_class_t v11;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[6];
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  uint64_t (*v26)(uint64_t);
  _BYTE v27[32];
  uint64_t v28;
  int v29;
  uint64_t *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x5812000000;
  v25 = __Block_byref_object_copy__91;
  v26 = __Block_byref_object_dispose__92;
  memset(v27, 0, sizeof(v27));
  v28 = 0;
  v29 = 1065353216;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v19 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v7 = v23;
        v17 = objc_msgSend(v6, "databaseID");
        v30 = &v17;
        v8 = (id *)std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t)(v7 + 6), (unint64_t *)&v17, (uint64_t)&std::piecewise_construct, &v30);
        objc_storeStrong(v8 + 3, v6);
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
    }
    while (v3);
  }

  v9 = objc_msgSend(*(id *)(a1 + 40), "fileDescriptor");
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __96__WBSHistoryServiceStore__fetchHistoryItemsForTopics_fromStartDate_toEndDate_completionHandler___block_invoke_4;
  v16[3] = &unk_1E4B3C0A0;
  v16[4] = *(_QWORD *)(a1 + 48);
  v16[5] = &v22;
  SafariShared::ReadStreamedObjects(v9, &__block_literal_global_94, &__block_literal_global_96, &__block_literal_global_97, v16, 0);
  v11 = qos_class_self();
  dispatch_get_global_queue(v11, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __96__WBSHistoryServiceStore__fetchHistoryItemsForTopics_fromStartDate_toEndDate_completionHandler___block_invoke_5;
  v14[3] = &unk_1E4B2B038;
  v15 = *(id *)(a1 + 56);
  dispatch_async(v12, v14);

  _Block_object_dispose(&v22, 8);
  return std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::~__hash_table((uint64_t)&v27[8]);
}

void __96__WBSHistoryServiceStore__fetchHistoryItemsForTopics_fromStartDate_toEndDate_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "itemForID:", *(_QWORD *)(a2 + 8));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48;
    v6 = (_QWORD *)(a2 + 16);
    objc_msgSend((id)std::__hash_table<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,WBSHistoryItem * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,WBSHistoryItem * {__strong}>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>(v5, (unint64_t *)(a2 + 16), (uint64_t)&std::piecewise_construct, &v6)[3], "tagHistoryItem:", v4);
  }

}

uint64_t __96__WBSHistoryServiceStore__fetchHistoryItemsForTopics_fromStartDate_toEndDate_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchTopicsFromStartDate:(id)a3 toEndDate:(id)a4 completionHandler:(id)a5
{
  -[WBSHistoryServiceStore fetchTopicsFromStartDate:toEndDate:limit:minimumItemCount:sortOrder:completionHandler:](self, "fetchTopicsFromStartDate:toEndDate:limit:minimumItemCount:sortOrder:completionHandler:", a3, a4, 0, 0, 0, a5);
}

- (void)fetchTopicsFromStartDate:(id)a3 toEndDate:(id)a4 limit:(unint64_t)a5 minimumItemCount:(unint64_t)a6 sortOrder:(int64_t)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;

  v14 = a3;
  v15 = a4;
  v16 = a8;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __112__WBSHistoryServiceStore_fetchTopicsFromStartDate_toEndDate_limit_minimumItemCount_sortOrder_completionHandler___block_invoke;
  v20[3] = &unk_1E4B3C0F0;
  v20[4] = self;
  v21 = v14;
  v22 = v15;
  v23 = v16;
  v17 = v15;
  v18 = v14;
  v19 = v16;
  -[WBSHistoryServiceStore _fetchTags:fromStartDate:toEndDate:withIdentifiers:limit:minimumItemCount:sortOrder:completionHandler:](self, "_fetchTags:fromStartDate:toEndDate:withIdentifiers:limit:minimumItemCount:sortOrder:completionHandler:", 1, v18, v17, 0, a5, a6, a7, v20);

}

void __112__WBSHistoryServiceStore_fetchTopicsFromStartDate_toEndDate_limit_minimumItemCount_sortOrder_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __112__WBSHistoryServiceStore_fetchTopicsFromStartDate_toEndDate_limit_minimumItemCount_sortOrder_completionHandler___block_invoke_2;
    v10[3] = &unk_1E4B3C0C8;
    v9 = *(_QWORD *)(a1 + 48);
    v12 = *(id *)(a1 + 56);
    v11 = v5;
    objc_msgSend(v7, "_fetchHistoryItemsForTopics:fromStartDate:toEndDate:completionHandler:", v11, v8, v9, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __112__WBSHistoryServiceStore_fetchTopicsFromStartDate_toEndDate_limit_minimumItemCount_sortOrder_completionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if ((a2 & 1) != 0)
  {
    v5 = 0;
    v6 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v6, v5);

}

- (void)setTitle:(id)a3 ofTag:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:ofTagWithID:completionHandler:", v12, objc_msgSend(v8, "databaseID"), v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSHistoryErrorDomain"), 4, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v11);
  }

}

- (void)_setMetadataValue:(id)a3 forKey:(id)a4 group:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  NSObject *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_group_enter(v10);
  -[WBSHistoryServiceStore databaseProxy](self, "databaseProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__WBSHistoryServiceStore__setMetadataValue_forKey_group___block_invoke;
  v15[3] = &unk_1E4B3C118;
  v12 = v9;
  v16 = v12;
  v13 = v8;
  v17 = v13;
  v14 = v10;
  v18 = v14;
  objc_msgSend(v11, "setMetadataValue:forKey:completionHandler:", v13, v12, v15);

}

void __57__WBSHistoryServiceStore__setMetadataValue_forKey_group___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543874;
      v9 = v6;
      v10 = 2112;
      v11 = v5;
      v12 = 2114;
      v13 = v7;
      _os_log_error_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_ERROR, "failed to update metadata %{public}@ to %@: %{public}@", (uint8_t *)&v8, 0x20u);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

- (int64_t)_generateTemporaryDatabaseID
{
  int64_t nextTemporaryDatabaseID;

  nextTemporaryDatabaseID = self->_nextTemporaryDatabaseID;
  self->_nextTemporaryDatabaseID = nextTemporaryDatabaseID + 1;
  return nextTemporaryDatabaseID;
}

- (BOOL)_ensureItemHasID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "databaseID"))
  {
    objc_msgSend(v5, "setDatabaseID:", -[WBSHistoryServiceStore _generateTemporaryDatabaseID](self, "_generateTemporaryDatabaseID"));
    -[WBSHistoryObjectCache setItem:forID:](self->_cache, "setItem:forID:", v5, objc_msgSend(v5, "databaseID"));
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_ensureVisitHasID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "databaseID"))
  {
    objc_msgSend(v5, "setDatabaseID:", -[WBSHistoryServiceStore _generateTemporaryDatabaseID](self, "_generateTemporaryDatabaseID"));
    -[WBSHistoryObjectCache setVisit:forID:](self->_cache, "setVisit:forID:", v5, objc_msgSend(v5, "databaseID"));
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)reportPermanentIDsForItems:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__WBSHistoryServiceStore_reportPermanentIDsForItems_completionHandler___block_invoke;
  block[3] = &unk_1E4B2B178;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(databaseQueue, block);

}

uint64_t __71__WBSHistoryServiceStore_reportPermanentIDsForItems_completionHandler___block_invoke(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 48), "changeItemIDs:", a1[5]);
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)reportPermanentIDsForVisits:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__WBSHistoryServiceStore_reportPermanentIDsForVisits_completionHandler___block_invoke;
  block[3] = &unk_1E4B2B178;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(databaseQueue, block);

}

uint64_t __72__WBSHistoryServiceStore_reportPermanentIDsForVisits_completionHandler___block_invoke(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 48), "changeVisitIDs:", a1[5]);
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)reportSevereError:(id)a3 completionHandler:(id)a4
{
  id WeakRetained;
  void (**v6)(void);

  v6 = (void (**)(void))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "historyStoreDidFailDatabaseIntegrityCheck:", self);

  v6[2]();
}

- (void)handleEvent:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  dispatch_group_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *databaseQueue;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  WBSHistoryServiceStore *v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  WBSHistoryServiceStore *v48;
  id v49;
  _QWORD v50[5];
  id v51;
  _QWORD block[4];
  id v53;
  WBSHistoryServiceStore *v54;
  NSObject *v55;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_group_create();
  objc_msgSend(v6, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safari_dictionaryForKey:", CFSTR("disposedURLs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = v10;
  v11 = objc_msgSend(v10, "count");
  v12 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    databaseQueue = self->_databaseQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke;
    block[3] = &unk_1E4B2B2A8;
    v53 = v10;
    v54 = self;
    v55 = v8;
    dispatch_group_async(v55, databaseQueue, block);

  }
  objc_msgSend(v6, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safari_arrayForKey:", CFSTR("disposedHostnames"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v15;
  if (objc_msgSend(v15, "count"))
  {
    v50[0] = v12;
    v50[1] = 3221225472;
    v50[2] = __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_4;
    v50[3] = &unk_1E4B2B448;
    v50[4] = self;
    v51 = v15;
    dispatch_group_async(v8, MEMORY[0x1E0C80D38], v50);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v6, "value");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "safari_arrayForKey:", CFSTR("disposedHighLevelDomains"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "count") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v46[0] = v12;
    v46[1] = 3221225472;
    v46[2] = __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_5;
    v46[3] = &unk_1E4B2B2A8;
    v47 = WeakRetained;
    v48 = self;
    v49 = v18;
    dispatch_group_async(v8, MEMORY[0x1E0C80D38], v46);

  }
  objc_msgSend(v6, "value");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safari_arrayForKey:", CFSTR("disposedVisits"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "value");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "safari_dictionaryForKey:", CFSTR("updateLatestVisits"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v20, "count") || objc_msgSend(v22, "count"))
  {
    v23 = self->_databaseQueue;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_6;
    v40[3] = &unk_1E4B3C168;
    v41 = v20;
    v42 = self;
    v43 = v6;
    v44 = WeakRetained;
    v45 = v22;
    dispatch_group_async(v8, v23, v40);

  }
  objc_msgSend(v6, "eventType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("clear"));

  if (v25)
  {
    v35 = v7;
    objc_msgSend(v6, "value");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "safari_dateForKey:", CFSTR("endDate"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "value");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "safari_dateForKey:", CFSTR("startDate"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D177A8], "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v29 && v27)
    {
      objc_msgSend(v30, "clearCompletionsFromDate:toDate:", v29, v27);
    }
    else if (v27)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "clearCompletionsFromDate:toDate:", v32, v27);

    }
    else
    {
      objc_msgSend(v30, "clearAllCompletions");
      objc_msgSend(WeakRetained, "historyStoreWasCleared:", self);
    }

    v7 = v35;
  }
  dispatch_get_global_queue(9, 0);
  v33 = objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_7;
  v38[3] = &unk_1E4B2B038;
  v39 = v7;
  v34 = v7;
  dispatch_group_notify(v8, v33, v38);

}

void __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id WeakRetained;
  WBSHistoryDeletionPlan *v7;
  NSObject *v8;
  WBSHistoryDeletionPlan *v9;
  id v10;
  _QWORD block[5];
  id v12;
  WBSHistoryDeletionPlan *v13;
  _QWORD v14[5];
  id v15;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_2;
  v14[3] = &unk_1E4B3C140;
  v4 = *(void **)(a1 + 32);
  v14[4] = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v15 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v14);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 112));

  if (WeakRetained)
    v7 = -[WBSHistoryDeletionPlan initWithSQLiteStore:discoveredItemsToDelete:]([WBSHistoryDeletionPlan alloc], "initWithSQLiteStore:discoveredItemsToDelete:", *(_QWORD *)(a1 + 40), v5);
  else
    v7 = 0;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_3;
  block[3] = &unk_1E4B2B2A8;
  v8 = *(NSObject **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v12 = v5;
  v13 = v7;
  v9 = v7;
  v10 = v5;
  dispatch_group_async(v8, MEMORY[0x1E0C80D38], block);

}

void __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "itemForID:", objc_msgSend(v5, "longLongValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeItemWithID:", objc_msgSend(v5, "longLongValue"));
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(*(Class *)(*(_QWORD *)(a1 + 32) + 8)), "initWithURLString:", v9);
    objc_msgSend(v7, "addObject:", v8);

  }
}

void __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
  if (WeakRetained)
  {
    v2 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "historyStore:didRemoveItems:", v2, v3);

    if (*(_QWORD *)(a1 + 48))
      objc_msgSend(WeakRetained, "historyStore:didPrepareToDeleteWithDeletionPlan:", *(_QWORD *)(a1 + 32));
  }

}

void __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
  objc_msgSend(WeakRetained, "historyStore:didRemoveHostnames:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "historyStore:didRemoveHighLevelDomains:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_6(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  WBSHistoryVisit *v24;
  void *v25;
  void *v26;
  WBSHistoryVisit *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t n;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  BOOL v44;
  id WeakRetained;
  uint64_t v46;
  void *v47;
  WBSHistoryDeletionPlan *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id obj;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
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
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v73 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "visitForID:", objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * i), "longLongValue"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
          objc_msgSend(v55, "addObject:", v6);

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
    }
    while (v3);
  }

  objc_msgSend(*(id *)(a1 + 48), "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_dictionaryForKey:", CFSTR("updateItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v69;
    while (2)
    {
      for (j = 0; j != v9; ++j)
      {
        if (*(_QWORD *)v69 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "itemForID:", objc_msgSend(v12, "longLongValue"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          objc_msgSend(obj, "objectForKeyedSubscript:", v12);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          v15 = *(void **)(a1 + 56);
          v16 = *(_QWORD *)(a1 + 40);
          objc_msgSend(v14, "url");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "historyStore:itemForURLString:createIfNeeded:", v16, v17, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            v19 = obj;
            goto LABEL_69;
          }
          objc_msgSend(v13, "updateWithServiceItem:", v14);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setItem:forID:", v13, objc_msgSend(v12, "longLongValue"));

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
      if (v9)
        continue;
      break;
    }
  }

  objc_msgSend(*(id *)(a1 + 48), "value");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safari_dictionaryForKey:", CFSTR("updateVisits"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v51, "count"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v19 = v51;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v65;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v65 != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * k);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "visitForID:", objc_msgSend(v23, "longLongValue"));
        v24 = (WBSHistoryVisit *)objc_claimAutoreleasedReturnValue();
        if (!v24)
        {
          objc_msgSend(v19, "objectForKeyedSubscript:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "itemForID:", objc_msgSend(v25, "itemID"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            objc_msgSend(v25, "visitTime");
            objc_msgSend(v26, "visitForTimeOnSynchronizationQueue:");
            v27 = (WBSHistoryVisit *)objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              v24 = v27;
              -[WBSHistoryVisit setDatabaseID:](v27, "setDatabaseID:", objc_msgSend(v25, "databaseID"));
            }
            else
            {
              v24 = -[WBSHistoryVisit initWithHistoryItem:serviceVisit:]([WBSHistoryVisit alloc], "initWithHistoryItem:serviceVisit:", v26, v25);
              objc_msgSend(v52, "addObject:", v24);
            }
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setVisit:forID:", v24, objc_msgSend(v23, "longLongValue"));
          }
          else
          {
            v24 = 0;
          }

        }
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
    }
    while (v20);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v14 = v52;
  v28 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v77, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v61;
    do
    {
      for (m = 0; m != v28; ++m)
      {
        if (*(_QWORD *)v61 != v29)
          objc_enumerationMutation(v14);
        v31 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * m);
        v32 = objc_msgSend(v31, "redirectSourceDatabaseID");
        if (v32)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "visitForID:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setRedirectSource:", v33);

        }
        v34 = objc_msgSend(v31, "redirectDestinationDatabaseID", v32);
        if (v34)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "visitForID:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setRedirectDestination:", v35);

        }
      }
      v28 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v77, 16);
    }
    while (v28);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v36 = *(id *)(a1 + 64);
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v56, v76, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v57;
    do
    {
      for (n = 0; n != v37; ++n)
      {
        if (*(_QWORD *)v57 != v38)
          objc_enumerationMutation(v36);
        v40 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * n);
        objc_msgSend(*(id *)(a1 + 64), "safari_numberForKey:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "itemForID:", objc_msgSend(v40, "longLongValue"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "visitForID:", objc_msgSend(v41, "longLongValue"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (v43)
            v44 = v42 == 0;
          else
            v44 = 1;
          if (!v44)
            objc_msgSend(v54, "setObject:forKey:", v43, v42);

        }
      }
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v56, v76, 16);
    }
    while (v37);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 112));
  if (WeakRetained)
  {
    if (objc_msgSend(v55, "count"))
    {
      v46 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v55, "allObjects");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "historyStore:didRemoveVisits:", v46, v47);

      v48 = -[WBSHistoryDeletionPlan initWithSQLiteStore:triggeringVisits:updatedLastVisitsByItem:]([WBSHistoryDeletionPlan alloc], "initWithSQLiteStore:triggeringVisits:updatedLastVisitsByItem:", *(_QWORD *)(a1 + 40), v55, v54);
      if (v48)
        objc_msgSend(WeakRetained, "historyStore:didPrepareToDeleteWithDeletionPlan:", *(_QWORD *)(a1 + 40), v48);

    }
    if (objc_msgSend(v14, "count"))
    {
      v49 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v14, "allObjects");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "historyStore:didAddVisits:", v49, v50);

    }
  }

LABEL_69:
}

uint64_t __56__WBSHistoryServiceStore_handleEvent_completionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)searchForUserTypedString:(id)a3 options:(unint64_t)a4 currentTime:(double)a5 enumerationBlock:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  unint64_t v22;
  double v23;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke;
  v18[3] = &unk_1E4B3C208;
  v19 = v12;
  v20 = v14;
  v23 = a5;
  v21 = v13;
  v22 = a4;
  v15 = v13;
  v16 = v12;
  v17 = v14;
  -[WBSHistoryServiceStore _waitForDatabase:](self, "_waitForDatabase:", v18);

}

void __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  NSObject *v14;
  qos_class_t v15;
  NSObject *v16;
  qos_class_t v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  _QWORD block[4];
  id v23;
  id v24;
  _QWORD v25[4];
  NSObject *v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;

  v3 = a2;
  if (v3)
  {
    v30 = 0;
    v31 = 0;
    SafariShared::HistoryObjectStreamWriter::createPipeHandles(&v31, &v30);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v31;
    v6 = v30;
    if (v4)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    else
    {
      v28[0] = 0;
      v28[1] = v28;
      v28[2] = 0x3032000000;
      v28[3] = __Block_byref_object_copy__23;
      v28[4] = __Block_byref_object_dispose__23;
      v29 = 0;
      v9 = dispatch_group_create();
      dispatch_group_enter(v9);
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 56);
      v12 = MEMORY[0x1E0C809B0];
      v13 = *(double *)(a1 + 64);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke_2;
      v25[3] = &unk_1E4B3C190;
      v27 = v28;
      v14 = v9;
      v26 = v14;
      objc_msgSend(v3, "searchForUserTypedString:options:currentTime:writeHandle:completionHandler:", v10, v11, v6, v25, v13);
      objc_msgSend(v6, "closeFile");
      v15 = qos_class_self();
      dispatch_get_global_queue(v15, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = v12;
      block[1] = 3221225472;
      block[2] = __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke_3;
      block[3] = &unk_1E4B2A250;
      v23 = v5;
      v24 = *(id *)(a1 + 48);
      dispatch_group_async(v14, v16, block);

      v17 = qos_class_self();
      dispatch_get_global_queue(v17, 0);
      v18 = objc_claimAutoreleasedReturnValue();
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke_6;
      v19[3] = &unk_1E4B3B4F8;
      v20 = *(id *)(a1 + 40);
      v21 = v28;
      dispatch_group_notify(v14, v18, v19);

      _Block_object_dispose(v28, 8);
    }

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 14, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
}

void __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "fileDescriptor");
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke_4;
  v8[3] = &unk_1E4B3C1B8;
  v10 = *(id *)(a1 + 40);
  v9 = v2;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke_5;
  v6[3] = &unk_1E4B3C1E0;
  v5 = v9;
  v7 = v5;
  SafariShared::ReadStreamedMatches(v3, v8, v6);
  objc_msgSend(*(id *)(a1 + 32), "closeFile");

}

uint64_t __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  WBSHistoryServiceURLCompletionMatchData *v5;
  void *v6;
  WBSHistoryServiceURLCompletionMatchData *v7;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = [WBSHistoryServiceURLCompletionMatchData alloc];
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  v7 = -[WBSHistoryServiceURLCompletionMatchData initWithStreamData:entries:](v5, "initWithStreamData:entries:", a2, v6);
  (*(void (**)(uint64_t, WBSHistoryServiceURLCompletionMatchData *))(v4 + 16))(v4, v7);

  return objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
}

void __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v2;
  WBSHistoryServiceURLCompletionMatchEntry *v3;

  v2 = *(void **)(a1 + 32);
  v3 = -[WBSHistoryServiceURLCompletionMatchEntry initWithStreamData:]([WBSHistoryServiceURLCompletionMatchEntry alloc], "initWithStreamData:", a2);
  objc_msgSend(v2, "addObject:");

}

uint64_t __106__WBSHistoryServiceStore_searchForUserTypedString_options_currentTime_enumerationBlock_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)connectionProxyConnectionWasInterrupted:(id)a3
{
  unint64_t v3;
  void *v5;
  _QWORD v6[5];

  v3 = atomic_load((unint64_t *)&self->_state);
  if (v3 != 2)
  {
    dispatch_suspend((dispatch_object_t)self->_databaseQueue);
    -[WBSHistoryServiceStore _connectOptions](self, "_connectOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__WBSHistoryServiceStore_connectionProxyConnectionWasInterrupted___block_invoke;
    v6[3] = &unk_1E4B3C258;
    v6[4] = self;
    -[WBSHistoryServiceStore _connectWithOptions:completionHandler:](self, "_connectWithOptions:completionHandler:", v5, v6);

  }
}

void __66__WBSHistoryServiceStore_connectionProxyConnectionWasInterrupted___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  NSObject *v11;

  v9 = a2;
  v10 = a5;
  if (v10)
  {
    v11 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __66__WBSHistoryServiceStore_connectionProxyConnectionWasInterrupted___block_invoke_cold_1();
    }

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = a3;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = a4;
    objc_msgSend(*(id *)(a1 + 32), "setDatabaseProxy:", v9);
  }
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));

}

- (void)initializeCloudHistoryWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__WBSHistoryServiceStore_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke;
  v10[3] = &unk_1E4B3C280;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  -[WBSHistoryServiceStore _waitForDatabase:](self, "_waitForDatabase:", v10);

}

void __84__WBSHistoryServiceStore_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    objc_msgSend(*(id *)(a1[4] + 32), "initializeCloudHistoryWithConfiguration:completionHandler:", a1[5], a1[6]);
  }
  else
  {
    v3 = a1[6];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 14, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

  }
}

- (NSString)databaseID
{
  return self->_databaseID;
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (void)setDatabaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_databaseURL, a3);
}

- (WBSHistoryStoreDelegate)delegate
{
  return (WBSHistoryStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)historyAgeLimit
{
  return self->_historyAgeLimit;
}

- (void)setHistoryAgeLimit:(double)a3
{
  self->_historyAgeLimit = a3;
}

- (WBSHistoryCrypto)crypto
{
  return self->_crypto;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseProxy, 0);
  objc_storeStrong((id *)&self->_crypto, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_databaseID, 0);
  objc_storeStrong((id *)&self->_maintenanceScheduler, 0);
  objc_storeStrong((id *)&self->_lastMaintenanceDate, 0);
  objc_storeStrong(&self->_loadCompletionBlock, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __64__WBSHistoryServiceStore__connectWithOptions_completionHandler___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to open History database because corruption was detected: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __64__WBSHistoryServiceStore__connectWithOptions_completionHandler___block_invoke_11_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to reset History database. It is still corrupted: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __52__WBSHistoryServiceStore_loadWithCompletionHandler___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to connect to history database: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __58__WBSHistoryServiceStore__loadOnDatabaseQueue_readHandle___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Null URL received from service", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_load:(os_log_t)log .cold.1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(_QWORD *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_1A3D90000, log, OS_LOG_TYPE_DEBUG, "Finished to load items (%zi)", buf, 0xCu);
}

- (void)_load:(double)a1 .cold.2(double a1)
{
  double v1;
  _DWORD *v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t *v5;

  v1 = OUTLINED_FUNCTION_19(a1);
  *v2 = 136446466;
  OUTLINED_FUNCTION_12_0((uint64_t)v2, (uint64_t)"load_load_on_database_queue", v1);
  OUTLINED_FUNCTION_1_3(&dword_1A3D90000, v3, v4, "#perf - %{public}s: %f", v5);
}

- (void)_load:(double)a1 .cold.3(double a1)
{
  double v1;
  _DWORD *v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t *v5;

  v1 = OUTLINED_FUNCTION_19(a1);
  *v2 = 136446466;
  OUTLINED_FUNCTION_12_0((uint64_t)v2, (uint64_t)"load_fetch_metadata_for_keys", v1);
  OUTLINED_FUNCTION_1_3(&dword_1A3D90000, v3, v4, "#perf - %{public}s: %f", v5);
}

void __32__WBSHistoryServiceStore__load___block_invoke_cold_1(double a1)
{
  double v1;
  _DWORD *v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t *v5;

  v1 = OUTLINED_FUNCTION_19(a1);
  *v2 = 136446466;
  OUTLINED_FUNCTION_12_0((uint64_t)v2, (uint64_t)"load_fetch", v1);
  OUTLINED_FUNCTION_1_3(&dword_1A3D90000, v3, v4, "#perf - %{public}s: %f", v5);
}

void __32__WBSHistoryServiceStore__load___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to load items and visits from history database: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __32__WBSHistoryServiceStore__load___block_invoke_32_cold_1(double a1)
{
  double v1;
  _DWORD *v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t *v5;

  v1 = OUTLINED_FUNCTION_19(a1);
  *v2 = 136446466;
  OUTLINED_FUNCTION_12_0((uint64_t)v2, (uint64_t)"load_fetch_domain_expansions", v1);
  OUTLINED_FUNCTION_1_3(&dword_1A3D90000, v3, v4, "#perf - %{public}s: %f", v5);
}

void __32__WBSHistoryServiceStore__load___block_invoke_32_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to load domain expansions from history database: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __32__WBSHistoryServiceStore__load___block_invoke_38_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to fetch database's URL: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __32__WBSHistoryServiceStore__load___block_invoke_41_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 80);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_ERROR, "Last maintenance date is invalid. Future date was stored in metadata: %@. Updating last maintenance date to right now", (uint8_t *)&v3, 0xCu);
}

void __32__WBSHistoryServiceStore__load___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "No more reference to WBSHistoryServiceStore", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __32__WBSHistoryServiceStore__load___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "No delegate to notify of load completion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __32__WBSHistoryServiceStore__load___block_invoke_2_cold_3(double a1)
{
  double v1;
  _DWORD *v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t *v5;

  v1 = OUTLINED_FUNCTION_19(a1);
  *v2 = 136446466;
  OUTLINED_FUNCTION_12_0((uint64_t)v2, (uint64_t)"load_load_completion_block", v1);
  OUTLINED_FUNCTION_1_3(&dword_1A3D90000, v3, v4, "#perf - %{public}s: %f", v5);
}

void __81__WBSHistoryServiceStore_getVisitsCreatedAfterDate_beforeDate_completionHandler___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to get visits created after date: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __120__WBSHistoryServiceStore_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to retrieve high level domains: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Told to delete item with nil URL, which would have destroyed all history. Bailing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke_60_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1_1(v1, v2, v3, 5.8081e-34);
  OUTLINED_FUNCTION_10(&dword_1A3D90000, v6, v4, "Failed to delete url %{private}@: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __75__WBSHistoryServiceStore_removePastHistoryVisitsForItem_completionHandler___block_invoke_62_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1_1(v1, v2, v3, 5.8081e-34);
  OUTLINED_FUNCTION_10(&dword_1A3D90000, v6, v4, "Failed to delete future url %{private}@: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __42__WBSHistoryServiceStore_visitsWereAdded___block_invoke_3_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to record visit: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __47__WBSHistoryServiceStore_visitTitleWasUpdated___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to update title: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __82__WBSHistoryServiceStore_visitAttributeWasUpdated_removeAttributes_addAttributes___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to update attributes: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __60__WBSHistoryServiceStore_clearHistoryWithCompletionHandler___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  _os_log_fault_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_FAULT, "Failed to perform history maintenance: %{public}@", v4, 0xCu);

  OUTLINED_FUNCTION_2_0();
}

void __61__WBSHistoryServiceStore_vacuumHistoryWithCompletionHandler___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to vacuum history database: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __88__WBSHistoryServiceStore_clearHistoryVisitsAddedAfterDate_beforeDate_completionHandler___block_invoke_cold_1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *(_QWORD *)(a2 + 40);
  v5 = 138543618;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  OUTLINED_FUNCTION_10(&dword_1A3D90000, a3, (uint64_t)a3, "Told to clear history between %{public}@ and %{public}@, which is not valid. Bailing.", (uint8_t *)&v5);
}

void __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_4_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Error fetching events from service: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __46__WBSHistoryServiceStore__scheduleMaintenance__block_invoke_2_76_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Error marking events as received by listener: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __42__WBSHistoryServiceStore__expireOldVisits__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Error while expiring old visits: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __52__WBSHistoryServiceStore__updateLastMaintenanceDate__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to update last maintenance date: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __57__WBSHistoryServiceStore_addAutocompleteTrigger_forItem___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to add autocomplete trigger: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __75__WBSHistoryServiceStore_getAutocompleteTriggersForItem_completionHandler___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;

  OUTLINED_FUNCTION_16();
  v2 = (void *)v1;
  OUTLINED_FUNCTION_1_1(v1, v3, v4, 5.8081e-34);
  OUTLINED_FUNCTION_1_3(&dword_1A3D90000, v7, v5, "Failed to fetch autocomplete triggers for %{private}@: %{public}@", v6);

  OUTLINED_FUNCTION_2_0();
}

void __75__WBSHistoryServiceStore_getAutocompleteTriggersForItem_completionHandler___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to fetch autocomplete triggers: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __66__WBSHistoryServiceStore_connectionProxyConnectionWasInterrupted___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to reconnect to database service after interruption with error: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

@end
