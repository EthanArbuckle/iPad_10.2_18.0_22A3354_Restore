@implementation REMStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonUserInteractiveStore, 0);
  objc_storeStrong((id *)&self->_storeContainerToken, 0);
  objc_storeStrong((id *)&self->_daemonController, 0);
  objc_storeStrong((id *)&self->_l_inProgressSaveRequestsContainer, 0);
}

- (id)initUserInteractive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  REMStore *v6;
  REMStore *v7;
  REMStore *nonUserInteractiveStore;

  v3 = a3;
  if (a3)
    +[REMXPCDaemonController userInteractiveDaemonController](REMXPCDaemonController, "userInteractiveDaemonController");
  else
    +[REMXPCDaemonController weakSharedInstance](REMXPCDaemonController, "weakSharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[REMStore initWithDaemonController:storeContainerToken:](self, "initWithDaemonController:storeContainerToken:", v5, 0);
  if (v3)
  {
    v7 = objc_alloc_init(REMStore);
    nonUserInteractiveStore = v6->_nonUserInteractiveStore;
    v6->_nonUserInteractiveStore = v7;

  }
  return v6;
}

- (REMStore)init
{
  void *v3;
  REMStore *v4;

  +[REMXPCDaemonController weakSharedInstance](REMXPCDaemonController, "weakSharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[REMStore initWithDaemonController:storeContainerToken:](self, "initWithDaemonController:storeContainerToken:", v3, 0);

  return v4;
}

- (REMStore)initWithDaemonController:(id)a3 storeContainerToken:(id)a4
{
  id v7;
  id v8;
  REMStore *v9;
  REMStore *v10;
  NSObject *v11;
  _REMInProgressSaveRequestsContainer *v12;
  _REMInProgressSaveRequestsContainer *l_inProgressSaveRequestsContainer;
  objc_super v15;
  uint8_t buf[4];
  REMStore *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)REMStore;
  v9 = -[REMStore init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemonController, a3);
    if (v10->_storeContainerToken)
    {
      +[REMLog xpc](REMLog, "xpc");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v10;
        _os_log_impl(&dword_1B4A39000, v11, OS_LOG_TYPE_INFO, "Created isolated store {store: %@}", buf, 0xCu);
      }

    }
    objc_storeStrong((id *)&v10->_storeContainerToken, a4);
    v10->_lock._os_unfair_lock_opaque = 0;
    v12 = objc_alloc_init(_REMInProgressSaveRequestsContainer);
    l_inProgressSaveRequestsContainer = v10->_l_inProgressSaveRequestsContainer;
    v10->_l_inProgressSaveRequestsContainer = v12;

  }
  return v10;
}

- (unint64_t)storeGeneration
{
  return atomic_load(&__debug_storeGeneration);
}

- (BOOL)containsListWithCustomBadgeForTipKitWithError:(id *)a3
{
  REMTipKitDataView *v4;
  void *v5;
  BOOL v6;

  v4 = -[REMTipKitDataView initWithStore:]([REMTipKitDataView alloc], "initWithStore:", self);
  -[REMTipKitDataView fetchListsWithCustomBadgeCountWithError:](v4, "fetchListsWithCustomBadgeCountWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue") > 0;

  return v6;
}

- (unint64_t)completedRemindersCountForTipKitWithError:(id *)a3
{
  REMTipKitDataView *v4;
  void *v5;
  unint64_t v6;

  v4 = -[REMTipKitDataView initWithStore:]([REMTipKitDataView alloc], "initWithStore:", self);
  -[REMTipKitDataView fetchCompletedRemindersCountWithError:](v4, "fetchCompletedRemindersCountWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

- (BOOL)containsCustomSmartListForTipKitWithError:(id *)a3
{
  REMTipKitDataView *v4;
  void *v5;
  BOOL v6;

  v4 = -[REMTipKitDataView initWithStore:]([REMTipKitDataView alloc], "initWithStore:", self);
  -[REMTipKitDataView fetchCustomSmartListsCountWithError:](v4, "fetchCustomSmartListsCountWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue") > 0;

  return v6;
}

- (BOOL)containsHashtagsForTipKitWithError:(id *)a3
{
  REMTipKitDataView *v4;
  void *v5;
  BOOL v6;

  v4 = -[REMTipKitDataView initWithStore:]([REMTipKitDataView alloc], "initWithStore:", self);
  -[REMTipKitDataView fetchHashtagsCountWithError:](v4, "fetchHashtagsCountWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue") > 0;

  return v6;
}

- (id)resultFromPerformingSwiftInvocation:(id)a3 parametersData:(id)a4 storages:(id)a5 error:(id *)a6
{
  id v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  os_signpost_id_t spid;
  NSObject *v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  _QWORD v49[4];
  id v50;
  uint64_t *v51;
  uint64_t v52;
  os_activity_scope_state_s state;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint8_t buf[4];
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v42 = a4;
  v43 = a5;
  if (-[REMStore assertOnMainThreadFetches](self, "assertOnMainThreadFetches"))
    dispatch_assert_queue_not_V2(MEMORY[0x1E0C80D38]);
  -[REMStore _incrementStoreGeneration](self, "_incrementStoreGeneration");
  v11 = resultFromPerformingSwiftInvocation_parametersData_storages_error__globalInvocationCounter++;
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__1;
  v64 = __Block_byref_object_dispose__1;
  v65 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__1;
  v58 = __Block_byref_object_dispose__1;
  v59 = 0;
  v12 = _os_activity_create(&dword_1B4A39000, "REMStore swiftInvocation", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  v13 = -[REMStore _isUserInteractiveStore](self, "_isUserInteractiveStore");
  v41 = v12;
  +[REMSignpost database](REMSignpost, "database");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_generate(v14);
  v16 = v14;
  v17 = v16;
  spid = v15;
  v18 = v15 - 1;
  if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    objc_msgSend(v10, "name");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = objc_msgSend(v19, "cStringUsingEncoding:", 1);
    *(_DWORD *)buf = 136446466;
    v67 = v20;
    v68 = 1026;
    LODWORD(v69) = v13;
    _os_signpost_emit_with_name_impl(&dword_1B4A39000, v17, OS_SIGNPOST_INTERVAL_BEGIN, spid, "REMStore.invocation", " enableTelemetry=YES Name=%{public, signpost.telemetry:string1, Name=InvocationName}s UserInteractive=%{public, signpost.telemetry:number1, Name=UserInteractive}d", buf, 0x12u);

  }
  +[REMLogStore read](REMLogStore, "read");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v42, "length");
    v24 = objc_msgSend(v43, "count");
    *(_DWORD *)buf = 134218754;
    v67 = v11;
    v68 = 2114;
    v69 = (uint64_t)v22;
    v70 = 2048;
    v71 = v23;
    v72 = 2048;
    v73 = v24;
    _os_log_impl(&dword_1B4A39000, v21, OS_LOG_TYPE_DEFAULT, "FETCH START {invocationCounter: %ld, name: %{public}@, parametersData.length %ld, storages.count: %ld}", buf, 0x2Au);

  }
  v25 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "name");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("swInv_%@"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __78__REMStore_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke;
  v49[3] = &unk_1E67F87A0;
  v52 = v11;
  v29 = v10;
  v50 = v29;
  v51 = &v60;
  -[REMStore _xpcSyncStorePerformerWithReason:errorHandler:](self, "_xpcSyncStorePerformerWithReason:errorHandler:", v27, v49);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v28;
  v44[1] = 3221225472;
  v44[2] = __78__REMStore_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_79;
  v44[3] = &unk_1E67F87C8;
  v48 = v11;
  v31 = v29;
  v45 = v31;
  v46 = &v54;
  v47 = &v60;
  objc_msgSend(v30, "performSwiftInvocation:withParametersData:storages:completion:", v31, v42, v43, v44);
  if (a6)
    *a6 = objc_retainAutorelease((id)v61[5]);
  v32 = v17;
  v33 = v32;
  if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    objc_msgSend((id)v55[5], "resultStorages");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");
    objc_msgSend((id)v55[5], "resultData");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "length");
    *(_DWORD *)buf = 134349312;
    v67 = v35;
    v68 = 2050;
    v69 = v37;
    _os_signpost_emit_with_name_impl(&dword_1B4A39000, v33, OS_SIGNPOST_INTERVAL_END, spid, "REMStore.invocation", " enableTelemetry=YES ResultCount=%{public, signpost.telemetry:number1, Name:ResultCount}ld DataSize=%{public, signpost.telemetry:number2, Name:DataSize}ld", buf, 0x16u);

  }
  v38 = (id)v55[5];

  os_activity_scope_leave(&state);
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v60, 8);
  return v38;
}

- (id)resultFromPerformingInvocation:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  NSObject *v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  _QWORD v34[4];
  id v35;
  uint64_t *v36;
  os_activity_scope_state_s state;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  _BOOL4 v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[REMStore assertOnMainThreadFetches](self, "assertOnMainThreadFetches"))
    dispatch_assert_queue_not_V2(MEMORY[0x1E0C80D38]);
  -[REMStore _incrementStoreGeneration](self, "_incrementStoreGeneration");
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__1;
  v48 = __Block_byref_object_dispose__1;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__1;
  v42 = __Block_byref_object_dispose__1;
  v43 = 0;
  v7 = _os_activity_create(&dword_1B4A39000, "REMStore Invocation", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v8 = -[REMStore _isUserInteractiveStore](self, "_isUserInteractiveStore");
  v29 = v7;
  +[REMSignpost database](REMSignpost, "database");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    objc_msgSend(v6, "name");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend(v13, "cStringUsingEncoding:", 1);
    *(_DWORD *)buf = 136446466;
    v51 = v14;
    v52 = 1026;
    v53 = v8;
    _os_signpost_emit_with_name_impl(&dword_1B4A39000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "REMStore.invocation", " enableTelemetry=YES Name=%{public, signpost.telemetry:string1, Name=InvocationName}s UserInteractive=%{public, signpost.telemetry:number1, Name=UserInteractive}d", buf, 0x12u);

  }
  +[REMLogStore read](REMLogStore, "read");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v51 = (uint64_t)v16;
    _os_log_impl(&dword_1B4A39000, v15, OS_LOG_TYPE_DEFAULT, "FETCH START {name: %{public}@}", buf, 0xCu);

  }
  v17 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("inv_%@"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = a4;
  v21 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __49__REMStore_resultFromPerformingInvocation_error___block_invoke;
  v34[3] = &unk_1E67F85C0;
  v22 = v6;
  v35 = v22;
  v36 = &v44;
  -[REMStore _xpcSyncStorePerformerWithReason:errorHandler:](self, "_xpcSyncStorePerformerWithReason:errorHandler:", v19, v34);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v21;
  v30[1] = 3221225472;
  v30[2] = __49__REMStore_resultFromPerformingInvocation_error___block_invoke_75;
  v30[3] = &unk_1E67F8778;
  v24 = v22;
  v31 = v24;
  v32 = &v38;
  v33 = &v44;
  objc_msgSend(v23, "performInvocation:completion:", v24, v30);
  if (v20)
    *v20 = objc_retainAutorelease((id)v45[5]);
  v25 = v12;
  v26 = v25;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B4A39000, v26, OS_SIGNPOST_INTERVAL_END, v10, "REMStore.invocation", " enableTelemetry=YES ", buf, 2u);
  }

  v27 = (id)v39[5];
  os_activity_scope_leave(&state);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v27;
}

- (BOOL)assertOnMainThreadFetches
{
  return self->_assertOnMainThreadFetches;
}

- (BOOL)_isUserInteractiveStore
{
  void *v2;
  BOOL v3;

  -[REMStore nonUserInteractiveStore](self, "nonUserInteractiveStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (REMStore)nonUserInteractiveStore
{
  if (self->_nonUserInteractiveStore)
    self = self->_nonUserInteractiveStore;
  return self;
}

- (void)_incrementStoreGeneration
{
  unint64_t v2;

  do
    v2 = __ldaxr(&__debug_storeGeneration);
  while (__stlxr(v2 + 1, &__debug_storeGeneration));
}

- (id)_xpcSyncStorePerformerWithReason:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  v7 = a3;
  -[REMStore daemonController](self, "daemonController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__REMStore__xpcSyncStorePerformerWithReason_errorHandler___block_invoke;
  v12[3] = &unk_1E67F8700;
  v12[4] = self;
  v13 = v6;
  v9 = v6;
  objc_msgSend(v8, "syncStorePerformerWithReason:errorHandler:", v7, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (REMDaemonController)daemonController
{
  return self->_daemonController;
}

+ (NSString)storeDidChangeNotificationName
{
  return (NSString *)CFSTR("REMStoreDidChangeNotification");
}

- (REMStore)initWithDaemonController:(id)a3
{
  return -[REMStore initWithDaemonController:storeContainerToken:](self, "initWithDaemonController:storeContainerToken:", a3, 0);
}

- (void)setAssertOnMainThreadFetches:(BOOL)a3
{
  self->_assertOnMainThreadFetches = a3;
}

- (void)triggerThrottledSyncWithReason:(id)a3 discretionary:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__REMStore_AccountManagement_Internal__triggerThrottledSyncWithReason_discretionary_completion___block_invoke;
  v10[3] = &unk_1E67F86B0;
  v11 = v8;
  v9 = v8;
  -[REMStore _triggerSyncWithReason:skipDataAccessSync:forcingCloudKitReload:discretionary:bypassThrottler:completion:](self, "_triggerSyncWithReason:skipDataAccessSync:forcingCloudKitReload:discretionary:bypassThrottler:completion:", a3, 0, 0, v5, 0, v10);

}

- (void)requestToUpdateClientConnectionsAsynchronously:(BOOL)a3 shouldKeepAlive:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  id *v11;
  void *v12;
  void (**v13)(id, _QWORD);
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  void (**v18)(id, _QWORD);
  char v19;
  BOOL v20;
  _QWORD v21[4];
  id v22;
  BOOL v23;
  BOOL v24;
  _QWORD v25[4];
  id v26;
  BOOL v27;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[REMStore daemonController](self, "daemonController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __105__REMStore_ClientConnections__requestToUpdateClientConnectionsAsynchronously_shouldKeepAlive_completion___block_invoke;
    v25[3] = &unk_1E67F8DC8;
    v27 = v5;
    v11 = &v26;
    v26 = v8;
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __105__REMStore_ClientConnections__requestToUpdateClientConnectionsAsynchronously_shouldKeepAlive_completion___block_invoke_2;
    v21[3] = &unk_1E67F8BD0;
    v23 = v6;
    v24 = v5;
    v22 = v26;
    objc_msgSend(v9, "asyncStorePerformerWithReason:loadHandler:errorHandler:", CFSTR("requestToUpdateClientConnections"), v25, v21);

    v12 = v22;
  }
  else
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __105__REMStore_ClientConnections__requestToUpdateClientConnectionsAsynchronously_shouldKeepAlive_completion___block_invoke_552;
    v17 = &unk_1E67F8BD0;
    v19 = 0;
    v20 = v5;
    v11 = (id *)&v18;
    v13 = (void (**)(id, _QWORD))v8;
    v18 = v13;
    objc_msgSend(v9, "syncStorePerformerWithReason:errorHandler:", CFSTR("requestToUpdateClientConnections"), &v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "requestToUpdateClientConnectionsWithShouldKeepAlive:", v5, v14, v15, v16, v17);
      if (v13)
        v13[2](v13, 0);
    }
  }

}

uint64_t __105__REMStore_ClientConnections__requestToUpdateClientConnectionsAsynchronously_shouldKeepAlive_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  objc_msgSend(a2, "requestToUpdateClientConnectionsWithShouldKeepAlive:", *(unsigned __int8 *)(a1 + 40));
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

+ (void)initialize
{
  const char *v2;
  NSObject *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = (const char *)_REMStoreChangedNotificationName;
    +[REMDispatchQueue storeQueue](REMDispatchQueue, "storeQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    notify_register_dispatch(v2, (int *)&initialize_token, v3, &__block_literal_global_2);

  }
}

- (void)requestDownloadGroceryModelAssetsFromTrial
{
  id v2;

  -[REMStore _xpcSyncStorePerformerWithReason:errorHandler:](self, "_xpcSyncStorePerformerWithReason:errorHandler:", CFSTR("requestDownloadGroceryModelAssetsFromTrial"), &__block_literal_global_393);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestDownloadGroceryModelAssetsFromTrial");

}

- (BOOL)hasActiveCloudKitAccountForTipKitWithError:(id *)a3
{
  REMAccountsDataView *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v4 = -[REMAccountsDataView initWithStore:]([REMAccountsDataView alloc], "initWithStore:", self);
  -[REMAccountsDataView fetchPrimaryActiveCloudKitAccountREMObjectIDWithError:](v4, "fetchPrimaryActiveCloudKitAccountREMObjectIDWithError:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (a3 && !v5)
  {
    v7 = *a3;
    objc_msgSend(v7, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(CFSTR("com.apple.reminderkit"), "isEqual:", v8))
    {
      v9 = objc_msgSend(v7, "code");

      if (v9 == -3007)
        *a3 = 0;
    }
    else
    {

    }
  }

  return v6 != 0;
}

void __96__REMStore_AccountManagement_Internal__triggerThrottledSyncWithReason_discretionary_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void (*v8)(void);
  uint8_t v9[16];

  v3 = a2;
  v4 = v3;
  if (!v3)
    goto LABEL_8;
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", CFSTR("com.apple.reminderkit")) & 1) == 0)
  {

    goto LABEL_8;
  }
  v6 = objc_msgSend(v4, "code");

  if (v6 != -1002)
  {
LABEL_8:
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_9;
  }
  +[REMLogStore xpc](REMLogStore, "xpc");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1B4A39000, v7, OS_LOG_TYPE_INFO, "Sync throttled", v9, 2u);
  }

  v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_9:
  v8();

}

void __22__REMStore_initialize__block_invoke()
{
  _os_activity_initiate(&dword_1B4A39000, "REMStore did change", OS_ACTIVITY_FLAG_IF_NONE_PRESENT, &__block_literal_global_14);
}

void __22__REMStore_initialize__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("REMStoreDidChangeNotification"), 0);

}

+ (id)createIsolatedStoreContainerWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  +[REMXPCDaemonController weakSharedInstance](REMXPCDaemonController, "weakSharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__REMStore_createIsolatedStoreContainerWithError___block_invoke;
  v10[3] = &unk_1E67F8490;
  v10[4] = &v17;
  objc_msgSend(v4, "syncDebugPerformerWithReason:errorHandler:", CFSTR("createIsolatedStoreContainer"), v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __50__REMStore_createIsolatedStoreContainerWithError___block_invoke_2;
  v9[3] = &unk_1E67F84B8;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v6, "createIsolatedStoreContainerWithCompletion:", v9);
  if (a3)
    *a3 = objc_retainAutorelease((id)v18[5]);
  v7 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __50__REMStore_createIsolatedStoreContainerWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__REMStore_createIsolatedStoreContainerWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void **v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[REMLog xpc](REMLog, "xpc");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __50__REMStore_createIsolatedStoreContainerWithError___block_invoke_2_cold_1();

    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v10 = v6;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v5;
      _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_INFO, "Did create isolated store container {token: %@}", (uint8_t *)&v13, 0xCu);
    }

    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = v5;
  }
  v11 = v10;
  v12 = *v9;
  *v9 = v11;

}

+ (BOOL)destroyIsolatedStoreContainerWithToken:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  int v9;
  BOOL v10;
  _QWORD v12[6];
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  +[REMXPCDaemonController weakSharedInstance](REMXPCDaemonController, "weakSharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__REMStore_destroyIsolatedStoreContainerWithToken_error___block_invoke;
  v13[3] = &unk_1E67F8508;
  v8 = v5;
  v14 = v8;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __57__REMStore_destroyIsolatedStoreContainerWithToken_error___block_invoke_25;
  v12[3] = &unk_1E67F8530;
  v12[4] = &v15;
  v12[5] = &v19;
  objc_msgSend(v6, "asyncDebugPerformerWithReason:loadHandler:errorHandler:", CFSTR("destroyIsolatedStoreContainerWithToken"), v13, v12);
  v9 = *((unsigned __int8 *)v16 + 24);
  if (a4 && !*((_BYTE *)v16 + 24))
  {
    *a4 = objc_retainAutorelease((id)v20[5]);
    v9 = *((unsigned __int8 *)v16 + 24);
  }
  v10 = v9 != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v10;
}

void __57__REMStore_destroyIsolatedStoreContainerWithToken_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__REMStore_destroyIsolatedStoreContainerWithToken_error___block_invoke_2;
  v4[3] = &unk_1E67F84E0;
  v5 = v3;
  objc_msgSend(a2, "destroyIsolatedStoreContainerWithToken:completion:", v5, v4);

}

void __57__REMStore_destroyIsolatedStoreContainerWithToken_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[REMLog xpc](REMLog, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __57__REMStore_destroyIsolatedStoreContainerWithToken_error___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_INFO, "Did destroy isolated store container {token: %@}", (uint8_t *)&v7, 0xCu);
  }

}

void __57__REMStore_destroyIsolatedStoreContainerWithToken_error___block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __57__REMStore_destroyIsolatedStoreContainerWithToken_error___block_invoke_25_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

- (REMStore)initWithStoreContainerToken:(id)a3
{
  id v4;
  REMXPCDaemonController *v5;
  REMStore *v6;

  v4 = a3;
  v5 = -[REMXPCDaemonController initWithStoreContainerToken:]([REMXPCDaemonController alloc], "initWithStoreContainerToken:", v4);
  v6 = -[REMStore initWithDaemonController:storeContainerToken:](self, "initWithDaemonController:storeContainerToken:", v5, v4);

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[REMStore storeContainerToken](self, "storeContainerToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = objc_opt_class();
    v6 = -[REMStore storeGeneration](self, "storeGeneration");
    -[REMStore storeContainerToken](self, "storeContainerToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p[%ld] storeContainerToken: %@>"), v5, self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)REMStore;
    -[REMStore description](&v10, sel_description);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[REMStore description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMStore l_inProgressSaveRequestsContainer](self, "l_inProgressSaveRequestsContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ inProgressSaveRequestContainer: %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)invalidate
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  REMStore *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[REMStore storeContainerToken](self, "storeContainerToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_1B4A39000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating REMStore {store: %@}", (uint8_t *)&v6, 0xCu);
    }

    -[REMStore daemonController](self, "daemonController");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject invalidate](v4, "invalidate");
  }
  else if (v5)
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_1B4A39000, v4, OS_LOG_TYPE_DEFAULT, "Not invalidating connection for REMStore because its not an isolated store {store: %@}", (uint8_t *)&v6, 0xCu);
  }

  -[REMStore setDaemonController:](self, "setDaemonController:", 0);
}

- (void)nukeDatabase
{
  void *v2;
  id v3;

  -[REMStore daemonController](self, "daemonController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncDebugPerformerWithReason:errorHandler:", CFSTR("nukeDatabase"), &__block_literal_global_37);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "nukeDatabase:", &__block_literal_global_39);
}

void __24__REMStore_nukeDatabase__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__REMStore_nukeDatabase__block_invoke_cold_1();

}

void __24__REMStore_nukeDatabase__block_invoke_38(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[REMLogStore write](REMLogStore, "write");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1B4A39000, v3, OS_LOG_TYPE_DEFAULT, "Nuked database with error: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (id)fetchAccountsWithError:(id *)a3
{
  REMAccountsDataView *v4;
  void *v5;

  v4 = -[REMAccountsDataView initWithStore:]([REMAccountsDataView alloc], "initWithStore:", self);
  -[REMAccountsDataView fetchAllAccountsWithError:](v4, "fetchAllAccountsWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fetchAccountsIncludingInactive:(BOOL)a3 error:(id *)a4
{
  REMAccountsDataView *v5;
  void *v6;

  if (a3)
  {
    v5 = -[REMAccountsDataView initWithStore:]([REMAccountsDataView alloc], "initWithStore:", self);
    -[REMAccountsDataView fetchAllAccountsForAccountManagementWithError:](v5, "fetchAllAccountsForAccountManagementWithError:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[REMStore fetchAccountsWithError:](self, "fetchAccountsWithError:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)fetchAccountsForDumpingWithError:(id *)a3
{
  REMAccountsDataView *v4;
  void *v5;

  v4 = -[REMAccountsDataView initWithStore:]([REMAccountsDataView alloc], "initWithStore:", self);
  -[REMAccountsDataView fetchAllAccountsForDumpingWithError:](v4, "fetchAllAccountsForDumpingWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fetchSiriFoundInAppsListWithError:(id *)a3
{
  void *v5;
  void *v6;

  +[REMList siriFoundInAppsListID](REMList, "siriFoundInAppsListID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMStore fetchListWithObjectID:error:](self, "fetchListWithObjectID:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)refreshAccount:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __27__REMStore_refreshAccount___block_invoke;
  v10[3] = &unk_1E67F8598;
  v11 = v4;
  v5 = v4;
  -[REMStore _withInProgressSaveRequestContainer:](self, "_withInProgressSaveRequestContainer:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = v5;
  v8 = v6;

  return v8;
}

uint64_t __27__REMStore_refreshAccount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "latestSaveInProgressAccount:", *(_QWORD *)(a1 + 32));
}

- (id)refreshList:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __24__REMStore_refreshList___block_invoke;
  v10[3] = &unk_1E67F8598;
  v11 = v4;
  v5 = v4;
  -[REMStore _withInProgressSaveRequestContainer:](self, "_withInProgressSaveRequestContainer:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = v5;
  v8 = v6;

  return v8;
}

uint64_t __24__REMStore_refreshList___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "latestSaveInProgressList:", *(_QWORD *)(a1 + 32));
}

- (id)refreshReminder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __28__REMStore_refreshReminder___block_invoke;
  v10[3] = &unk_1E67F8598;
  v11 = v4;
  v5 = v4;
  -[REMStore _withInProgressSaveRequestContainer:](self, "_withInProgressSaveRequestContainer:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = v5;
  v8 = v6;

  return v8;
}

uint64_t __28__REMStore_refreshReminder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "latestSaveInProgressReminder:", *(_QWORD *)(a1 + 32));
}

- (id)optimisticallyMaterializeReminderChangeItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__REMStore_optimisticallyMaterializeReminderChangeItem___block_invoke;
  v8[3] = &unk_1E67F8598;
  v9 = v4;
  v5 = v4;
  -[REMStore _withInProgressSaveRequestContainer:](self, "_withInProgressSaveRequestContainer:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __56__REMStore_optimisticallyMaterializeReminderChangeItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "latestSaveInProgressReminderForReminderChangeItem:", *(_QWORD *)(a1 + 32));
}

- (id)fetchPrimaryActiveCloudKitAccountREMObjectIDWithError:(id *)a3
{
  REMAccountsDataView *v4;
  void *v5;

  v4 = -[REMAccountsDataView initWithStore:]([REMAccountsDataView alloc], "initWithStore:", self);
  -[REMAccountsDataView fetchPrimaryActiveCloudKitAccountREMObjectIDWithError:](v4, "fetchPrimaryActiveCloudKitAccountREMObjectIDWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fetchPrimaryActiveCloudKitAccountWithError:(id *)a3
{
  REMAccountsDataView *v4;
  void *v5;

  v4 = -[REMAccountsDataView initWithStore:]([REMAccountsDataView alloc], "initWithStore:", self);
  -[REMAccountsDataView fetchPrimaryActiveCloudKitAccountWithError:](v4, "fetchPrimaryActiveCloudKitAccountWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fetchActiveCloudKitAccountObjectIDsWithFetchOption:(int64_t)a3 error:(id *)a4
{
  REMAccountsDataView *v6;
  void *v7;

  v6 = -[REMAccountsDataView initWithStore:]([REMAccountsDataView alloc], "initWithStore:", self);
  -[REMAccountsDataView fetchActiveCloudKitAccountObjectIDsWithFetchOption:error:](v6, "fetchActiveCloudKitAccountObjectIDsWithFetchOption:error:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fetchAccountWithObjectID:(id)a3 error:(id *)a4
{
  id v6;
  REMAccountsDataView *v7;
  void *v8;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "accountObjectID");
  v7 = -[REMAccountsDataView initWithStore:]([REMAccountsDataView alloc], "initWithStore:", self);
  -[REMAccountsDataView fetchAccountWithObjectID:error:](v7, "fetchAccountWithObjectID:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchAccountsWithObjectIDs:(id)a3 error:(id *)a4
{
  id v6;
  REMAccountsDataView *v7;
  void *v8;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "accountObjectIDs");
  v7 = -[REMAccountsDataView initWithStore:]([REMAccountsDataView alloc], "initWithStore:", self);
  -[REMAccountsDataView fetchAccountsWithObjectIDs:error:](v7, "fetchAccountsWithObjectIDs:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchListWithObjectID:(id)a3 error:(id *)a4
{
  id v6;
  REMListsDataView *v7;
  void *v8;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
  v7 = -[REMListsDataView initWithStore:]([REMListsDataView alloc], "initWithStore:", self);
  -[REMListsDataView fetchListWithObjectID:error:](v7, "fetchListWithObjectID:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchListsWithObjectIDs:(id)a3 error:(id *)a4
{
  id v6;
  REMListsDataView *v7;
  void *v8;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "listIDs");
  v7 = -[REMListsDataView initWithStore:]([REMListsDataView alloc], "initWithStore:", self);
  -[REMListsDataView fetchListsWithObjectIDs:error:](v7, "fetchListsWithObjectIDs:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchCustomSmartListWithObjectID:(id)a3 error:(id *)a4
{
  id v6;
  REMSmartListsDataView *v7;
  void *v8;

  v6 = a3;
  v7 = -[REMSmartListsDataView initWithStore:]([REMSmartListsDataView alloc], "initWithStore:", self);
  -[REMSmartListsDataView fetchCustomSmartListWithObjectID:error:](v7, "fetchCustomSmartListWithObjectID:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchCustomSmartListsWithError:(id *)a3
{
  REMSmartListsDataView *v4;
  void *v5;

  v4 = -[REMSmartListsDataView initWithStore:]([REMSmartListsDataView alloc], "initWithStore:", self);
  -[REMSmartListsDataView fetchCustomSmartListsWithError:](v4, "fetchCustomSmartListsWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fetchRemindersWithObjectIDs:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  +[REMReminderFetchOptions defaultFetchOptions](REMReminderFetchOptions, "defaultFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMStore fetchRemindersWithObjectIDs:fetchOptions:error:](self, "fetchRemindersWithObjectIDs:fetchOptions:error:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchRemindersWithObjectIDs:(id)a3 fetchOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  REMRemindersDataView *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  v10 = -[REMRemindersDataView initWithStore:]([REMRemindersDataView alloc], "initWithStore:", self);
  -[REMRemindersDataView fetchRemindersWithObjectIDs:fetchOptions:error:](v10, "fetchRemindersWithObjectIDs:fetchOptions:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)fetchRemindersMatchingPredicateDescriptor:(id)a3 sortDescriptors:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  REMRemindersDataView *v13;
  void *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[REMRemindersDataView initWithStore:]([REMRemindersDataView alloc], "initWithStore:", self);
  -[REMRemindersDataView fetchRemindersMatchingPredicateDescriptor:sortDescriptors:options:error:](v13, "fetchRemindersMatchingPredicateDescriptor:sortDescriptors:options:error:", v12, v11, v10, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)fetchRemindersWithParentReminderIDs:(id)a3 error:(id *)a4
{
  id v6;
  REMRemindersDataView *v7;
  void *v8;

  v6 = a3;
  v7 = -[REMRemindersDataView initWithStore:]([REMRemindersDataView alloc], "initWithStore:", self);
  -[REMRemindersDataView fetchRemindersWithParentReminderIDs:error:](v7, "fetchRemindersWithParentReminderIDs:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchReminderWithObjectID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
  +[REMReminderFetchOptions defaultFetchOptions](REMReminderFetchOptions, "defaultFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMStore fetchReminderWithObjectID:fetchOptions:error:](self, "fetchReminderWithObjectID:fetchOptions:error:", v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchReminderWithObjectID:(id)a3 fetchOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  REMRemindersDataView *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  if (!v8)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
  v10 = -[REMRemindersDataView initWithStore:]([REMRemindersDataView alloc], "initWithStore:", self);
  -[REMRemindersDataView fetchReminderWithObjectID:fetchOptions:error:](v10, "fetchReminderWithObjectID:fetchOptions:error:", v8, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)fetchReplicaManagerForAccountID:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "accountID");
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  v25 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __50__REMStore_fetchReplicaManagerForAccountID_error___block_invoke;
  v17[3] = &unk_1E67F85C0;
  v8 = v6;
  v18 = v8;
  v19 = &v26;
  -[REMStore _xpcSyncStorePerformerWithReason:errorHandler:](self, "_xpcSyncStorePerformerWithReason:errorHandler:", CFSTR("fetchReplicaManagerForAccountID:"), v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __50__REMStore_fetchReplicaManagerForAccountID_error___block_invoke_56;
  v13[3] = &unk_1E67F85E8;
  v10 = v8;
  v14 = v10;
  v15 = &v20;
  v16 = &v26;
  objc_msgSend(v9, "fetchReplicaManagerForAccountID:completion:", v10, v13);
  if (a4)
    *a4 = objc_retainAutorelease((id)v27[5]);
  v11 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v11;
}

void __50__REMStore_fetchReplicaManagerForAccountID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __50__REMStore_fetchReplicaManagerForAccountID_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __50__REMStore_fetchReplicaManagerForAccountID_error___block_invoke_56(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void **v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[REMLogStore read](REMLogStore, "read");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __50__REMStore_fetchReplicaManagerForAccountID_error___block_invoke_56_cold_1();

    v9 = (void **)(*(_QWORD *)(a1[6] + 8) + 40);
    v10 = v6;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v11 = a1[4];
    v14 = 138412546;
    v15 = v11;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_INFO, "Store replica manager fetch successful {account: %@, fetchSerializedData: %@}", (uint8_t *)&v14, 0x16u);
  }

  if (v5)
  {
    v9 = (void **)(*(_QWORD *)(a1[5] + 8) + 40);
    v10 = v5;
LABEL_9:
    v12 = v10;
    v13 = *v9;
    *v9 = v12;

  }
}

- (id)fetchReplicaManagersForAccountID:(id)a3 bundleID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__1;
  v35 = __Block_byref_object_dispose__1;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1;
  v29 = __Block_byref_object_dispose__1;
  v30 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __60__REMStore_fetchReplicaManagersForAccountID_bundleID_error___block_invoke;
  v22[3] = &unk_1E67F85C0;
  v11 = v8;
  v23 = v11;
  v24 = &v31;
  -[REMStore _xpcSyncStorePerformerWithReason:errorHandler:](self, "_xpcSyncStorePerformerWithReason:errorHandler:", CFSTR("fetchReplicaManagersForAccountID"), v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __60__REMStore_fetchReplicaManagersForAccountID_bundleID_error___block_invoke_60;
  v17[3] = &unk_1E67F8610;
  v13 = v11;
  v18 = v13;
  v14 = v9;
  v19 = v14;
  v20 = &v25;
  v21 = &v31;
  objc_msgSend(v12, "fetchReplicaManagersForAccountID:bundleID:completion:", v13, v14, v17);
  if (a5)
    *a5 = objc_retainAutorelease((id)v32[5]);
  v15 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v15;
}

void __60__REMStore_fetchReplicaManagersForAccountID_bundleID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __50__REMStore_fetchReplicaManagerForAccountID_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __60__REMStore_fetchReplicaManagersForAccountID_bundleID_error___block_invoke_60(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void **v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[REMLogStore read](REMLogStore, "read");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __60__REMStore_fetchReplicaManagersForAccountID_bundleID_error___block_invoke_60_cold_1();

    v9 = (void **)(*(_QWORD *)(a1[7] + 8) + 40);
    v10 = v6;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v11 = a1[4];
    v12 = a1[5];
    v15 = 138412802;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    v19 = 2048;
    v20 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_INFO, "Store replica manager fetch successful {account: %@, bundleID: %@, managerByID.count: %lu}", (uint8_t *)&v15, 0x20u);
  }

  if (v5)
  {
    v9 = (void **)(*(_QWORD *)(a1[6] + 8) + 40);
    v10 = v5;
LABEL_9:
    v13 = v10;
    v14 = *v9;
    *v9 = v13;

  }
}

- (BOOL)saveSaveRequest:(id)a3 accountChangeItems:(id)a4 listChangeItems:(id)a5 listSectionChangeItems:(id)a6 smartListChangeItems:(id)a7 smartListSectionChangeItems:(id)a8 templateChangeItems:(id)a9 templateSectionChangeItems:(id)a10 reminderChangeItems:(id)a11 author:(id)a12 replicaManagerProvider:(id)a13 error:(id *)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  char v31;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[6];
  _QWORD v43[7];
  _QWORD v44[4];
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;

  v34 = a3;
  v39 = a4;
  v38 = a5;
  v37 = a6;
  v36 = a7;
  v35 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v24 = a13;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__1;
  v54 = __Block_byref_object_dispose__1;
  v55 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  -[REMStore _incrementStoreGeneration](self, "_incrementStoreGeneration");
  v25 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __238__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_error___block_invoke;
  v44[3] = &unk_1E67F8598;
  v26 = v34;
  v45 = v26;
  v27 = -[REMStore _withInProgressSaveRequestContainer:](self, "_withInProgressSaveRequestContainer:", v44);
  v43[0] = v25;
  v43[1] = 3221225472;
  v43[2] = __238__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_error___block_invoke_2;
  v43[3] = &unk_1E67F8638;
  v43[4] = self;
  v43[5] = &v50;
  v43[6] = &v46;
  -[REMStore _xpcSyncStorePerformerWithReason:errorHandler:](self, "_xpcSyncStorePerformerWithReason:errorHandler:", CFSTR("saveRequest"), v43);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v25;
  v42[1] = 3221225472;
  v42[2] = __238__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_error___block_invoke_64;
  v42[3] = &unk_1E67F8530;
  v42[4] = &v50;
  v42[5] = &v46;
  BYTE1(v33) = objc_msgSend(v26, "syncToCloudKit");
  LOBYTE(v33) = 1;
  -[REMStore _saveAccountChangeItems:listChangeItems:listSectionChangeItems:smartListChangeItems:smartListSectionChangeItems:templateChangeItems:templateSectionChangeItems:reminderChangeItems:author:replicaManagerProvider:synchronously:syncToCloudKit:performer:completion:](self, "_saveAccountChangeItems:listChangeItems:listSectionChangeItems:smartListChangeItems:smartListSectionChangeItems:templateChangeItems:templateSectionChangeItems:reminderChangeItems:author:replicaManagerProvider:synchronously:syncToCloudKit:performer:completion:", v39, v38, v37, v36, v35, v20, v21, v22, v23, v24, v33, v28, v42);
  if (a14)
    *a14 = objc_retainAutorelease((id)v51[5]);
  v40[0] = v25;
  v40[1] = 3221225472;
  v40[2] = __238__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_error___block_invoke_2_65;
  v40[3] = &unk_1E67F8598;
  v29 = v26;
  v41 = v29;
  v30 = -[REMStore _withInProgressSaveRequestContainer:](self, "_withInProgressSaveRequestContainer:", v40);
  v31 = *((_BYTE *)v47 + 24);

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);

  return v31;
}

uint64_t __238__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_error___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "saveRequestSaveDidStart:", *(_QWORD *)(a1 + 32));
  return 0;
}

void __238__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __238__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_error___block_invoke_2_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
}

void __238__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_error___block_invoke_64(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4 == 0;

}

uint64_t __238__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_error___block_invoke_2_65(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "saveRequestSaveDidFinish:", *(_QWORD *)(a1 + 32));
  return 0;
}

- (void)saveSaveRequest:(id)a3 accountChangeItems:(id)a4 listChangeItems:(id)a5 listSectionChangeItems:(id)a6 smartListChangeItems:(id)a7 smartListSectionChangeItems:(id)a8 templateChangeItems:(id)a9 templateSectionChangeItems:(id)a10 reminderChangeItems:(id)a11 author:(id)a12 replicaManagerProvider:(id)a13 queue:(id)a14 completion:(id)a15
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[5];
  id v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  REMStore *v73;
  id v74;
  id v75;

  v50 = a3;
  v53 = a4;
  v52 = a5;
  v21 = a6;
  v38 = a7;
  v37 = a8;
  v22 = a9;
  v23 = a10;
  v41 = a11;
  v43 = a12;
  v45 = a13;
  v24 = a14;
  v25 = a15;
  v71[0] = MEMORY[0x1E0C809B0];
  v26 = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke;
  v71[3] = &unk_1E67F8688;
  v72 = v24;
  v73 = self;
  v27 = v50;
  v74 = v27;
  v75 = v25;
  v51 = v25;
  v49 = v24;
  v47 = (void *)MEMORY[0x1B5E3E098](v71);
  -[REMStore _incrementStoreGeneration](self, "_incrementStoreGeneration");
  v69[0] = v26;
  v69[1] = 3221225472;
  v69[2] = __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_4;
  v69[3] = &unk_1E67F8598;
  v28 = v27;
  v70 = v28;
  v29 = -[REMStore _withInProgressSaveRequestContainer:](self, "_withInProgressSaveRequestContainer:", v69);
  -[REMStore daemonController](self, "daemonController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v26;
  v56[1] = 3221225472;
  v56[2] = __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_5;
  v56[3] = &unk_1E67F86D8;
  v56[4] = self;
  v57 = v53;
  v58 = v52;
  v59 = v21;
  v60 = v38;
  v61 = v37;
  v62 = v22;
  v63 = v23;
  v64 = v41;
  v65 = v43;
  v66 = v45;
  v67 = v28;
  v68 = v47;
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_7;
  v54[3] = &unk_1E67F8700;
  v54[4] = self;
  v55 = v68;
  v30 = v68;
  v48 = v28;
  v46 = v45;
  v44 = v43;
  v42 = v41;
  v40 = v23;
  v39 = v22;
  v31 = v37;
  v32 = v38;
  v33 = v21;
  v34 = v52;
  v35 = v53;
  objc_msgSend(v36, "asyncStorePerformerWithReason:loadHandler:errorHandler:", CFSTR("saveRequest"), v56, v54);

}

void __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_2;
  v7[3] = &unk_1E67F8660;
  v4 = *(NSObject **)(a1 + 32);
  v7[4] = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v9 = v3;
  v10 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

void __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_3;
  v4[3] = &unk_1E67F8598;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v3 = (id)objc_msgSend(v2, "_withInProgressSaveRequestContainer:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "saveRequestSaveDidFinish:", *(_QWORD *)(a1 + 32));
  return 0;
}

uint64_t __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "saveRequestSaveDidStart:", *(_QWORD *)(a1 + 32));
  return 0;
}

void __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v3 = *(_QWORD *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 80);
  v13 = *(_OWORD *)(a1 + 88);
  v8 = *(_QWORD *)(a1 + 104);
  v9 = *(_QWORD *)(a1 + 112);
  v10 = *(void **)(a1 + 120);
  v11 = a2;
  LOBYTE(v10) = objc_msgSend(v10, "syncToCloudKit");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_6;
  v16[3] = &unk_1E67F86B0;
  v17 = *(id *)(a1 + 128);
  BYTE1(v12) = (_BYTE)v10;
  LOBYTE(v12) = 0;
  objc_msgSend(v15, "_saveAccountChangeItems:listChangeItems:listSectionChangeItems:smartListChangeItems:smartListSectionChangeItems:templateChangeItems:templateSectionChangeItems:reminderChangeItems:author:replicaManagerProvider:synchronously:syncToCloudKit:performer:completion:", v14, v3, v4, v5, v6, v7, v13, v8, v9, v12, v11, v16);

}

uint64_t __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __238__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_error___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)processNoOpSaveRequest:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __52__REMStore_processNoOpSaveRequest_queue_completion___block_invoke;
  v19[3] = &unk_1E67F8598;
  v11 = v8;
  v20 = v11;
  v12 = a4;
  v13 = -[REMStore _withInProgressSaveRequestContainer:](self, "_withInProgressSaveRequestContainer:", v19);
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __52__REMStore_processNoOpSaveRequest_queue_completion___block_invoke_2;
  v16[3] = &unk_1E67F8728;
  v16[4] = self;
  v17 = v11;
  v18 = v9;
  v14 = v9;
  v15 = v11;
  dispatch_async(v12, v16);

}

uint64_t __52__REMStore_processNoOpSaveRequest_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "saveRequestSaveDidStart:", *(_QWORD *)(a1 + 32));
  return 0;
}

void __52__REMStore_processNoOpSaveRequest_queue_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__REMStore_processNoOpSaveRequest_queue_completion___block_invoke_3;
  v4[3] = &unk_1E67F8598;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v3 = (id)objc_msgSend(v2, "_withInProgressSaveRequestContainer:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __52__REMStore_processNoOpSaveRequest_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "saveRequestSaveDidFinish:", *(_QWORD *)(a1 + 32));
  return 0;
}

- (id)executeFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[REMStore fetchResultByExecutingFetchRequest:error:](self, "fetchResultByExecutingFetchRequest:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "fetchExecutor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v8, "resultsFromFetchResult:inStore:error:", v7, self, &v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;

    if (!v9)
    {
      +[REMLogStore read](REMLogStore, "read");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v15 = v10;
        v16 = 2112;
        v17 = v7;
        v18 = 2112;
        v19 = v6;
        _os_log_error_impl(&dword_1B4A39000, v11, OS_LOG_TYPE_ERROR, "Failed to get results from fetchResult {error: %@, fetchResult: %@, fetchRequest: %@}", buf, 0x20u);
      }

      if (a4)
        *a4 = objc_retainAutorelease(v10);
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)resultsIndexedByObjectIDFromExecutingFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[16];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[REMSignpost database](REMSignpost, "database");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B4A39000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "REMStore.fetchByObjectID", (const char *)&unk_1B4B76FCF, buf, 2u);
  }

  -[REMStore executeFetchRequest:error:](self, "executeFetchRequest:error:", v6, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v24 = v8;
    v25 = v6;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v12, "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v19, "remObjectID", v24, v25, (_QWORD)v26);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, v20);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v16);
    }

    v8 = v24;
    v6 = v25;
  }
  else
  {
    v13 = 0;
  }
  v21 = v10;
  v22 = v21;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B4A39000, v22, OS_SIGNPOST_INTERVAL_END, v8, "REMStore.fetchByObjectID", (const char *)&unk_1B4B76FCF, buf, 2u);
  }

  return v13;
}

- (unint64_t)countForFetchRequest:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  unint64_t v8;

  v6 = (void *)objc_msgSend(a3, "copy");
  -[REMStore fetchResultByExecutingFetchRequest:error:](self, "fetchResultByExecutingFetchRequest:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (id)fetchResultByExecutingFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  REMStore *v15;
  uint64_t *v16;
  uint64_t *v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  v26 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __53__REMStore_fetchResultByExecutingFetchRequest_error___block_invoke;
  v18[3] = &unk_1E67F85C0;
  v8 = v6;
  v19 = v8;
  v20 = &v27;
  -[REMStore _xpcSyncStorePerformerWithReason:errorHandler:](self, "_xpcSyncStorePerformerWithReason:errorHandler:", CFSTR("fetchRequest"), v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __53__REMStore_fetchResultByExecutingFetchRequest_error___block_invoke_71;
  v13[3] = &unk_1E67F8750;
  v10 = v8;
  v14 = v10;
  v15 = self;
  v16 = &v21;
  v17 = &v27;
  objc_msgSend(v9, "executeFetchRequest:completion:", v10, v13);
  if (a4)
    *a4 = objc_retainAutorelease((id)v28[5]);
  v11 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v11;
}

void __53__REMStore_fetchResultByExecutingFetchRequest_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __53__REMStore_fetchResultByExecutingFetchRequest_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __53__REMStore_fetchResultByExecutingFetchRequest_error___block_invoke_71(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[REMLogStore read](REMLogStore, "read");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __53__REMStore_fetchResultByExecutingFetchRequest_error___block_invoke_71_cold_2();

    v9 = *(_QWORD *)(a1[7] + 8);
    v10 = v6;
LABEL_11:
    v13 = *(NSObject **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)a1[4];
    v21 = 138412546;
    v22 = v11;
    v23 = 2112;
    v24 = v5;
    _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_INFO, "Store fetch successful {fetchRequest: %@, fetchResult: %@}", (uint8_t *)&v21, 0x16u);
  }

  +[REMLogStore read](REMLogStore, "read");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v5)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v21 = 138412290;
      v22 = v5;
      _os_log_impl(&dword_1B4A39000, v13, OS_LOG_TYPE_INFO, "Successfully executed fetch {fetchResult: %@}", (uint8_t *)&v21, 0xCu);
    }

    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = v5;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    __53__REMStore_fetchResultByExecutingFetchRequest_error___block_invoke_71_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
LABEL_12:

}

void __49__REMStore_resultFromPerformingInvocation_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __49__REMStore_resultFromPerformingInvocation_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __49__REMStore_resultFromPerformingInvocation_error___block_invoke_75(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void **v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[REMLogStore read](REMLogStore, "read");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __49__REMStore_resultFromPerformingInvocation_error___block_invoke_75_cold_1();

    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v10 = v6;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_DEFAULT, "FETCH END {name: %{public}@}", (uint8_t *)&v14, 0xCu);

    }
    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = v5;
  }
  v12 = v10;
  v13 = *v9;
  *v9 = v12;

}

void __78__REMStore_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __78__REMStore_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __78__REMStore_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_79(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void **v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[REMLogStore read](REMLogStore, "read");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __78__REMStore_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_79_cold_1();

    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v10 = v6;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 32), "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resultData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");
      objc_msgSend(v5, "resultStorages");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 134218754;
      v19 = v11;
      v20 = 2114;
      v21 = v12;
      v22 = 2048;
      v23 = v14;
      v24 = 2048;
      v25 = objc_msgSend(v15, "count");
      _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_DEFAULT, "FETCH END {invocationCounter: %ld, name: %{public}@, result.data.length: %ld, result.storages.count: %ld}", (uint8_t *)&v18, 0x2Au);

    }
    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = v5;
  }
  v16 = v10;
  v17 = *v9;
  *v9 = v16;

}

- (void)enumerateAllRemindersWithBlock:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__REMStore_enumerateAllRemindersWithBlock___block_invoke;
    v6[3] = &unk_1E67F87F0;
    v7 = v4;
    -[REMStore enumerateAllListsWithBlock:](self, "enumerateAllListsWithBlock:", v6);

  }
}

void __43__REMStore_enumerateAllRemindersWithBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  char v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v20 = 0;
  v19 = 0;
  objc_msgSend(v5, "fetchRemindersWithError:", &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;
  if (v7)
  {
    +[REMLogStore read](REMLogStore, "read");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __43__REMStore_enumerateAllRemindersWithBlock___block_invoke_cold_1((uint64_t)v5, v7, v8);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)MEMORY[0x1B5E3DEC4](v10);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        if (v20)
        {
          *a3 = 1;
          objc_autoreleasePoolPop(v14);
          goto LABEL_15;
        }
        objc_autoreleasePoolPop(v14);
        ++v13;
      }
      while (v11 != v13);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      v11 = v10;
      if (v10)
        continue;
      break;
    }
  }
LABEL_15:

}

- (void)enumerateAllListsWithBlock:(id)a3
{
  -[REMStore _enumerateAllListsIncludingGroups:withBlock:](self, "_enumerateAllListsIncludingGroups:withBlock:", 0, a3);
}

- (void)enumerateAllGroupsAndListsWithBlock:(id)a3
{
  -[REMStore _enumerateAllListsIncludingGroups:withBlock:](self, "_enumerateAllListsIncludingGroups:withBlock:", 1, a3);
}

- (void)_enumerateAllListsIncludingGroups:(BOOL)a3 withBlock:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, void *, _BYTE *);
  void *v7;
  id v8;
  unint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  uint64_t v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *context;
  uint64_t v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  unsigned __int8 v59;
  _BYTE v60[128];
  uint8_t v61[128];
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v4 = a3;
  v67 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, _BYTE *))a4;
  if (v6)
  {
    v59 = 0;
    v58 = 0;
    -[REMStore fetchAccountsWithError:](self, "fetchAccountsWithError:", &v58);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v58;
    v9 = 0x1E67F4000uLL;
    if (v8)
    {
      +[REMLogStore read](REMLogStore, "read");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[REMStore _enumerateAllListsIncludingGroups:withBlock:].cold.1(v8, v10);

    }
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    if (v12)
    {
      v14 = *(_QWORD *)v55;
      *(_QWORD *)&v13 = 138412546;
      v34 = v13;
      v36 = v4;
      v40 = v11;
      v35 = *(_QWORD *)v55;
      do
      {
        v15 = 0;
        v38 = v12;
        do
        {
          if (*(_QWORD *)v55 != v14)
            objc_enumerationMutation(v11);
          v39 = v15;
          v16 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v15);
          context = (void *)MEMORY[0x1B5E3DEC4]();
          v53 = v8;
          objc_msgSend(v16, "fetchListsWithError:", &v53);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v53;

          if (v18)
          {
            objc_msgSend(*(id *)(v9 + 3888), "read");
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v18, "localizedDescription");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v34;
              v63 = v16;
              v64 = 2112;
              v65 = v33;
              _os_log_error_impl(&dword_1B4A39000, v19, OS_LOG_TYPE_ERROR, "Unexpected error when fetching all lists from account {account: %@, error: %@}", buf, 0x16u);

            }
          }
          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          v20 = v17;
          v43 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
          if (v43)
          {
            v21 = *(_QWORD *)v50;
            v8 = v18;
            v37 = *(_QWORD *)v50;
            while (2)
            {
              for (i = 0; i != v43; ++i)
              {
                if (*(_QWORD *)v50 != v21)
                  objc_enumerationMutation(v20);
                v23 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
                v24 = (void *)MEMORY[0x1B5E3DEC4]();
                if (objc_msgSend(v23, "isGroup"))
                {
                  if (v4)
                  {
                    v6[2](v6, v23, &v59);
                    if (v59)
                    {
LABEL_41:
                      objc_autoreleasePoolPop(v24);

                      objc_autoreleasePoolPop(context);
                      v11 = v40;
                      goto LABEL_42;
                    }
                  }
                  v47 = 0u;
                  v48 = 0u;
                  v45 = 0u;
                  v46 = 0u;
                  objc_msgSend(v23, "sublistContext", v34);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v44 = v8;
                  objc_msgSend(v25, "fetchListsWithError:", &v44);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = v44;

                  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
                  if (v27)
                  {
                    v28 = v27;
                    v29 = *(_QWORD *)v46;
                    while (2)
                    {
                      for (j = 0; j != v28; ++j)
                      {
                        if (*(_QWORD *)v46 != v29)
                          objc_enumerationMutation(v26);
                        v31 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
                        v32 = (void *)MEMORY[0x1B5E3DEC4]();
                        v6[2](v6, v31, &v59);
                        LODWORD(v31) = v59;
                        objc_autoreleasePoolPop(v32);
                        if ((_DWORD)v31)
                        {

                          v8 = v41;
                          goto LABEL_41;
                        }
                      }
                      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
                      if (v28)
                        continue;
                      break;
                    }
                  }

                  v8 = v41;
                  v4 = v36;
                  v9 = 0x1E67F4000;
                  v14 = v35;
                  v21 = v37;
                }
                else
                {
                  v6[2](v6, v23, &v59);
                  if (v59)
                    goto LABEL_41;
                }
                objc_autoreleasePoolPop(v24);
              }
              v43 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
              if (v43)
                continue;
              break;
            }
          }
          else
          {
            v8 = v18;
          }

          objc_autoreleasePoolPop(context);
          v15 = v39 + 1;
          v11 = v40;
        }
        while (v39 + 1 != v38);
        v12 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
      }
      while (v12);
    }
LABEL_42:

  }
}

void __58__REMStore__xpcSyncStorePerformerWithReason_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58__REMStore__xpcSyncStorePerformerWithReason_errorHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)_addChangeItemChangedKeys:(id)a3 objectID:(id)a4 toChangedKeysMap:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[REMLogStore write](REMLogStore, "write");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[REMStore _addChangeItemChangedKeys:objectID:toChangedKeysMap:].cold.1();

  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v8);

}

- (void)_saveAccountChangeItems:(id)a3 listChangeItems:(id)a4 listSectionChangeItems:(id)a5 smartListChangeItems:(id)a6 smartListSectionChangeItems:(id)a7 templateChangeItems:(id)a8 templateSectionChangeItems:(id)a9 reminderChangeItems:(id)a10 author:(id)a11 replicaManagerProvider:(id)a12 synchronously:(BOOL)a13 syncToCloudKit:(BOOL)a14 performer:(id)a15 completion:(id)a16
{
  id v22;
  id v23;
  NSObject *v24;
  os_signpost_id_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  char v61;
  uint64_t v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t j;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t k;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t m;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t n;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t ii;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t jj;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t kk;
  uint64_t v123;
  void *v124;
  void *v125;
  id v126;
  NSObject *v127;
  NSObject *v128;
  BOOL v129;
  uint64_t v130;
  unint64_t v131;
  id v132;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  os_signpost_id_t v139;
  NSObject *v140;
  id v141;
  id v142;
  id v143;
  id v144;
  void *v145;
  NSObject *v146;
  id v147;
  id v148;
  void *v149;
  void *v150;
  void *v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id obj;
  id v157;
  void *v158;
  id v159;
  void *v160;
  id v161;
  void *v162;
  id v163;
  void *v164;
  id v165;
  void *v166;
  void *v167;
  _QWORD v168[4];
  id v169;
  id v170;
  NSObject *v171;
  id v172;
  os_signpost_id_t v173;
  id v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  uint8_t v203;
  char v204[15];
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  _BYTE v213[128];
  _BYTE v214[128];
  _BYTE v215[128];
  _BYTE v216[128];
  _BYTE v217[128];
  _BYTE v218[128];
  _BYTE v219[128];
  _BYTE v220[128];
  uint8_t v221[128];
  uint8_t buf[4];
  uint64_t v223;
  __int16 v224;
  uint64_t v225;
  __int16 v226;
  uint64_t v227;
  __int16 v228;
  uint64_t v229;
  __int16 v230;
  uint64_t v231;
  uint64_t v232;

  v232 = *MEMORY[0x1E0C80C00];
  v165 = a3;
  v22 = a4;
  v154 = a5;
  v163 = a6;
  v161 = a7;
  v159 = a8;
  v157 = a9;
  v148 = a10;
  v23 = a11;
  v144 = a12;
  v143 = a15;
  v141 = a16;
  +[REMSignpost database](REMSignpost, "database");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = os_signpost_id_generate(v24);
  v26 = v24;
  v27 = v26;
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B4A39000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "REMStore.save", (const char *)&unk_1B4B76FCF, buf, 2u);
  }
  v139 = v25;
  v140 = v27;

  +[REMLogStore write](REMLogStore, "write");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = objc_msgSend(v165, "count");
    v30 = objc_msgSend(v22, "count");
    v31 = objc_msgSend(v163, "count");
    v32 = objc_msgSend(v148, "count");
    *(_DWORD *)buf = 138544386;
    v223 = (uint64_t)v23;
    v224 = 2048;
    v225 = v29;
    v226 = 2048;
    v227 = v30;
    v228 = 2048;
    v229 = v31;
    v230 = 2048;
    v231 = v32;
    _os_log_impl(&dword_1B4A39000, v28, OS_LOG_TYPE_DEFAULT, "(client) SAVE START {author: %{public}@, accountChangeItems.count: %lu, listChangeItems.count: %lu, smartListChangeItems: %lu, reminderChangeItems.count: %lu}", buf, 0x34u);
  }
  v145 = v23;

  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v22, "count")+ objc_msgSend(v165, "count")+ objc_msgSend(v163, "count")+ objc_msgSend(v148, "count"));
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v165, "count"));
  v209 = 0u;
  v210 = 0u;
  v211 = 0u;
  v212 = 0u;
  v35 = v165;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v209, v221, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v210;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v210 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v209 + 1) + 8 * i);
        objc_msgSend(v40, "storage");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v167, "addObject:", v41);

        objc_msgSend(v40, "objectID");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "changedKeys");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMStore _addChangeItemChangedKeys:objectID:toChangedKeysMap:](self, "_addChangeItemChangedKeys:objectID:toChangedKeysMap:", v43, v42, v33);

        objc_msgSend(v34, "addObject:", v42);
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v209, v221, 16);
    }
    while (v37);
  }
  v151 = v34;
  v138 = v35;

  v150 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v22, "count"));
  v205 = 0u;
  v206 = 0u;
  v207 = 0u;
  v208 = 0u;
  obj = v22;
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v205, v220, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v206;
    do
    {
      v47 = 0;
      do
      {
        if (*(_QWORD *)v206 != v46)
          objc_enumerationMutation(obj);
        v48 = *(void **)(*((_QWORD *)&v205 + 1) + 8 * v47);
        objc_msgSend(v48, "objectID");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "entityName");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        +[REMList cdEntityName](REMList, "cdEntityName");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v50, "isEqualToString:", v51);

        if (v52)
        {
          objc_msgSend(v48, "storage");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v150, "addObject:", v53);

          objc_msgSend(v48, "changedKeys");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMStore _addChangeItemChangedKeys:objectID:toChangedKeysMap:](self, "_addChangeItemChangedKeys:objectID:toChangedKeysMap:", v54, v49, v33);

          objc_msgSend(v48, "accountID");
          v55 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v151, "addObject:", v55);
LABEL_20:

          goto LABEL_23;
        }
        objc_msgSend(v49, "entityName");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        +[REMTemplate cdEntityName](REMTemplate, "cdEntityName");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v56, "isEqualToString:", v57);

        if (v58)
        {
          objc_msgSend(v48, "changedKeys");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E6836D78);
          v61 = objc_msgSend(v59, "isSubsetOfSet:", v60);

          if ((v61 & 1) == 0)
          {
            +[REMLogStore write](REMLogStore, "write");
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
              -[REMStore _saveAccountChangeItems:listChangeItems:listSectionChangeItems:smartListChangeItems:smartListSectionChangeItems:templateChangeItems:templateSectionChangeItems:reminderChangeItems:author:replicaManagerProvider:synchronously:syncToCloudKit:performer:completion:].cold.1(&v203, v204, v55);
            goto LABEL_20;
          }
        }
LABEL_23:

        ++v47;
      }
      while (v45 != v47);
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v205, v220, 16);
      v45 = v62;
    }
    while (v62);
  }

  v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v154, "count"));
  v199 = 0u;
  v200 = 0u;
  v201 = 0u;
  v202 = 0u;
  v64 = v154;
  v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v199, v219, 16);
  if (v65)
  {
    v66 = v65;
    v67 = *(_QWORD *)v200;
    do
    {
      for (j = 0; j != v66; ++j)
      {
        if (*(_QWORD *)v200 != v67)
          objc_enumerationMutation(v64);
        v69 = *(void **)(*((_QWORD *)&v199 + 1) + 8 * j);
        objc_msgSend(v69, "storage");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "addObject:", v70);

        objc_msgSend(v69, "changedKeys");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "objectID");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMStore _addChangeItemChangedKeys:objectID:toChangedKeysMap:](self, "_addChangeItemChangedKeys:objectID:toChangedKeysMap:", v71, v72, v33);

      }
      v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v199, v219, 16);
    }
    while (v66);
  }

  v166 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v163, "count"));
  v195 = 0u;
  v196 = 0u;
  v197 = 0u;
  v198 = 0u;
  v155 = v163;
  v73 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v195, v218, 16);
  if (v73)
  {
    v74 = v73;
    v75 = *(_QWORD *)v196;
    do
    {
      for (k = 0; k != v74; ++k)
      {
        if (*(_QWORD *)v196 != v75)
          objc_enumerationMutation(v155);
        v77 = *(void **)(*((_QWORD *)&v195 + 1) + 8 * k);
        objc_msgSend(v77, "storage");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v166, "addObject:", v78);

        objc_msgSend(v77, "changedKeys");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "objectID");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMStore _addChangeItemChangedKeys:objectID:toChangedKeysMap:](self, "_addChangeItemChangedKeys:objectID:toChangedKeysMap:", v79, v80, v33);

      }
      v74 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v195, v218, 16);
    }
    while (v74);
  }
  v136 = v63;

  v164 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v161, "count"));
  v191 = 0u;
  v192 = 0u;
  v193 = 0u;
  v194 = 0u;
  v153 = v161;
  v81 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v191, v217, 16);
  if (v81)
  {
    v82 = v81;
    v83 = *(_QWORD *)v192;
    do
    {
      for (m = 0; m != v82; ++m)
      {
        if (*(_QWORD *)v192 != v83)
          objc_enumerationMutation(v153);
        v85 = *(void **)(*((_QWORD *)&v191 + 1) + 8 * m);
        objc_msgSend(v85, "storage");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "addObject:", v86);

        objc_msgSend(v85, "changedKeys");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "objectID");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMStore _addChangeItemChangedKeys:objectID:toChangedKeysMap:](self, "_addChangeItemChangedKeys:objectID:toChangedKeysMap:", v87, v88, v33);

      }
      v82 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v191, v217, 16);
    }
    while (v82);
  }
  v137 = v64;

  v162 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v159, "count"));
  v187 = 0u;
  v188 = 0u;
  v189 = 0u;
  v190 = 0u;
  v152 = v159;
  v89 = objc_msgSend(v152, "countByEnumeratingWithState:objects:count:", &v187, v216, 16);
  if (v89)
  {
    v90 = v89;
    v91 = *(_QWORD *)v188;
    do
    {
      for (n = 0; n != v90; ++n)
      {
        if (*(_QWORD *)v188 != v91)
          objc_enumerationMutation(v152);
        v93 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * n);
        objc_msgSend(v93, "storage");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v162, "addObject:", v94);

        objc_msgSend(v93, "changedKeys");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "objectID");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMStore _addChangeItemChangedKeys:objectID:toChangedKeysMap:](self, "_addChangeItemChangedKeys:objectID:toChangedKeysMap:", v95, v96, v33);

        objc_msgSend(v93, "accountID");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v151, "addObject:", v97);

      }
      v90 = objc_msgSend(v152, "countByEnumeratingWithState:objects:count:", &v187, v216, 16);
    }
    while (v90);
  }

  v160 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v157, "count"));
  v183 = 0u;
  v184 = 0u;
  v185 = 0u;
  v186 = 0u;
  v98 = v157;
  v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v183, v215, 16);
  if (v99)
  {
    v100 = v99;
    v101 = *(_QWORD *)v184;
    do
    {
      for (ii = 0; ii != v100; ++ii)
      {
        if (*(_QWORD *)v184 != v101)
          objc_enumerationMutation(v98);
        v103 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * ii);
        objc_msgSend(v103, "storage");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v160, "addObject:", v104);

        objc_msgSend(v103, "changedKeys");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "objectID");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMStore _addChangeItemChangedKeys:objectID:toChangedKeysMap:](self, "_addChangeItemChangedKeys:objectID:toChangedKeysMap:", v105, v106, v33);

      }
      v100 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v183, v215, 16);
    }
    while (v100);
  }
  v135 = v98;

  v158 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v148, "count"));
  v179 = 0u;
  v180 = 0u;
  v181 = 0u;
  v182 = 0u;
  v107 = v148;
  v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v179, v214, 16);
  if (v108)
  {
    v109 = v108;
    v110 = *(_QWORD *)v180;
    do
    {
      for (jj = 0; jj != v109; ++jj)
      {
        if (*(_QWORD *)v180 != v110)
          objc_enumerationMutation(v107);
        v112 = *(void **)(*((_QWORD *)&v179 + 1) + 8 * jj);
        objc_msgSend(v112, "storage");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "addObject:", v113);

        objc_msgSend(v112, "changedKeys");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "objectID");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMStore _addChangeItemChangedKeys:objectID:toChangedKeysMap:](self, "_addChangeItemChangedKeys:objectID:toChangedKeysMap:", v114, v115, v33);

        objc_msgSend(v112, "accountID");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v151, "addObject:", v116);

      }
      v109 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v179, v214, 16);
    }
    while (v109);
  }
  v134 = v107;

  objc_msgSend(v144, "unsavedReplicaManagersForAccountIDs:", v151);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v117, "count"));
  v175 = 0u;
  v176 = 0u;
  v177 = 0u;
  v178 = 0u;
  v118 = v117;
  v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v175, v213, 16);
  if (v119)
  {
    v120 = v119;
    v121 = *(_QWORD *)v176;
    do
    {
      for (kk = 0; kk != v120; ++kk)
      {
        if (*(_QWORD *)v176 != v121)
          objc_enumerationMutation(v118);
        v123 = *(_QWORD *)(*((_QWORD *)&v175 + 1) + 8 * kk);
        objc_msgSend(v118, "objectForKeyedSubscript:", v123);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v174 = 0;
        objc_msgSend(v124, "serializedDataCappedAtMaxSize:error:", 1, &v174);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v126 = v174;

        +[REMLogStore write](REMLogStore, "write");
        v127 = objc_claimAutoreleasedReturnValue();
        v128 = v127;
        if (v125)
          v129 = v126 == 0;
        else
          v129 = 0;
        if (v129)
        {
          if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
          {
            v130 = objc_msgSend(v125, "version");
            *(_DWORD *)buf = 134218242;
            v223 = v130;
            v224 = 2112;
            v225 = v123;
            _os_log_impl(&dword_1B4A39000, v128, OS_LOG_TYPE_INFO, "Will save REMReplicaManager {version: %llu, accountID: %@}", buf, 0x16u);
          }

          objc_msgSend(v149, "setObject:forKeyedSubscript:", v125, v123);
        }
        else
        {
          if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v223 = (uint64_t)v126;
            _os_log_error_impl(&dword_1B4A39000, v128, OS_LOG_TYPE_ERROR, "Failed to serialize REMReplicaManager {error: %{public}@}", buf, 0xCu);
          }

        }
      }
      v120 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v175, v213, 16);
    }
    while (v120);
  }

  v131 = -[REMStore mode](self, "mode");
  v168[0] = MEMORY[0x1E0C809B0];
  v168[1] = 3221225472;
  v168[2] = __271__REMStore__saveAccountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_synchronously_syncToCloudKit_performer_completion___block_invoke;
  v168[3] = &unk_1E67F8818;
  v169 = v149;
  v170 = v118;
  v171 = v140;
  v172 = v141;
  v173 = v139;
  v147 = v141;
  v146 = v140;
  v142 = v118;
  v132 = v149;
  LOWORD(v133) = __PAIR16__(a14, a13);
  objc_msgSend(v143, "saveAccountStorages:listStorages:listSectionStorages:smartListStorages:smartListSectionStorages:templateStorages:templateSectionStorages:reminderStorages:changedKeys:replicaManagers:author:mode:synchronously:syncToCloudKit:completion:", v167, v150, v136, v166, v164, v162, v160, v158, v33, v132, v145, v131, v133, v168);

}

void __271__REMStore__saveAccountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_synchronously_syncToCloudKit_performer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[REMLogStore write](REMLogStore, "write");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __271__REMStore__saveAccountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_synchronously_syncToCloudKit_performer_completion___block_invoke_cold_1();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_DEFAULT, "(client) SAVE END", buf, 2u);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = *(id *)(a1 + 32);
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "version");

          +[REMLogStore write](REMLogStore, "write");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            v23 = v12;
            v24 = 2112;
            v25 = v10;
            _os_log_impl(&dword_1B4A39000, v13, OS_LOG_TYPE_INFO, "Marking REMReplicaManager as saved {version: %llu, accountID: %@}", buf, 0x16u);
          }

          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "didSaveVersion:", v12);

        }
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v7);
      v3 = 0;
    }
  }

  v15 = *(id *)(a1 + 48);
  v16 = v15;
  v17 = *(_QWORD *)(a1 + 64);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B4A39000, v16, OS_SIGNPOST_INTERVAL_END, v17, "REMStore.save", (const char *)&unk_1B4B76FCF, buf, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (id)fetchShareForListWithID:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "listID");
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  v25 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __42__REMStore_fetchShareForListWithID_error___block_invoke;
  v17[3] = &unk_1E67F85C0;
  v8 = v6;
  v18 = v8;
  v19 = &v26;
  -[REMStore _xpcSyncStorePerformerWithReason:errorHandler:](self, "_xpcSyncStorePerformerWithReason:errorHandler:", CFSTR("fetchShareForList"), v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __42__REMStore_fetchShareForListWithID_error___block_invoke_93;
  v13[3] = &unk_1E67F8840;
  v10 = v8;
  v14 = v10;
  v15 = &v26;
  v16 = &v20;
  objc_msgSend(v9, "fetchShareForObjectWithID:completion:", v10, v13);
  if (a4)
    *a4 = objc_retainAutorelease((id)v27[5]);
  v11 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v11;
}

void __42__REMStore_fetchShareForListWithID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __42__REMStore_fetchShareForListWithID_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __42__REMStore_fetchShareForListWithID_error___block_invoke_93(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[REMLogStore read](REMLogStore, "read");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __42__REMStore_fetchShareForListWithID_error___block_invoke_93_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  }
  +[REMLogStore read](REMLogStore, "read");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = a1[4];
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_INFO, "Store fetch share successful {list: %@, share: %@}", (uint8_t *)&v12, 0x16u);
  }

  v10 = *(_QWORD *)(a1[6] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

- (id)createShareForListWithID:(id)a3 appIconData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v8 = a3;
  v9 = a4;
  if (!v8)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "listID");
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1;
  v33 = __Block_byref_object_dispose__1;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1;
  v27 = __Block_byref_object_dispose__1;
  v28 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __55__REMStore_createShareForListWithID_appIconData_error___block_invoke;
  v20[3] = &unk_1E67F85C0;
  v11 = v8;
  v21 = v11;
  v22 = &v29;
  -[REMStore _xpcSyncStorePerformerWithReason:errorHandler:](self, "_xpcSyncStorePerformerWithReason:errorHandler:", CFSTR("createShareForList"), v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __55__REMStore_createShareForListWithID_appIconData_error___block_invoke_97;
  v16[3] = &unk_1E67F8840;
  v13 = v11;
  v17 = v13;
  v18 = &v29;
  v19 = &v23;
  objc_msgSend(v12, "createShareForObjectWithID:appIconData:completion:", v13, v9, v16);
  if (a5)
    *a5 = objc_retainAutorelease((id)v30[5]);
  v14 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v14;
}

void __55__REMStore_createShareForListWithID_appIconData_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__REMStore_createShareForListWithID_appIconData_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __55__REMStore_createShareForListWithID_appIconData_error___block_invoke_97(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[REMLogStore write](REMLogStore, "write");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__REMStore_createShareForListWithID_appIconData_error___block_invoke_97_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  }
  +[REMLogStore write](REMLogStore, "write");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = a1[4];
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_INFO, "Store create share successful {list: %@, share: %@}", (uint8_t *)&v12, 0x16u);
  }

  v10 = *(_QWORD *)(a1[6] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

- (void)updateShare:(id)a3 accountID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __51__REMStore_updateShare_accountID_queue_completion___block_invoke;
  v30[3] = &unk_1E67F8700;
  v31 = v12;
  v32 = v13;
  v15 = v13;
  v16 = v12;
  v17 = (void *)MEMORY[0x1B5E3E098](v30);
  -[REMStore daemonController](self, "daemonController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v14;
  v26[1] = 3221225472;
  v26[2] = __51__REMStore_updateShare_accountID_queue_completion___block_invoke_3;
  v26[3] = &unk_1E67F8890;
  v27 = v10;
  v28 = v11;
  v29 = v17;
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __51__REMStore_updateShare_accountID_queue_completion___block_invoke_5;
  v22[3] = &unk_1E67F88B8;
  v23 = v27;
  v24 = v28;
  v25 = v29;
  v19 = v29;
  v20 = v28;
  v21 = v27;
  objc_msgSend(v18, "asyncStorePerformerWithReason:loadHandler:errorHandler:", CFSTR("updateShare"), v26, v22);

}

void __51__REMStore_updateShare_accountID_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__REMStore_updateShare_accountID_queue_completion___block_invoke_2;
  v7[3] = &unk_1E67F8868;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __51__REMStore_updateShare_accountID_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __51__REMStore_updateShare_accountID_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__REMStore_updateShare_accountID_queue_completion___block_invoke_4;
  v5[3] = &unk_1E67F86B0;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "updateShare:accountID:completion:", v3, v4, v5);

}

uint64_t __51__REMStore_updateShare_accountID_queue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __51__REMStore_updateShare_accountID_queue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __51__REMStore_updateShare_accountID_queue_completion___block_invoke_5_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)stopShare:(id)a3 accountID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __49__REMStore_stopShare_accountID_queue_completion___block_invoke;
  v30[3] = &unk_1E67F8700;
  v31 = v12;
  v32 = v13;
  v15 = v13;
  v16 = v12;
  v17 = (void *)MEMORY[0x1B5E3E098](v30);
  -[REMStore daemonController](self, "daemonController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v14;
  v26[1] = 3221225472;
  v26[2] = __49__REMStore_stopShare_accountID_queue_completion___block_invoke_3;
  v26[3] = &unk_1E67F8890;
  v27 = v10;
  v28 = v11;
  v29 = v17;
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __49__REMStore_stopShare_accountID_queue_completion___block_invoke_5;
  v22[3] = &unk_1E67F88B8;
  v23 = v27;
  v24 = v28;
  v25 = v29;
  v19 = v29;
  v20 = v28;
  v21 = v27;
  objc_msgSend(v18, "asyncStorePerformerWithReason:loadHandler:errorHandler:", CFSTR("stopShare"), v26, v22);

}

void __49__REMStore_stopShare_accountID_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__REMStore_stopShare_accountID_queue_completion___block_invoke_2;
  v7[3] = &unk_1E67F8868;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __49__REMStore_stopShare_accountID_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __49__REMStore_stopShare_accountID_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__REMStore_stopShare_accountID_queue_completion___block_invoke_4;
  v5[3] = &unk_1E67F86B0;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "stopShare:accountID:completion:", v3, v4, v5);

}

uint64_t __49__REMStore_stopShare_accountID_queue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__REMStore_stopShare_accountID_queue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __49__REMStore_stopShare_accountID_queue_completion___block_invoke_5_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)acceptShareWithMetadata:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke;
  v24[3] = &unk_1E67F8700;
  v25 = v9;
  v26 = v10;
  v12 = v10;
  v13 = v9;
  v14 = (void *)MEMORY[0x1B5E3E098](v24);
  -[REMStore daemonController](self, "daemonController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke_3;
  v21[3] = &unk_1E67F8908;
  v22 = v8;
  v23 = v14;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke_5;
  v18[3] = &unk_1E67F8700;
  v19 = v22;
  v20 = v23;
  v16 = v23;
  v17 = v22;
  objc_msgSend(v15, "asyncStorePerformerWithReason:loadHandler:errorHandler:", CFSTR("acceptShare"), v21, v18);

}

void __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke_2;
  v7[3] = &unk_1E67F8868;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke_4;
  v4[3] = &unk_1E67F88E0;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "acceptShareWithMetadata:completion:", v3, v4);

}

uint64_t __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke_5_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)everConnectedToCar
{
  return 1;
}

+ (BOOL)siriShouldRouteIntentsToNewRemindersApp
{
  void *v2;
  char v3;

  +[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "siriShouldRouteIntentsToNewRemindersApp");

  return v3;
}

- (id)compressedDistributedEvaluationDataWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t v14[8];
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[REMLogStore read](REMLogStore, "read");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1B4A39000, v7, OS_LOG_TYPE_DEFAULT, "(client) DistributedEvaluation Export START {options: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v8 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__REMStore_compressedDistributedEvaluationDataWithOptions_error___block_invoke;
  v16[3] = &unk_1E67F8490;
  v16[4] = &buf;
  -[REMStore _xpcSyncStorePerformerWithReason:errorHandler:](self, "_xpcSyncStorePerformerWithReason:errorHandler:", CFSTR("distributedEvaluation"), v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __65__REMStore_compressedDistributedEvaluationDataWithOptions_error___block_invoke_108;
    v15[3] = &unk_1E67F8930;
    v15[4] = &v17;
    v15[5] = &buf;
    objc_msgSend(v9, "compressedDistributedEvaluationDataWithOptions:completion:", v6, v15);
  }
  +[REMLogStore read](REMLogStore, "read");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1B4A39000, v11, OS_LOG_TYPE_DEFAULT, "(client) DistributedEvaluation Export END", v14, 2u);
  }

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&buf, 8);

  return v12;
}

void __65__REMStore_compressedDistributedEvaluationDataWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65__REMStore_compressedDistributedEvaluationDataWithOptions_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __65__REMStore_compressedDistributedEvaluationDataWithOptions_error___block_invoke_108(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    +[REMLogStore read](REMLogStore, "read");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __65__REMStore_compressedDistributedEvaluationDataWithOptions_error___block_invoke_108_cold_2();

  }
  else if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    +[REMLogStore read](REMLogStore, "read");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __65__REMStore_compressedDistributedEvaluationDataWithOptions_error___block_invoke_108_cold_1();

    +[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", CFSTR("DistributedEvaluation Export produced no result and no error"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

- (id)fetchEligibleDefaultListsWithError:(id *)a3
{
  REMListsDataView *v4;
  void *v5;

  v4 = -[REMListsDataView initWithStore:]([REMListsDataView alloc], "initWithStore:", self);
  -[REMListsDataView fetchEligibleDefaultListsWithError:](v4, "fetchEligibleDefaultListsWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fetchDefaultListWithError:(id *)a3
{
  REMListsDataView *v4;
  void *v5;

  v4 = -[REMListsDataView initWithStore:]([REMListsDataView alloc], "initWithStore:", self);
  -[REMListsDataView fetchDefaultListWithError:](v4, "fetchDefaultListWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fetchDefaultListRequiringCloudKitWithError:(id *)a3
{
  REMListsDataView *v4;
  void *v5;

  v4 = -[REMListsDataView initWithStore:]([REMListsDataView alloc], "initWithStore:", self);
  -[REMListsDataView fetchDefaultListRequiringCloudKitWithAccountID:error:](v4, "fetchDefaultListRequiringCloudKitWithAccountID:error:", 0, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fetchDefaultListRequiringCloudKitAccountWithAccountID:(id)a3 error:(id *)a4
{
  id v6;
  REMListsDataView *v7;
  void *v8;

  v6 = a3;
  v7 = -[REMListsDataView initWithStore:]([REMListsDataView alloc], "initWithStore:", self);
  -[REMListsDataView fetchDefaultListRequiringCloudKitWithAccountID:error:](v7, "fetchDefaultListRequiringCloudKitWithAccountID:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchDefaultAccountWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  char v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  -[REMStore fetchDefaultListWithError:](self, "fetchDefaultListWithError:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    -[REMStore fetchAccountsWithError:](self, "fetchAccountsWithError:", a3);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v40;
LABEL_5:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v40 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v12);
        objc_msgSend(v13, "accountTypeHost");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isPrimaryCloudKit");

        if ((v15 & 1) != 0)
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
          if (v10)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v16 = v8;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v36;
LABEL_13:
        v20 = 0;
        while (1)
        {
          if (*(_QWORD *)v36 != v19)
            objc_enumerationMutation(v16);
          v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v20);
          objc_msgSend(v13, "accountTypeHost");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isCloudBased");

          if ((v22 & 1) != 0)
            break;
          if (v18 == ++v20)
          {
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
            if (v18)
              goto LABEL_13;
            goto LABEL_19;
          }
        }
      }
      else
      {
LABEL_19:

        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v23 = v16;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
        if (!v24)
        {
          v7 = 0;
          goto LABEL_29;
        }
        v25 = v24;
        v26 = *(_QWORD *)v32;
LABEL_21:
        v27 = 0;
        while (1)
        {
          if (*(_QWORD *)v32 != v26)
            objc_enumerationMutation(v23);
          v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v27);
          objc_msgSend(v13, "accountTypeHost", (_QWORD)v31);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isLocal");

          if ((v29 & 1) != 0)
            break;
          if (v25 == ++v27)
          {
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
            v7 = 0;
            if (v25)
              goto LABEL_21;
            goto LABEL_29;
          }
        }
      }
    }
    v7 = v13;
LABEL_29:

    goto LABEL_30;
  }
  objc_msgSend(v5, "account");
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

  return v7;
}

- (id)_withInProgressSaveRequestContainer:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  os_unfair_lock_lock(&self->_lock);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__REMStore__withInProgressSaveRequestContainer___block_invoke;
  v8[3] = &unk_1E67F8958;
  v10 = &v11;
  v5 = v4;
  v8[4] = self;
  v9 = v5;
  __48__REMStore__withInProgressSaveRequestContainer___block_invoke((uint64_t)v8);
  os_unfair_lock_unlock(&self->_lock);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __48__REMStore__withInProgressSaveRequestContainer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "l_inProgressSaveRequestsContainer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)anchoredBubbleCloudOverridesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[REMStore _xpcSyncStorePerformerWithReason:errorHandler:](self, "_xpcSyncStorePerformerWithReason:errorHandler:", CFSTR("queryAnchoredBubbleCloudOverrides"), &__block_literal_global_115);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__REMStore_anchoredBubbleCloudOverridesWithCompletion___block_invoke_116;
  v7[3] = &unk_1E67F89A0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "anchoredBubbleEnabledWithCompletion:", v7);

}

void __55__REMStore_anchoredBubbleCloudOverridesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __55__REMStore_anchoredBubbleCloudOverridesWithCompletion___block_invoke_cold_1();

}

uint64_t __55__REMStore_anchoredBubbleCloudOverridesWithCompletion___block_invoke_116(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)fetchMinimumSearchTermLengthByBaseLanguageWithError:(id *)a3
{
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1;
  v12 = __Block_byref_object_dispose__1;
  v13 = 0;
  -[REMStore _xpcSyncStorePerformerWithReason:errorHandler:](self, "_xpcSyncStorePerformerWithReason:errorHandler:", CFSTR("fetchMinimumSearchTermLengthByBaseLanguage"), &__block_literal_global_120);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__REMStore_fetchMinimumSearchTermLengthByBaseLanguageWithError___block_invoke_121;
  v7[3] = &unk_1E67F89E8;
  v7[4] = &v8;
  v7[5] = &v14;
  objc_msgSend(v4, "fetchMinimumSearchTermLengthByBaseLanguageWithCompletion:", v7);
  if (a3)
    *a3 = objc_retainAutorelease((id)v15[5]);
  v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);

  return v5;
}

void __64__REMStore_fetchMinimumSearchTermLengthByBaseLanguageWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __64__REMStore_fetchMinimumSearchTermLengthByBaseLanguageWithError___block_invoke_cold_1();

}

void __64__REMStore_fetchMinimumSearchTermLengthByBaseLanguageWithError___block_invoke_121(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void **v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[REMLogStore read](REMLogStore, "read");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __64__REMStore_fetchMinimumSearchTermLengthByBaseLanguageWithError___block_invoke_121_cold_1();

    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = v6;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v13 = 138412290;
    v14 = v5;
    _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_INFO, "Fetch minimumSearchTermLengthByBaseLanguage successful {result: %@}", (uint8_t *)&v13, 0xCu);
  }

  if (v5)
  {
    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v10 = v5;
LABEL_9:
    v11 = v10;
    v12 = *v9;
    *v9 = v11;

  }
}

- (_REMInProgressSaveRequestsContainer)l_inProgressSaveRequestsContainer
{
  return self->_l_inProgressSaveRequestsContainer;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setDaemonController:(id)a3
{
  objc_storeStrong((id *)&self->_daemonController, a3);
}

- (REMStoreContainerToken)storeContainerToken
{
  return self->_storeContainerToken;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (void)setNonUserInteractiveStore:(id)a3
{
  objc_storeStrong((id *)&self->_nonUserInteractiveStore, a3);
}

- (void)acceptCalDAVSharedList:(id)a3 queue:(id)a4 completion:(id)a5
{
  -[REMStore _respondToCalDAVSharedList:withResponse:queue:completion:](self, "_respondToCalDAVSharedList:withResponse:queue:completion:", a3, 1, a4, a5);
}

- (void)rejectCalDAVSharedList:(id)a3 queue:(id)a4 completion:(id)a5
{
  -[REMStore _respondToCalDAVSharedList:withResponse:queue:completion:](self, "_respondToCalDAVSharedList:withResponse:queue:completion:", a3, 2, a4, a5);
}

- (void)_respondToCalDAVSharedList:(id)a3 withResponse:(int64_t)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  int64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke;
  v27[3] = &unk_1E67F8700;
  v28 = v11;
  v29 = v12;
  v14 = v12;
  v15 = v11;
  v16 = (void *)MEMORY[0x1B5E3E098](v27);
  -[REMStore daemonController](self, "daemonController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3;
  v23[3] = &unk_1E67F8A10;
  v24 = v10;
  v25 = v16;
  v26 = a4;
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_278;
  v20[3] = &unk_1E67F8700;
  v21 = v24;
  v22 = v25;
  v18 = v25;
  v19 = v24;
  objc_msgSend(v17, "asyncStorePerformerWithReason:loadHandler:errorHandler:", CFSTR("respondToCalDAVSharedList"), v23, v20);

}

void __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_2;
  v7[3] = &unk_1E67F8868;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  const __CFString *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  const __CFString *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountTypeHost");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isCalDav");

  v8 = objc_msgSend(*(id *)(a1 + 32), "sharingStatus");
  if ((v7 & 1) != 0)
  {
    if (v8 == 3)
    {
      objc_msgSend(*v4, "externalIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v4, "account");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "externalIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        if (v11)
        {
          v12 = *(_QWORD *)(a1 + 48);
          if (v12 == 2)
          {
            v23[0] = MEMORY[0x1E0C809B0];
            v23[1] = 3221225472;
            v23[2] = __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_2_274;
            v23[3] = &unk_1E67F86B0;
            v24 = *(id *)(a1 + 40);
            objc_msgSend(v3, "rejectCalDAVShareWithCalendarURL:acAccountID:completion:", v9, v11, v23);
            v13 = v24;
          }
          else
          {
            if (v12 != 1)
            {
              objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Implementation error to use unknown CalDAV share response."));
              goto LABEL_25;
            }
            v25[0] = MEMORY[0x1E0C809B0];
            v25[1] = 3221225472;
            v25[2] = __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_273;
            v25[3] = &unk_1E67F86B0;
            v26 = *(id *)(a1 + 40);
            objc_msgSend(v3, "acceptCalDAVShareWithCalendarURL:acAccountID:completion:", v9, v11, v25);
            v13 = v26;
          }

LABEL_25:
          goto LABEL_26;
        }
        +[REMLogStore write](REMLogStore, "write");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_cold_2();

        v19 = *(_QWORD *)(a1 + 40);
        v20 = CFSTR("Could not find the external identifier from the given invitation list.");
      }
      else
      {
        +[REMLogStore write](REMLogStore, "write");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_cold_1();

        v19 = *(_QWORD *)(a1 + 40);
        v20 = CFSTR("Given invitation list has no external identifier.");
      }
      +[REMError invalidParameterErrorWithDescription:](REMError, "invalidParameterErrorWithDescription:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v22);

      goto LABEL_25;
    }
    +[REMLogStore write](REMLogStore, "write");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_cold_3();

    v15 = *(_QWORD *)(a1 + 40);
    v16 = CFSTR("Given invitation list isn't a sharing invitation.");
  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_cold_4();

    v15 = *(_QWORD *)(a1 + 40);
    v16 = CFSTR("Given invitation list isn't a CalDAV list.");
  }
  +[REMError invalidParameterErrorWithDescription:](REMError, "invalidParameterErrorWithDescription:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v9);
LABEL_26:

}

uint64_t __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_273(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_2_274(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_278(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_278_cold_1((uint64_t)v3, a1, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)provideChangeTrackingForAccountID:(id)a3 clientName:(id)a4
{
  return -[REMStore provideChangeTrackingForAccountID:clientName:transactionAuthorKeysToExclude:](self, "provideChangeTrackingForAccountID:clientName:transactionAuthorKeysToExclude:", a3, a4, 0);
}

- (id)provideChangeTrackingForAccountID:(id)a3 clientName:(id)a4 transactionAuthorKeysToExclude:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _REMChangeTrackingClientID *v15;
  REMChangeTracking *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    NSLog(CFSTR("'%s' is unexpectedly nil"), "accountID");
    if (v9)
      goto LABEL_3;
LABEL_12:
    NSLog(CFSTR("'%s' is unexpectedly nil"), "clientName");
    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_12;
LABEL_3:
  objc_msgSend(v8, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMStore daemonController](self, "daemonController");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v9 && v12 && v13)
  {
    v15 = -[_REMChangeTrackingClientID initWithClientName:accountIdentifier:]([_REMChangeTrackingClientID alloc], "initWithClientName:accountIdentifier:", v9, v12);
    v16 = [REMChangeTracking alloc];
    if (v10)
      v17 = -[REMChangeTracking initWithClientID:daemonController:transactionAuthorKeysToExclude:](v16, "initWithClientID:daemonController:transactionAuthorKeysToExclude:", v15, v14, v10);
    else
      v17 = -[REMChangeTracking initWithClientID:daemonController:](v16, "initWithClientID:daemonController:", v15, v14);
    v19 = (void *)v17;

  }
  else
  {
    +[REMLogStore read](REMLogStore, "read");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[REMStore(ChangeTrackingSupport) provideChangeTrackingForAccountID:clientName:transactionAuthorKeysToExclude:].cold.1();

    v19 = 0;
  }

  return v19;
}

- (id)fetchListIncludingMarkedForDeleteWithObjectID:(id)a3 error:(id *)a4
{
  id v6;
  REMListsDataView *v7;
  void *v8;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "listObjectID");
  v7 = -[REMListsDataView initWithStore:]([REMListsDataView alloc], "initWithStore:", self);
  -[REMListsDataView fetchListIncludingConcealedWithObjectID:includeMarkedForDeletionOnly:error:](v7, "fetchListIncludingConcealedWithObjectID:includeMarkedForDeletionOnly:error:", v6, 1, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchListIncludingConcealedWithObjectID:(id)a3 error:(id *)a4
{
  id v6;
  REMListsDataView *v7;
  void *v8;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "listObjectID");
  v7 = -[REMListsDataView initWithStore:]([REMListsDataView alloc], "initWithStore:", self);
  -[REMListsDataView fetchListIncludingConcealedWithObjectID:includeMarkedForDeletionOnly:error:](v7, "fetchListIncludingConcealedWithObjectID:includeMarkedForDeletionOnly:error:", v6, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchReminderIncludingConcealedWithObjectID:(id)a3 error:(id *)a4
{
  id v6;
  REMRemindersDataView *v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "reminderObjectID");
  v7 = -[REMRemindersDataView initWithStore:]([REMRemindersDataView alloc], "initWithStore:", self);
  +[REMReminderFetchOptions fetchOptionsIncludingConcealed](REMReminderFetchOptions, "fetchOptionsIncludingConcealed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRemindersDataView fetchReminderWithObjectID:fetchOptions:error:](v7, "fetchReminderWithObjectID:fetchOptions:error:", v6, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)fetchRemindersIncludingUnsupportedWithObjectIDs:(id)a3 error:(id *)a4
{
  id v6;
  REMRemindersDataView *v7;
  void *v8;

  v6 = a3;
  v7 = -[REMRemindersDataView initWithStore:]([REMRemindersDataView alloc], "initWithStore:", self);
  -[REMRemindersDataView fetchRemindersIncludingUnsupportedWithObjectIDs:error:](v7, "fetchRemindersIncludingUnsupportedWithObjectIDs:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)provideAnonymousChangeTrackingWithTransactionAuthorKeysToExclude:(id)a3
{
  id v4;
  _REMChangeTrackingClientID *v5;
  void *v6;
  REMChangeTracking *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;

  v4 = a3;
  v5 = -[_REMChangeTrackingClientID initWithClientName:accountIdentifier:]([_REMChangeTrackingClientID alloc], "initWithClientName:accountIdentifier:", CFSTR("___dummy-client-identifier"), CFSTR("___dummy-account-identifier"));
  -[REMStore daemonController](self, "daemonController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = [REMChangeTracking alloc];
    if (v4)
      v8 = -[REMChangeTracking initWithClientID:daemonController:transactionAuthorKeysToExclude:](v7, "initWithClientID:daemonController:transactionAuthorKeysToExclude:", v5, v6, v4);
    else
      v8 = -[REMChangeTracking initWithClientID:daemonController:](v7, "initWithClientID:daemonController:", v5, v6);
    v10 = (void *)v8;
  }
  else
  {
    +[REMLogStore read](REMLogStore, "read");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[REMStore(ChangeTrackingProvider_IntegrationTestsOnlyAPIsSupport) provideAnonymousChangeTrackingWithTransactionAuthorKeysToExclude:].cold.1();

    v10 = 0;
  }

  return v10;
}

+ (void)notifyOfInteractionWithPeople:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  dispatch_block_t v6;
  _QWORD block[4];
  id v8;

  v3 = a3;
  +[REMDispatchQueue storeQueue](REMDispatchQueue, "storeQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople___block_invoke;
  block[3] = &unk_1E67F8A58;
  v8 = v3;
  v5 = v3;
  v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(v4, v6);

}

void __66__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople___block_invoke(uint64_t a1)
{
  REMStore *v2;

  v2 = objc_alloc_init(REMStore);
  -[REMStore notifyOfInteractionWithPeople:force:completion:](v2, "notifyOfInteractionWithPeople:force:completion:", *(_QWORD *)(a1 + 32), 0, &__block_literal_global_308);

}

- (void)notifyOfInteractionWithPeople:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (a4
    || +[REMStore _shouldNotifyReminddOfInteractionWithPeople](REMStore, "_shouldNotifyReminddOfInteractionWithPeople"))
  {
    +[REMLog alarmEngine](REMLog, "alarmEngine");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v8;
      _os_log_impl(&dword_1B4A39000, v10, OS_LOG_TYPE_DEFAULT, "_shouldNotifyReminddOfInteractionWithPeople returned YES. Notifying people interaction {people: %@}", buf, 0xCu);
    }

    -[REMStore daemonController](self, "daemonController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __83__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople_force_completion___block_invoke;
    v17[3] = &unk_1E67F8908;
    v18 = v8;
    v19 = v9;
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __83__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople_force_completion___block_invoke_311;
    v14[3] = &unk_1E67F8700;
    v15 = v18;
    v16 = v19;
    objc_msgSend(v11, "asyncStorePerformerWithReason:loadHandler:errorHandler:", CFSTR("notifyOfInteractionWithPeople"), v17, v14);

  }
  else
  {
    +[REMLog alarmEngine](REMLog, "alarmEngine");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v8;
      _os_log_impl(&dword_1B4A39000, v13, OS_LOG_TYPE_INFO, "_shouldNotifyReminddOfInteractionWithPeople returned NO. Skipping notification {people: %@}", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

void __83__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople_force_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople_force_completion___block_invoke_2;
  v5[3] = &unk_1E67F8700;
  v6 = v4;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(a2, "notifyOfInteractionWithPeople:completion:", v6, v5);

}

void __83__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople_force_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    +[REMLog alarmEngine](REMLog, "alarmEngine");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __83__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople_force_completion___block_invoke_2_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __83__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople_force_completion___block_invoke_311(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __83__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople_force_completion___block_invoke_311_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (BOOL)_shouldNotifyReminddOfInteractionWithPeople
{
  NSObject *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  uint32_t v6;
  int v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  uint32_t state;
  NSObject *v12;
  BOOL result;
  uint64_t v14;
  int check;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[REMDispatchQueue storeQueue](REMDispatchQueue, "storeQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  v3 = _shouldNotifyReminddOfInteractionWithPeople___sNotifyToken;
  if (_shouldNotifyReminddOfInteractionWithPeople___sNotifyToken == -1)
  {
    *(_DWORD *)buf = -1;
    v6 = notify_register_check((const char *)_REMStoreShouldNotifyOfInteractionWithPeopleNotificationName, (int *)buf);
    if (v6)
    {
      v7 = v6;
      +[REMLog alarmEngine](REMLog, "alarmEngine");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        +[REMStore(iMessageInteractionSPI) _shouldNotifyReminddOfInteractionWithPeople].cold.3(v7, v4);
      goto LABEL_11;
    }
    v3 = *(_DWORD *)buf;
    _shouldNotifyReminddOfInteractionWithPeople___sNotifyToken = *(_DWORD *)buf;
  }
  if (!notify_is_valid_token(v3))
  {
    +[REMLog alarmEngine](REMLog, "alarmEngine");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = _shouldNotifyReminddOfInteractionWithPeople___sNotifyToken;
      _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_DEFAULT, "Failed to register shouldNotifyOfInteractionWithPeople with notify. Returning YES to _shouldNotifyReminddOfInteractionWithPeople {token: %d}", buf, 8u);
    }
    goto LABEL_18;
  }
  check = 0;
  if (notify_check(_shouldNotifyReminddOfInteractionWithPeople___sNotifyToken, &check))
  {
    +[REMLog alarmEngine](REMLog, "alarmEngine");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[REMStore(iMessageInteractionSPI) _shouldNotifyReminddOfInteractionWithPeople].cold.2();
LABEL_11:

    return 1;
  }
  v8 = check;
  +[REMLog alarmEngine](REMLog, "alarmEngine");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4A39000, v10, OS_LOG_TYPE_DEFAULT, "shouldNotifyOfInteractionWithPeople did change. Updating cache", buf, 2u);
    }

    v14 = 0;
    state = notify_get_state(_shouldNotifyReminddOfInteractionWithPeople___sNotifyToken, &v14);
    +[REMLog alarmEngine](REMLog, "alarmEngine");
    v12 = objc_claimAutoreleasedReturnValue();
    v5 = v12;
    if (state)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[REMStore(iMessageInteractionSPI) _shouldNotifyReminddOfInteractionWithPeople].cold.1();
LABEL_18:

      return 1;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v17 = v14;
      _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_DEFAULT, "Successfully notify_get_state updating cache {state: %llu}", buf, 0xCu);
    }

    result = v14 != 0;
    _shouldNotifyReminddOfInteractionWithPeople___sShouldNotifyRemindd = v14 != 0;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = _shouldNotifyReminddOfInteractionWithPeople___sShouldNotifyRemindd;
      _os_log_impl(&dword_1B4A39000, v10, OS_LOG_TYPE_INFO, "shouldNotifyOfInteractionWithPeople did not change. Returning cached value {__sShouldNotifyRemindd: %d}", buf, 8u);
    }

    return _shouldNotifyReminddOfInteractionWithPeople___sShouldNotifyRemindd;
  }
  return result;
}

- (id)fetchFamilyGroceryListEligibilityForFamilyChecklistWithLocale:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  REMFamilyChecklistDataView *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  const __CFString *v13;
  uint64_t v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[REMLogStore read](REMLogStore, "read");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "localeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138477827;
    v17 = v8;
    _os_log_impl(&dword_1B4A39000, v7, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI START shared grocery lists eligibility for locale {eligibility:%{private}@}", (uint8_t *)&v16, 0xCu);

  }
  v9 = -[REMFamilyChecklistDataView initWithStore:]([REMFamilyChecklistDataView alloc], "initWithStore:", self);
  -[REMFamilyChecklistDataView fetchFamilyGroceryListEligibilityForFamilyChecklistWithLocale:error:](v9, "fetchFamilyGroceryListEligibilityForFamilyChecklistWithLocale:error:", v6, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (*a4)
  {
    +[REMLogStore read](REMLogStore, "read");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[REMStore(FamilyChecklist) fetchFamilyGroceryListEligibilityForFamilyChecklistWithLocale:error:].cold.1();

  }
  +[REMLogStore read](REMLogStore, "read");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543362;
    v17 = v10;
    _os_log_impl(&dword_1B4A39000, v12, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI END shared grocery lists eligibility {eligibility:%{public}@}", (uint8_t *)&v16, 0xCu);
  }

  if ((objc_msgSend(v10, "isEligible") & 1) != 0)
  {
    v13 = CFSTR("isEligible");
LABEL_17:
    -[REMStore postFamilyAnalyticsPayloadWithOperationId:operationDetail:](self, "postFamilyAnalyticsPayloadWithOperationId:operationDetail:", CFSTR("eligibleForSharedGroceryList"), v13);
    goto LABEL_18;
  }
  v14 = objc_msgSend(v10, "ineligibilityReasons");
  switch(v14)
  {
    case 256:
LABEL_16:
      v13 = CFSTR("ineligibleCloudKitAccountNotMigrated");
      goto LABEL_17;
    case 16:
LABEL_15:
      -[REMStore postFamilyAnalyticsPayloadWithOperationId:operationDetail:](self, "postFamilyAnalyticsPayloadWithOperationId:operationDetail:", CFSTR("eligibleForSharedGroceryList"), CFSTR("ineligibleGroceryLocale"));
      goto LABEL_16;
    case 4:
      -[REMStore postFamilyAnalyticsPayloadWithOperationId:operationDetail:](self, "postFamilyAnalyticsPayloadWithOperationId:operationDetail:", CFSTR("eligibleForSharedGroceryList"), CFSTR("ineligibleCloudKitAccount"));
      goto LABEL_15;
  }
LABEL_18:

  return v10;
}

- (id)sharedGroceryListForFamilyChecklistWithCommonParticipants:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  REMFamilyChecklistDataView *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[REMLogStore read](REMLogStore, "read");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v6;
    _os_log_impl(&dword_1B4A39000, v7, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI START existing shared grocery lists {commonParticipants: %{public}@}", buf, 0xCu);
  }

  v8 = -[REMFamilyChecklistDataView initWithStore:]([REMFamilyChecklistDataView alloc], "initWithStore:", self);
  -[REMFamilyChecklistDataView fetchSharedGroceryListsWithCommonSharees:error:](v8, "fetchSharedGroceryListsWithCommonSharees:error:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (*a4)
  {
    +[REMLogStore read](REMLogStore, "read");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[REMStore(FamilyChecklist) sharedGroceryListForFamilyChecklistWithCommonParticipants:error:].cold.1();

  }
  +[REMLogStore read](REMLogStore, "read");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v9;
    _os_log_impl(&dword_1B4A39000, v11, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI END existing shared grocery lists {sharedGroceryLists: %{public}@}", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("existingSharedGroceryLists%lu"), objc_msgSend(v9, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMStore postFamilyAnalyticsPayloadWithOperationId:operationDetail:](self, "postFamilyAnalyticsPayloadWithOperationId:operationDetail:", CFSTR("existingSharedGroceryList"), v12);

  return v9;
}

- (id)createSharedGroceryListWithError:(id *)a3
{
  NSObject *v5;
  REMAccountsDataView *v6;
  void *v7;
  REMSaveRequest *v8;
  REMFamilyChecklistSharedGroceryList *v9;
  void *v10;
  void *v11;
  void *v12;
  REMColor *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v31;
  NSObject *v32;
  void *v33;
  REMFamilyChecklistSharedGroceryList *v34;
  id v35;
  uint8_t buf[4];
  REMFamilyChecklistSharedGroceryList *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  +[REMLogStore write](REMLogStore, "write");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI START create shared grocery list", buf, 2u);
  }

  v6 = -[REMAccountsDataView initWithStore:]([REMAccountsDataView alloc], "initWithStore:", self);
  -[REMAccountsDataView fetchPrimaryActiveCloudKitAccountWithError:](v6, "fetchPrimaryActiveCloudKitAccountWithError:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*a3)
  {
    +[REMLogStore write](REMLogStore, "write");
    v8 = (REMSaveRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR))
      -[REMStore(FamilyChecklist) createSharedGroceryListWithError:].cold.4();
    v9 = 0;
  }
  else
  {
    v8 = -[REMSaveRequest initWithStore:]([REMSaveRequest alloc], "initWithStore:", self);
    -[REMSaveRequest updateAccount:](v8, "updateAccount:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _REMGetLocalizedString(79);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMSaveRequest addListWithName:toAccountChangeItem:](v8, "addListWithName:toAccountChangeItem:", v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[REMColor initWithCKSymbolicColorName:hexString:]([REMColor alloc], "initWithCKSymbolicColorName:hexString:", CFSTR("green"), 0);
    objc_msgSend(v12, "setColor:", v13);

    objc_msgSend(v12, "setBadgeEmblem:", CFSTR("nature2"));
    objc_msgSend(v12, "groceryContextChangeItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setShouldCategorizeGroceryItems:", 1);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localeIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setGroceryLocaleID:", v16);

    objc_msgSend(v12, "setIsPinned:", 1);
    -[REMSaveRequest saveSynchronouslyWithError:](v8, "saveSynchronouslyWithError:", a3);
    if (*a3)
    {
      +[REMLogStore write](REMLogStore, "write");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[REMStore(FamilyChecklist) createSharedGroceryListWithError:].cold.3();
      v9 = 0;
    }
    else
    {
      objc_msgSend(v12, "objectID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMStore createShareForListWithID:appIconData:error:](self, "createShareForListWithID:appIconData:error:", v18, 0, a3);
      v17 = objc_claimAutoreleasedReturnValue();

      if (*a3)
      {
        +[REMLogStore write](REMLogStore, "write");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[REMStore(FamilyChecklist) createSharedGroceryListWithError:].cold.2();
        v9 = 0;
      }
      else
      {
        v33 = v10;
        v20 = objc_alloc_init(MEMORY[0x1E0C99E60]);
        v34 = [REMFamilyChecklistSharedGroceryList alloc];
        objc_msgSend(v12, "objectID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v20;
        v9 = -[REMFamilyChecklistSharedGroceryList initWithListID:participants:](v34, "initWithListID:participants:", v21, v20);

        -[NSObject URL](v17, "URL");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMFamilyChecklistSharedGroceryList setURL:](v9, "setURL:", v22);

        v35 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
        v23 = +[REMCloudContainer newCloudContainerForAccount:](REMCloudContainer, "newCloudContainerForAccount:", v7);
        if (v23)
        {
          v24 = v23;
          objc_msgSend(MEMORY[0x1E0C94BA8], "rem_remindersAllowedSharingOptions", v23);
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = v24;
          v27 = (void *)v25;
          objc_msgSend(v35, "registerCKShare:container:allowedSharingOptions:", v17, v26, v25);

          -[REMFamilyChecklistSharedGroceryList setItemProvider:](v9, "setItemProvider:", v35);
        }
        else
        {
          +[REMError invalidParameterErrorWithDescription:](REMError, "invalidParameterErrorWithDescription:", CFSTR("Unable to create CKContainer for created shared grocery list."), 0);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
          +[REMLogStore write](REMLogStore, "write");
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            -[REMStore(FamilyChecklist) createSharedGroceryListWithError:].cold.1();

        }
        v10 = v33;
        +[REMLogStore write](REMLogStore, "write");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v37 = v9;
          _os_log_impl(&dword_1B4A39000, v29, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI END create shared grocery list {sharedGroceryList: %{public}@}", buf, 0xCu);
        }

        -[REMStore postFamilyAnalyticsPayloadWithOperationId:operationDetail:](self, "postFamilyAnalyticsPayloadWithOperationId:operationDetail:", CFSTR("createdSharedGroceryList"), 0);
        v19 = v32;
      }

    }
  }

  return v9;
}

- (void)addParticipantsToSharedGroceryList:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  id v28;
  REMAccountsDataView *v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  REMStore *v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v37 = a4;
  +[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v54 = v5;
    _os_log_impl(&dword_1B4A39000, v6, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI START add participants to shared grocery list {sharedGroceryList: %{public}@}", buf, 0xCu);
  }

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v5, "participants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v13, "phones");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "emails");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "length"))
        {
          v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95218]), "initWithPhoneNumber:", v15);
        }
        else
        {
          if (!objc_msgSend(v17, "length"))
            goto LABEL_13;
          v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95218]), "initWithEmailAddress:", v17);
        }
        v19 = (void *)v18;
        objc_msgSend(v7, "addObject:", v18);

LABEL_13:
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v5, "listID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    -[REMStore fetchShareForListWithID:error:](self, "fetchShareForListWithID:error:", v20, &v47);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v47;

    if (v22)
    {
      +[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[REMStore(FamilyChecklist) addParticipantsToSharedGroceryList:completion:].cold.3();

      v24 = v37;
      (*((void (**)(id, _QWORD, id))v37 + 2))(v37, 0, v22);
    }
    else
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94E50]), "initWithUserIdentityLookupInfos:", v7);
      v27 = MEMORY[0x1E0C809B0];
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke;
      v45[3] = &unk_1E67F8A80;
      v28 = v21;
      v46 = v28;
      objc_msgSend(v26, "setShareParticipantFetchedBlock:", v45);
      v29 = -[REMAccountsDataView initWithStore:]([REMAccountsDataView alloc], "initWithStore:", self);
      v44 = 0;
      -[REMAccountsDataView fetchPrimaryActiveCloudKitAccountWithError:](v29, "fetchPrimaryActiveCloudKitAccountWithError:", &v44);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v44;
      if (v22)
      {
        +[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration");
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[REMStore(FamilyChecklist) addParticipantsToSharedGroceryList:completion:].cold.2();

        v24 = v37;
        (*((void (**)(id, _QWORD, id))v37 + 2))(v37, 0, v22);
      }
      else
      {
        v35 = v30;
        v32 = +[REMCloudContainer newCloudContainerForAccount:](REMCloudContainer, "newCloudContainerForAccount:", v30);
        v38[0] = v27;
        v38[1] = 3221225472;
        v38[2] = __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_357;
        v38[3] = &unk_1E67F8AF8;
        v24 = v37;
        v43 = v37;
        v39 = v5;
        v40 = v28;
        v41 = self;
        v42 = v32;
        v33 = v32;
        v30 = v35;
        v34 = v33;
        objc_msgSend(v26, "setFetchShareParticipantsCompletionBlock:", v38);
        objc_msgSend(v34, "addOperation:", v26);

      }
    }

  }
  else
  {
    +[REMError invalidParameterErrorWithDescription:](REMError, "invalidParameterErrorWithDescription:", CFSTR("No valid participants found for adding to shared grocery list."));
    v22 = (id)objc_claimAutoreleasedReturnValue();
    +[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[REMStore(FamilyChecklist) addParticipantsToSharedGroceryList:completion:].cold.1();

    v24 = v37;
    (*((void (**)(id, _QWORD, id))v37 + 2))(v37, 0, v22);
  }

}

void __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setPermission:", 3);
  objc_msgSend(*(id *)(a1 + 32), "addParticipant:", v3);

}

void __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_357(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int8x16_t v12;
  _QWORD v13[4];
  id v14;
  int8x16_t v15;
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_357_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v19 = v6;
      _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI CloudKit add participants to shared grocery list fetchParticipants succeeded {sharedGroceryList: %{public}@}", buf, 0xCu);
    }

    v7 = objc_alloc(MEMORY[0x1E0C94F10]);
    v17 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithRecordsToSave:recordIDsToDelete:", v8, 0);

    objc_msgSend(v9, "setSavePolicy:", 0);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_360;
    v13[3] = &unk_1E67F8AD0;
    v14 = *(id *)(a1 + 32);
    v16 = *(id *)(a1 + 64);
    v12 = *(int8x16_t *)(a1 + 40);
    v10 = (id)v12.i64[0];
    v15 = vextq_s8(v12, v12, 8uLL);
    objc_msgSend(v9, "setModifyRecordsCompletionBlock:", v13);
    objc_msgSend(*(id *)(a1 + 56), "privateCloudDatabase");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addOperation:", v9);

  }
}

void __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_360(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  +[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v31 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v49 = v31;
      _os_log_impl(&dword_1B4A39000, v11, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI CloudKit add participants to shared grocery list modifyRecords succeeded {sharedGroceryList: %{public}@}", buf, 0xCu);
    }
    goto LABEL_26;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_360_cold_1();

  objc_msgSend(v9, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0C947D8];
  if (!objc_msgSend(v12, "isEqual:", *MEMORY[0x1E0C947D8]) || objc_msgSend(v9, "code") != 2)
  {

    goto LABEL_23;
  }
  objc_msgSend(v9, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("CKErrorDescription"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqual:", CFSTR("Failed to modify some records"));

  if (!v16)
  {
LABEL_23:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_27;
  }
  +[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v49 = v18;
    _os_log_impl(&dword_1B4A39000, v17, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI CloudKit checking 'Partial Failure' modifyRecords error for add participants to shared grocery list {sharedGroceryList: %{public}@}", buf, 0xCu);
  }

  objc_msgSend(v9, "userInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v11 = v20;
  v21 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (!v21)
    goto LABEL_21;
  v22 = v21;
  v37 = *(_QWORD *)v44;
  v36 = v7;
  while (2)
  {
    for (i = 0; i != v22; ++i)
    {
      if (*(_QWORD *)v44 != v37)
        objc_enumerationMutation(v11);
      v24 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24 == v25)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        goto LABEL_31;
      }
      -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "domain");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v27, "isEqual:", v13))
      {

LABEL_30:
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

LABEL_31:
        v7 = v36;
        goto LABEL_27;
      }
      v28 = objc_msgSend(v26, "code");

      if (v28 != 14)
        goto LABEL_30;
      +[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v49 = v30;
        _os_log_impl(&dword_1B4A39000, v29, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI CloudKit hiding 'Server Record Change' error for add participants to shared grocery list {sharedGroceryList: %{public}@}", buf, 0xCu);
      }

    }
    v22 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    v7 = v36;
    if (v22)
      continue;
    break;
  }
LABEL_21:

LABEL_26:
  v32 = *(void **)(a1 + 40);
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_366;
  v38[3] = &unk_1E67F8AA8;
  v42 = *(id *)(a1 + 56);
  v33 = *(id *)(a1 + 32);
  v34 = *(_QWORD *)(a1 + 40);
  v35 = *(void **)(a1 + 48);
  v39 = v33;
  v40 = v34;
  v41 = v35;
  objc_msgSend(v32, "triggerCloudKitOnlySyncWithReason:discretionary:completion:", CFSTR("FamilyChecklist(CloudKitSync)"), 0, v38);

LABEL_27:
}

void __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_366(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_366_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v11 = v6;
      _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI END add participants to shared grocery list {sharedGroceryList: %{public}@}", buf, 0xCu);
    }

    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "participants");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("invitedParticipants%lu"), objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "postFamilyAnalyticsPayloadWithOperationId:operationDetail:", CFSTR("addedParticipantsToSharedGroceryList"), v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

- (BOOL)deleteSharedGroceryList:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  REMListsDataView *v8;
  void *v9;
  void *v10;
  REMSaveRequest *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[REMLogStore write](REMLogStore, "write");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v6;
    _os_log_impl(&dword_1B4A39000, v7, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI START delete shared grocery list {sharedGroceryList: %{public}@}", buf, 0xCu);
  }

  v8 = -[REMListsDataView initWithStore:]([REMListsDataView alloc], "initWithStore:", self);
  objc_msgSend(v6, "listID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListsDataView fetchListWithObjectID:error:](v8, "fetchListWithObjectID:error:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (*a4)
  {
    +[REMLogStore write](REMLogStore, "write");
    v11 = (REMSaveRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
      -[REMStore(FamilyChecklist) deleteSharedGroceryList:error:].cold.3();
    LOBYTE(v12) = 0;
  }
  else
  {
    v11 = -[REMSaveRequest initWithStore:]([REMSaveRequest alloc], "initWithStore:", self);
    -[REMSaveRequest updateList:](v11, "updateList:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "groceryContextChangeItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "shouldCategorizeGroceryItems") & 1) != 0)
    {
      v21 = v14;
      objc_msgSend(v13, "removeFromParent");
      v12 = -[REMSaveRequest saveSynchronouslyWithError:](v11, "saveSynchronouslyWithError:", a4);
      v15 = *a4;
      +[REMLogStore write](REMLogStore, "write");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[REMStore(FamilyChecklist) deleteSharedGroceryList:error:].cold.1();

        LOBYTE(v12) = 0;
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v23 = v6;
          v24 = 1024;
          v25 = v12;
          _os_log_impl(&dword_1B4A39000, v17, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI END delete shared grocery list {sharedGroceryList: %{public}@, didSave: %i}", buf, 0x12u);
        }

        -[REMStore postFamilyAnalyticsPayloadWithOperationId:operationDetail:](self, "postFamilyAnalyticsPayloadWithOperationId:operationDetail:", CFSTR("cancelledSharedGroceryList"), 0);
      }
      v14 = v21;
    }
    else
    {
      +[REMError invalidParameterErrorWithDescription:](REMError, "invalidParameterErrorWithDescription:", CFSTR("Shared grocery list is not grocery list type."));
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v18;
      +[REMLogStore write](REMLogStore, "write");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[REMStore(FamilyChecklist) deleteSharedGroceryList:error:].cold.2();

      LOBYTE(v12) = 0;
    }

  }
  return v12;
}

- (void)postFamilyAnalyticsPayloadWithOperationId:(id)a3 operationDetail:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("operationId"));

  if (v5)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("operationDetail"));
  +[REMLog analytics](REMLog, "analytics");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = CFSTR("com.apple.reminderkit.familyChecklist");
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_DEFAULT, "Posting analytics {name: (%@, privacy: .public), payload: (%@, privacy: .public)", (uint8_t *)&v9, 0x16u);
  }

  AnalyticsSendEvent();
}

void __67__REMStore_TrialClient__requestDownloadGroceryModelAssetsFromTrial__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __67__REMStore_TrialClient__requestDownloadGroceryModelAssetsFromTrial__block_invoke_cold_1();

}

- (id)fetchCreatedOrCompletedRemindersCountForAppStoreFromDate:(id)a3 toDate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  REMAppStoreDataView *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    NSLog(CFSTR("'%s' is unexpectedly nil"), "fromDate");
    if (v10)
      goto LABEL_3;
LABEL_5:
    NSLog(CFSTR("'%s' is unexpectedly nil"), "toDate");
    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_5;
LABEL_3:
  v11 = -[REMAppStoreDataView initWithStore:]([REMAppStoreDataView alloc], "initWithStore:", self);
  -[REMAppStoreDataView fetchCreatedOrCompletedRemindersCountFromDate:toDate:error:](v11, "fetchCreatedOrCompletedRemindersCountFromDate:toDate:error:", v8, v10, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)fetchListsForEventKitBridgingWithError:(id *)a3
{
  REMEventKitBridgingDataView *v4;
  void *v5;

  v4 = -[REMEventKitBridgingDataView initWithStore:]([REMEventKitBridgingDataView alloc], "initWithStore:", self);
  -[REMEventKitBridgingDataView fetchListsWithError:](v4, "fetchListsWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fetchRemindersForEventKitBridgingWithListIDs:(id)a3 error:(id *)a4
{
  id v6;
  REMEventKitBridgingDataView *v7;
  void *v8;

  v6 = a3;
  v7 = -[REMEventKitBridgingDataView initWithStore:]([REMEventKitBridgingDataView alloc], "initWithStore:", self);
  -[REMEventKitBridgingDataView fetchRemindersWithListIDs:error:](v7, "fetchRemindersWithListIDs:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchIncompleteRemindersForEventKitBridgingWithDueDateFrom:(id)a3 to:(id)a4 withListIDs:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  REMEventKitBridgingDataView *v13;
  void *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[REMEventKitBridgingDataView initWithStore:]([REMEventKitBridgingDataView alloc], "initWithStore:", self);
  -[REMEventKitBridgingDataView fetchIncompleteRemindersWithDueDateFrom:to:withListIDs:error:](v13, "fetchIncompleteRemindersWithDueDateFrom:to:withListIDs:error:", v12, v11, v10, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)fetchCompletedRemindersForEventKitBridgingWithCompletionDateFrom:(id)a3 to:(id)a4 withListIDs:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  REMEventKitBridgingDataView *v13;
  void *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[REMEventKitBridgingDataView initWithStore:]([REMEventKitBridgingDataView alloc], "initWithStore:", self);
  -[REMEventKitBridgingDataView fetchCompletedRemindersWithCompletionDateFrom:to:withListIDs:error:](v13, "fetchCompletedRemindersWithCompletionDateFrom:to:withListIDs:error:", v12, v11, v10, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)fetchAllRemindersWithExternalIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  REMRemindersDataView *v7;
  void *v8;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "externalIdentifier");
  v7 = -[REMRemindersDataView initWithStore:]([REMRemindersDataView alloc], "initWithStore:", self);
  -[REMRemindersDataView fetchAllRemindersWithExternalIdentifier:error:](v7, "fetchAllRemindersWithExternalIdentifier:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchRemindersMatchingTitle:(id)a3 dueAfter:(id)a4 dueBefore:(id)a5 isCompleted:(id)a6 hasLocation:(id)a7 location:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  REMSiriSearchLimitedDataView *v21;
  void *v22;

  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = -[REMSiriSearchLimitedDataView initWithStore:]([REMSiriSearchLimitedDataView alloc], "initWithStore:", self);
  -[REMSiriSearchLimitedDataView fetchRemindersMatchingTitle:dueAfter:dueBefore:isCompleted:hasLocation:location:error:](v21, "fetchRemindersMatchingTitle:dueAfter:dueBefore:isCompleted:hasLocation:location:error:", v20, v19, v18, v17, v16, v15, a9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)fetchAccountWithExternalIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  REMAccountsDataView *v7;
  void *v8;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "externalIdentifier");
  v7 = -[REMAccountsDataView initWithStore:]([REMAccountsDataView alloc], "initWithStore:", self);
  -[REMAccountsDataView fetchAccountWithExternalIdentifier:error:](v7, "fetchAccountWithExternalIdentifier:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchAccountsWithExternalIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  REMAccountsDataView *v7;
  void *v8;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "externalIdentifiers");
  v7 = -[REMAccountsDataView initWithStore:]([REMAccountsDataView alloc], "initWithStore:", self);
  -[REMAccountsDataView fetchAccountsWithExternalIdentifiers:error:](v7, "fetchAccountsWithExternalIdentifiers:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchListsIncludingSpecialContainersInAccount:(id)a3 error:(id *)a4
{
  id v6;
  REMListsDataView *v7;
  void *v8;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "account");
  v7 = -[REMListsDataView initWithStore:]([REMListsDataView alloc], "initWithStore:", self);
  -[REMListsDataView fetchListsIncludingSpecialContainersInAccount:error:](v7, "fetchListsIncludingSpecialContainersInAccount:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchListIncludingSpecialContainerWithObjectID:(id)a3 error:(id *)a4
{
  id v6;
  REMListsDataView *v7;
  void *v8;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "listObjectID");
  v7 = -[REMListsDataView initWithStore:]([REMListsDataView alloc], "initWithStore:", self);
  -[REMListsDataView fetchListIncludingSpecialContainerWithObjectID:error:](v7, "fetchListIncludingSpecialContainerWithObjectID:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchReminderWithExternalIdentifier:(id)a3 inList:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  REMRemindersDataView *v13;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
    {
      objc_msgSend(v9, "fetchReminderWithExternalIdentifier:error:", v8, a5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[REMLogStore read](REMLogStore, "read");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[REMStore(CalendarDataAccess) fetchReminderWithExternalIdentifier:inList:error:].cold.1();

      v13 = -[REMRemindersDataView initWithStore:]([REMRemindersDataView alloc], "initWithStore:", self);
      -[REMRemindersDataView fetchReminderWithExternalIdentifier:inList:error:](v13, "fetchReminderWithExternalIdentifier:inList:error:", v8, 0, a5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    NSLog(CFSTR("'%s' is unexpectedly nil"), "externalIdentifier");
    v11 = 0;
  }

  return v11;
}

- (id)fetchRemindersWithExternalIdentifiers:(id)a3 inList:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  REMRemindersDataView *v13;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
    {
LABEL_3:
      objc_msgSend(v10, "fetchRemindersWithExternalIdentifiers:error:", v8, a5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  else
  {
    NSLog(CFSTR("'%s' is unexpectedly nil"), "externalIdentifiers");
    if (v10)
      goto LABEL_3;
  }
  +[REMLogStore read](REMLogStore, "read");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[REMStore(CalendarDataAccess) fetchRemindersWithExternalIdentifiers:inList:error:].cold.1();

  v13 = -[REMRemindersDataView initWithStore:]([REMRemindersDataView alloc], "initWithStore:", self);
  -[REMRemindersDataView fetchRemindersWithExternalIdentifiers:inList:error:](v13, "fetchRemindersWithExternalIdentifiers:inList:error:", v8, 0, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v11;
}

- (id)fetchReminderWithDACalendarItemUniqueIdentifier:(id)a3 inList:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  REMRemindersDataView *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  if (!v8)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "daCalendarItemUniqueIdentifier");
  v10 = -[REMRemindersDataView initWithStore:]([REMRemindersDataView alloc], "initWithStore:", self);
  -[REMRemindersDataView fetchReminderWithDACalendarItemUniqueIdentifier:inList:error:](v10, "fetchReminderWithDACalendarItemUniqueIdentifier:inList:error:", v8, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)fetchRemindersWithDACalendarItemUniqueIdentifiers:(id)a3 inList:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  REMRemindersDataView *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  if (!v8)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "daCalendarItemUniqueIdentifiers");
  v10 = -[REMRemindersDataView initWithStore:]([REMRemindersDataView alloc], "initWithStore:", self);
  -[REMRemindersDataView fetchRemindersWithDACalendarItemUniqueIdentifiers:inList:error:](v10, "fetchRemindersWithDACalendarItemUniqueIdentifiers:inList:error:", v8, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)MCIsManagedAccountWithObjectID:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "accountObjectID");
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  v25 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__REMStore_EventKitCompatibility__MCIsManagedAccountWithObjectID_error___block_invoke;
  v17[3] = &unk_1E67F85C0;
  v8 = v6;
  v18 = v8;
  v19 = &v26;
  -[REMStore _xpcSyncStorePerformerWithReason:errorHandler:](self, "_xpcSyncStorePerformerWithReason:errorHandler:", CFSTR("MCIsManagedAccountWithObjectID:"), v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __72__REMStore_EventKitCompatibility__MCIsManagedAccountWithObjectID_error___block_invoke_428;
  v13[3] = &unk_1E67F8B40;
  v10 = v8;
  v14 = v10;
  v15 = &v20;
  v16 = &v26;
  objc_msgSend(v9, "MCIsManagedAccountWithObjectID:completion:", v10, v13);
  if (a4)
    *a4 = objc_retainAutorelease((id)v27[5]);
  v11 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v11;
}

void __72__REMStore_EventKitCompatibility__MCIsManagedAccountWithObjectID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __72__REMStore_EventKitCompatibility__MCIsManagedAccountWithObjectID_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __72__REMStore_EventKitCompatibility__MCIsManagedAccountWithObjectID_error___block_invoke_428(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void **v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[REMLogStore read](REMLogStore, "read");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __72__REMStore_EventKitCompatibility__MCIsManagedAccountWithObjectID_error___block_invoke_428_cold_1();

    v9 = (void **)(*(_QWORD *)(a1[6] + 8) + 40);
    v10 = v6;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v11 = a1[4];
    v14 = 138412546;
    v15 = v11;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_INFO, "Store perform MCIsManagedAccountWithObjectID successful {account: %@, MCIsManaged: %@}", (uint8_t *)&v14, 0x16u);
  }

  if (v5)
  {
    v9 = (void **)(*(_QWORD *)(a1[5] + 8) + 40);
    v10 = v5;
LABEL_9:
    v12 = v10;
    v13 = *v9;
    *v9 = v12;

  }
}

+ (BOOL)notificationsEnabled
{
  void *v2;
  char v3;

  +[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "newAppShouldTakeoverEKReminderNotifications");

  return v3;
}

+ (BOOL)dataaccessDaemonStopSyncingReminders
{
  void *v2;
  char v3;

  +[REMUserDefaults daemonUserDefaults](REMUserDefaults, "daemonUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dataaccessDaemonStopSyncingReminders");

  return v3;
}

+ (BOOL)isEventKitSyncEnabledForReminderKit
{
  NSObject *v2;
  uint8_t v4[16];

  +[REMLogStore utility](REMLogStore, "utility");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B4A39000, v2, OS_LOG_TYPE_INFO, "EventKitSync: enabled on iOS", v4, 2u);
  }

  return 1;
}

- (id)fetchAssignmentsWithObjectIDs:(id)a3 includeConcealedObjects:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  REMAssignmentsDataViewInvocation_fetchByObjectID *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a4;
  v8 = a3;
  if (!v8)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "objectIDs");
  if (objc_msgSend(v8, "count"))
  {
    v9 = -[REMAssignmentsDataViewInvocation_fetchByObjectID initWithObjectIDs:]([REMAssignmentsDataViewInvocation_fetchByObjectID alloc], "initWithObjectIDs:", v8);
    -[REMAssignmentsDataViewInvocation_fetchByObjectID setAllowConcealedObjects:](v9, "setAllowConcealedObjects:", v6);
    -[REMStore resultFromPerformingInvocation:error:](self, "resultFromPerformingInvocation:error:", v9, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    REMDynamicCast(v11, (uint64_t)v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "assignments");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)fetchHashtagsWithObjectIDs:(id)a3 includeConcealedObjects:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  REMHashtagsDataViewInvocation_fetchByObjectID *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a4;
  v8 = a3;
  if (!v8)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "objectIDs");
  if (objc_msgSend(v8, "count"))
  {
    v9 = -[REMHashtagsDataViewInvocation_fetchByObjectID initWithObjectIDs:]([REMHashtagsDataViewInvocation_fetchByObjectID alloc], "initWithObjectIDs:", v8);
    -[REMHashtagsDataViewInvocation_fetchByObjectID setAllowConcealedObjects:](v9, "setAllowConcealedObjects:", v6);
    -[REMStore resultFromPerformingInvocation:error:](self, "resultFromPerformingInvocation:error:", v9, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    REMDynamicCast(v11, (uint64_t)v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hashtags");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)fetchAllListsWithExternalIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  REMListsDataView *v7;
  void *v8;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "externalIdentifier");
  v7 = -[REMListsDataView initWithStore:]([REMListsDataView alloc], "initWithStore:", self);
  -[REMListsDataView fetchAllListsWithExternalIdentifier:inAccount:error:](v7, "fetchAllListsWithExternalIdentifier:inAccount:error:", v6, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)updateAccountWithAccountID:(id)a3 completion:(id)a4
{
  -[REMStore updateAccountWithAccountID:restartDA:completion:](self, "updateAccountWithAccountID:restartDA:completion:", a3, 1, a4);
}

- (void)triggerSyncForDataAccessAccountsWithAccountIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[REMStore daemonController](self, "daemonController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __90__REMStore_AccountManagement_PrivateSPIs__triggerSyncForDataAccessAccountsWithAccountIDs___block_invoke;
  v7[3] = &unk_1E67F8B88;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "asyncSyncInterfacePerformerWithReason:loadHandler:errorHandler:", CFSTR("triggerSyncForDataAccessAccountsWithAccountIDs"), v7, &__block_literal_global_452);

}

void __90__REMStore_AccountManagement_PrivateSPIs__triggerSyncForDataAccessAccountsWithAccountIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1B4A39000, v4, OS_LOG_TYPE_DEFAULT, "Triggering sync for dataAccess accounts {accountIDs: %{public}@}", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(v3, "syncDataAccessAccountsWithAccountIDs:bypassThrottler:completion:", *(_QWORD *)(a1 + 32), 1, &__block_literal_global_450);
}

void __90__REMStore_AccountManagement_PrivateSPIs__triggerSyncForDataAccessAccountsWithAccountIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __90__REMStore_AccountManagement_PrivateSPIs__triggerSyncForDataAccessAccountsWithAccountIDs___block_invoke_2_cold_1();

}

- (void)triggerCloudKitOnlySyncWithReason:(id)a3 discretionary:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__REMStore_AccountManagement_Internal__triggerCloudKitOnlySyncWithReason_discretionary_completion___block_invoke;
  v10[3] = &unk_1E67F86B0;
  v11 = v8;
  v9 = v8;
  -[REMStore _triggerSyncWithReason:skipDataAccessSync:forcingCloudKitReload:discretionary:bypassThrottler:completion:](self, "_triggerSyncWithReason:skipDataAccessSync:forcingCloudKitReload:discretionary:bypassThrottler:completion:", a3, 1, 0, v5, 1, v10);

}

uint64_t __99__REMStore_AccountManagement_Internal__triggerCloudKitOnlySyncWithReason_discretionary_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateAccountsAndSync:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v6 = a4;
  -[REMStore daemonController](self, "daemonController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke;
  v12[3] = &unk_1E67F8C20;
  v14 = a3;
  v12[4] = self;
  v13 = v6;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke_2_460;
  v10[3] = &unk_1E67F86B0;
  v11 = v13;
  v9 = v13;
  objc_msgSend(v7, "asyncStorePerformerWithReason:loadHandler:errorHandler:", CFSTR("updateAccountsAndSync"), v12, v10);

}

void __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[5];
  id v6;
  char v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke_2;
  v5[3] = &unk_1E67F8BF8;
  v4 = *(id *)(a1 + 40);
  v7 = *(_BYTE *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a2, "updateAccountsAndFetchMigrationState:completion:", 1, v5);

}

void __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke_2(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  id v7;
  NSObject *v8;
  void (*v9)(void);
  void *v10;
  _QWORD v11[4];
  id v12;
  char v13;
  char v14;

  v7 = a4;
  if (v7)
  {
    +[REMLogStore write](REMLogStore, "write");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke_2_cold_1();

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (*(_BYTE *)(a1 + 48))
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke_458;
      v11[3] = &unk_1E67F8BD0;
      v10 = *(void **)(a1 + 32);
      v12 = *(id *)(a1 + 40);
      v13 = a2;
      v14 = a3;
      objc_msgSend(v10, "_triggerSyncWithReason:skipDataAccessSync:forcingCloudKitReload:discretionary:bypassThrottler:completion:", CFSTR("UpdateAccounts"), 0, a2, 0, 1, v11);

      goto LABEL_8;
    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v9();
LABEL_8:

}

uint64_t __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke_458(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41), a2);
}

void __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke_2_460(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke_2_460_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateAccountWithAccountID:(id)a3 restartDA:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  BOOL v19;

  v8 = a3;
  v9 = a5;
  -[REMStore daemonController](self, "daemonController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __88__REMStore_AccountManagement_Internal__updateAccountWithAccountID_restartDA_completion___block_invoke;
  v16[3] = &unk_1E67F8C70;
  v19 = a4;
  v17 = v8;
  v18 = v9;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __88__REMStore_AccountManagement_Internal__updateAccountWithAccountID_restartDA_completion___block_invoke_3;
  v14[3] = &unk_1E67F84E0;
  v15 = v17;
  v12 = v17;
  v13 = v9;
  objc_msgSend(v10, "asyncStorePerformerWithReason:loadHandler:errorHandler:", CFSTR("updateAccountWithAccountID"), v16, v14);

}

void __88__REMStore_AccountManagement_Internal__updateAccountWithAccountID_restartDA_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__REMStore_AccountManagement_Internal__updateAccountWithAccountID_restartDA_completion___block_invoke_2;
  v5[3] = &unk_1E67F8C48;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "updateAccountWithACAccountID:restartDA:completion:", v4, v3, v5);

}

uint64_t __88__REMStore_AccountManagement_Internal__updateAccountWithAccountID_restartDA_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__REMStore_AccountManagement_Internal__updateAccountWithAccountID_restartDA_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __88__REMStore_AccountManagement_Internal__updateAccountWithAccountID_restartDA_completion___block_invoke_3_cold_1();

}

- (void)removeOrphanedAccountsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[REMStore daemonController](self, "daemonController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__REMStore_AccountManagement_Internal__removeOrphanedAccountsWithCompletion___block_invoke;
  v7[3] = &unk_1E67F8C98;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "asyncStorePerformerWithReason:loadHandler:errorHandler:", CFSTR("removeOrphanedAccountsWithCompletion"), v7, &__block_literal_global_465);

}

void __77__REMStore_AccountManagement_Internal__removeOrphanedAccountsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__REMStore_AccountManagement_Internal__removeOrphanedAccountsWithCompletion___block_invoke_2;
  v3[3] = &unk_1E67F89A0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "removeOrphanedAccountWithCompletion:", v3);

}

uint64_t __77__REMStore_AccountManagement_Internal__removeOrphanedAccountsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__REMStore_AccountManagement_Internal__removeOrphanedAccountsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __77__REMStore_AccountManagement_Internal__removeOrphanedAccountsWithCompletion___block_invoke_3_cold_1();

}

- (void)_triggerSyncWithReason:(id)a3 skipDataAccessSync:(BOOL)a4 forcingCloudKitReload:(BOOL)a5 discretionary:(BOOL)a6 bypassThrottler:(BOOL)a7 completion:(id)a8
{
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  BOOL v26;

  v14 = a8;
  v15 = a3;
  -[REMStore daemonController](self, "daemonController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke;
  v21[3] = &unk_1E67F8D30;
  v23 = a5;
  v21[4] = v15;
  v24 = a7;
  v25 = a6;
  v26 = a4;
  v22 = v14;
  v19[0] = v17;
  v19[1] = 3221225472;
  v19[2] = __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_6;
  v19[3] = &unk_1E67F86B0;
  v20 = v22;
  v18 = v22;
  objc_msgSend(v16, "asyncSyncInterfacePerformerWithReason:loadHandler:errorHandler:", v15, v21, v19);

}

void __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD v16[4];
  NSObject *v17;
  _QWORD *v18;
  _QWORD v19[4];
  _QWORD v20[2];
  _QWORD v21[4];
  _QWORD v22[2];
  _QWORD v23[5];
  id v24;

  v3 = a2;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__1;
  v23[4] = __Block_byref_object_dispose__1;
  v24 = 0;
  v4 = dispatch_group_create();
  v5 = *(unsigned __int8 *)(a1 + 48);
  dispatch_group_enter(v4);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v8 = *(unsigned __int8 *)(a1 + 49);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_2;
    v21[3] = &unk_1E67F8CE0;
    v22[1] = v23;
    v22[0] = v4;
    objc_msgSend(v3, "restartCloudKitSyncWithReason:bypassThrottler:completion:", v6, v8, v21);
    v9 = (id *)v22;
  }
  else
  {
    v10 = *(unsigned __int8 *)(a1 + 50);
    v11 = *(unsigned __int8 *)(a1 + 49);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_3;
    v19[3] = &unk_1E67F8CE0;
    v20[1] = v23;
    v20[0] = v4;
    objc_msgSend(v3, "syncCloudKitWithReason:discretionary:bypassThrottler:completion:", v6, v10, v11, v19);
    v9 = (id *)v20;
  }

  if (!*(_BYTE *)(a1 + 51))
  {
    dispatch_group_enter(v4);
    v12 = *(unsigned __int8 *)(a1 + 49);
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_4;
    v16[3] = &unk_1E67F8CE0;
    v18 = v23;
    v17 = v4;
    objc_msgSend(v3, "syncDataAccessAccountsWithAccountIDs:bypassThrottler:completion:", MEMORY[0x1E0C9AA60], v12, v16);

  }
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_5;
  v13[3] = &unk_1E67F8D08;
  v14 = *(id *)(a1 + 40);
  v15 = v23;
  dispatch_group_notify(v4, MEMORY[0x1E0C80D38], v13);

  _Block_object_dispose(v23, 8);
}

void __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_6_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestToMergeLocalDataIntoSyncDataWithAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[REMStore daemonController](self, "daemonController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __108__REMStore_AccountManagement_Internal__requestToMergeLocalDataIntoSyncDataWithAccountIdentifier_completion___block_invoke;
  v14[3] = &unk_1E67F8908;
  v15 = v6;
  v16 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __108__REMStore_AccountManagement_Internal__requestToMergeLocalDataIntoSyncDataWithAccountIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E67F84E0;
  v13 = v15;
  v10 = v15;
  v11 = v7;
  objc_msgSend(v8, "asyncStorePerformerWithReason:loadHandler:errorHandler:", CFSTR("requestToMergeLocalDataIntoSyncData"), v14, v12);

}

void __108__REMStore_AccountManagement_Internal__requestToMergeLocalDataIntoSyncDataWithAccountIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __108__REMStore_AccountManagement_Internal__requestToMergeLocalDataIntoSyncDataWithAccountIdentifier_completion___block_invoke_2;
  v4[3] = &unk_1E67F86B0;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "requestToMergeLocalDataIntoSyncDataWithAccountIdentifier:completion:", v3, v4);

}

uint64_t __108__REMStore_AccountManagement_Internal__requestToMergeLocalDataIntoSyncDataWithAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __108__REMStore_AccountManagement_Internal__requestToMergeLocalDataIntoSyncDataWithAccountIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __108__REMStore_AccountManagement_Internal__requestToMergeLocalDataIntoSyncDataWithAccountIdentifier_completion___block_invoke_3_cold_1();

}

- (void)requestToDeleteSyncDataWithAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[REMStore daemonController](self, "daemonController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __96__REMStore_AccountManagement_Internal__requestToDeleteSyncDataWithAccountIdentifier_completion___block_invoke;
  v14[3] = &unk_1E67F8908;
  v15 = v6;
  v16 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __96__REMStore_AccountManagement_Internal__requestToDeleteSyncDataWithAccountIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E67F84E0;
  v13 = v15;
  v10 = v15;
  v11 = v7;
  objc_msgSend(v8, "asyncStorePerformerWithReason:loadHandler:errorHandler:", CFSTR("requestToDeleteSyncData"), v14, v12);

}

void __96__REMStore_AccountManagement_Internal__requestToDeleteSyncDataWithAccountIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __96__REMStore_AccountManagement_Internal__requestToDeleteSyncDataWithAccountIdentifier_completion___block_invoke_2;
  v4[3] = &unk_1E67F86B0;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "requestToDeleteSyncDataWithAccountIdentifier:completion:", v3, v4);

}

uint64_t __96__REMStore_AccountManagement_Internal__requestToDeleteSyncDataWithAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __96__REMStore_AccountManagement_Internal__requestToDeleteSyncDataWithAccountIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __96__REMStore_AccountManagement_Internal__requestToDeleteSyncDataWithAccountIdentifier_completion___block_invoke_3_cold_1();

}

- (void)requestToDeleteLocalDataWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[REMStore daemonController](self, "daemonController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__REMStore_AccountManagement_Internal__requestToDeleteLocalDataWithCompletion___block_invoke;
  v7[3] = &unk_1E67F8C98;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "asyncStorePerformerWithReason:loadHandler:errorHandler:", CFSTR("requestToDeleteLocalData"), v7, &__block_literal_global_472);

}

void __79__REMStore_AccountManagement_Internal__requestToDeleteLocalDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__REMStore_AccountManagement_Internal__requestToDeleteLocalDataWithCompletion___block_invoke_2;
  v3[3] = &unk_1E67F86B0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "requestToDeleteLocalDataWithCompletion:", v3);

}

uint64_t __79__REMStore_AccountManagement_Internal__requestToDeleteLocalDataWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__REMStore_AccountManagement_Internal__requestToDeleteLocalDataWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __79__REMStore_AccountManagement_Internal__requestToDeleteLocalDataWithCompletion___block_invoke_3_cold_1();

}

- (id)fetchTemplateWithObjectID:(id)a3 error:(id *)a4
{
  id v6;
  REMTemplatesDataView *v7;
  void *v8;

  v6 = a3;
  v7 = -[REMTemplatesDataView initWithStore:]([REMTemplatesDataView alloc], "initWithStore:", self);
  -[REMTemplatesDataView fetchTemplateWithObjectID:error:](v7, "fetchTemplateWithObjectID:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchListRepresentationOfTemplateWithObjectID:(id)a3 error:(id *)a4
{
  id v6;
  REMListsDataView *v7;
  void *v8;

  v6 = a3;
  v7 = -[REMListsDataView initWithStore:]([REMListsDataView alloc], "initWithStore:", self);
  -[REMListsDataView fetchListRepresentationOfTemplateWithObjectID:error:](v7, "fetchListRepresentationOfTemplateWithObjectID:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)addCKShareObserverIfNeededForAccountID:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke;
  v24[3] = &unk_1E67F8700;
  v25 = v9;
  v26 = v10;
  v12 = v10;
  v13 = v9;
  v14 = (void *)MEMORY[0x1B5E3E098](v24);
  -[REMStore daemonController](self, "daemonController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke_3;
  v21[3] = &unk_1E67F8908;
  v22 = v8;
  v23 = v14;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke_5;
  v18[3] = &unk_1E67F8700;
  v19 = v22;
  v20 = v23;
  v16 = v23;
  v17 = v22;
  objc_msgSend(v15, "asyncStorePerformerWithReason:loadHandler:errorHandler:", CFSTR("addCKShareObserverIfNeededForAccountID"), v21, v18);

}

void __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke_2;
  v7[3] = &unk_1E67F8868;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke_4;
  v4[3] = &unk_1E67F86B0;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "addCKShareObserverIfNeededForAccountID:completion:", v3, v4);

}

uint64_t __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke_5_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)replicaManagerProviderForCalDAVSync
{
  return -[_REMDACalDAVSyncReplicaManagerProvider initWithStore:]([_REMDACalDAVSyncReplicaManagerProvider alloc], "initWithStore:", self);
}

void __105__REMStore_ClientConnections__requestToUpdateClientConnectionsAsynchronously_shouldKeepAlive_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __105__REMStore_ClientConnections__requestToUpdateClientConnectionsAsynchronously_shouldKeepAlive_completion___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __105__REMStore_ClientConnections__requestToUpdateClientConnectionsAsynchronously_shouldKeepAlive_completion___block_invoke_552(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __105__REMStore_ClientConnections__requestToUpdateClientConnectionsAsynchronously_shouldKeepAlive_completion___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (id)repairPhantomObjectsWithObjectIDs:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[4];
  id v15;
  __int128 *p_buf;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[REMLogStore write](REMLogStore, "write");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1B4A39000, v7, OS_LOG_TYPE_DEFAULT, "repairPhantomObjectsWithObjectIDs: Invoked with {objectIDs: %{public}@}", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v22 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__REMStore_PhantomObjectRepairing__repairPhantomObjectsWithObjectIDs_error___block_invoke;
  v14[3] = &unk_1E67F85C0;
  v9 = v6;
  v15 = v9;
  p_buf = &buf;
  -[REMStore _xpcSyncStorePerformerWithReason:errorHandler:](self, "_xpcSyncStorePerformerWithReason:errorHandler:", CFSTR("repairPhantomObjectsWithObjectIDs"), v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __76__REMStore_PhantomObjectRepairing__repairPhantomObjectsWithObjectIDs_error___block_invoke_560;
  v13[3] = &unk_1E67F8DF0;
  v13[4] = &buf;
  v13[5] = &v17;
  objc_msgSend(v10, "validatePhantomObjectsWith:shouldRepair:completion:", v9, 1, v13);
  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&buf, 8);

  return v11;
}

void __76__REMStore_PhantomObjectRepairing__repairPhantomObjectsWithObjectIDs_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__REMStore_PhantomObjectRepairing__repairPhantomObjectsWithObjectIDs_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __76__REMStore_PhantomObjectRepairing__repairPhantomObjectsWithObjectIDs_error___block_invoke_560(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[REMLogStore write](REMLogStore, "write");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __76__REMStore_PhantomObjectRepairing__repairPhantomObjectsWithObjectIDs_error___block_invoke_560_cold_1((uint64_t)v6, (uint64_t)v5, v7);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }
  +[REMLogStore write](REMLogStore, "write");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 138543362;
    v12 = v5;
    _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_INFO, "repairPhantomObjectsWithObjectIDs successful {result: %{public}@}", (uint8_t *)&v11, 0xCu);
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (id)debugFetchPhantomListsWithError:(id *)a3
{
  REMListsDataView *v4;
  void *v5;

  v4 = -[REMListsDataView initWithStore:]([REMListsDataView alloc], "initWithStore:", self);
  -[REMListsDataView debugFetchPhantomListsWithError:](v4, "debugFetchPhantomListsWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)test_setupForManualHashtagLabelRefreshing
{
  void *v2;
  id v3;

  -[REMStore daemonController](self, "daemonController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncDebugPerformerWithReason:errorHandler:", CFSTR("test_setupForManualHashtagLabelRefreshing"), &__block_literal_global_568);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setupManualHashtagLabelUpdater");
}

void __63__REMStore_UnitTest__test_setupForManualHashtagLabelRefreshing__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__REMStore_nukeDatabase__block_invoke_cold_1();

}

- (void)test_refreshHashtagLabelsImmediately
{
  void *v2;
  id v3;

  -[REMStore daemonController](self, "daemonController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncDebugPerformerWithReason:errorHandler:", CFSTR("test_refreshHashtagLabelsImmediately"), &__block_literal_global_571);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "refreshHashtagLabelsImmediately");
}

void __58__REMStore_UnitTest__test_refreshHashtagLabelsImmediately__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__REMStore_nukeDatabase__block_invoke_cold_1();

}

- (void)test_handleIncompleteTemplateOperationQueueItemsImmediately
{
  void *v2;
  id v3;

  -[REMStore daemonController](self, "daemonController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncDebugPerformerWithReason:errorHandler:", CFSTR("test_handleIncompleteTemplateOperationQueueItemsImmediately"), &__block_literal_global_574);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "handleIncompleteTemplateOperationQueueItemsImmediately");
}

void __81__REMStore_UnitTest__test_handleIncompleteTemplateOperationQueueItemsImmediately__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__REMStore_nukeDatabase__block_invoke_cold_1();

}

- (void)test_handleIncompleteGroceryOperationQueueItemsImmediatelyWithTimeout:(double)a3
{
  void *v4;
  id v5;

  -[REMStore daemonController](self, "daemonController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncDebugPerformerWithReason:errorHandler:", CFSTR("test_handleIncompleteGroceryOperationQueueItemsImmediately"), &__block_literal_global_577);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "handleIncompleteGroceryOperationQueueItemsImmediatelyWithTimeout:", a3);
}

void __92__REMStore_UnitTest__test_handleIncompleteGroceryOperationQueueItemsImmediatelyWithTimeout___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__REMStore_nukeDatabase__block_invoke_cold_1();

}

- (id)test_immediatelyCreateOrUpdatePublicLinkOfTemplateWithTemplateObjectID:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  -[REMStore daemonController](self, "daemonController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "syncDebugPerformerWithReason:errorHandler:", CFSTR("test_immediatelyCreateOrUpdatePublicLinkOfTemplate"), &__block_literal_global_580);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __113__REMStore_UnitTest__test_immediatelyCreateOrUpdatePublicLinkOfTemplateWithTemplateObjectID_configuration_error___block_invoke_581;
  v15[3] = &unk_1E67F8EB8;
  v15[4] = &v22;
  v15[5] = &v16;
  objc_msgSend(v11, "immediatelyCreateOrUpdatePublicLinkOfTemplateWithTemplateObjectID:configuration:completion:", v8, v9, v15);
  if (a5)
  {
    v12 = (void *)v17[5];
    if (v12)
      *a5 = objc_retainAutorelease(v12);
  }
  v13 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __113__REMStore_UnitTest__test_immediatelyCreateOrUpdatePublicLinkOfTemplateWithTemplateObjectID_configuration_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__REMStore_nukeDatabase__block_invoke_cold_1();

}

void __113__REMStore_UnitTest__test_immediatelyCreateOrUpdatePublicLinkOfTemplateWithTemplateObjectID_configuration_error___block_invoke_581(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)test_immediatelyRevokePublicLinkOfTemplateWithTemplateObjectID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  -[REMStore daemonController](self, "daemonController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncDebugPerformerWithReason:errorHandler:", CFSTR("test_immediatelyRevokePublicLinkOfTemplate"), &__block_literal_global_585);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91__REMStore_UnitTest__test_immediatelyRevokePublicLinkOfTemplateWithTemplateObjectID_error___block_invoke_586;
  v12[3] = &unk_1E67F8F00;
  v12[4] = &v19;
  v12[5] = &v13;
  objc_msgSend(v8, "immediatelyRevokePublicLinkOfTemplateWithTemplateObjectID:completion:", v6, v12);
  if (a4)
  {
    v9 = (void *)v14[5];
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
  v10 = (id)v20[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __91__REMStore_UnitTest__test_immediatelyRevokePublicLinkOfTemplateWithTemplateObjectID_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __24__REMStore_nukeDatabase__block_invoke_cold_1();

}

void __91__REMStore_UnitTest__test_immediatelyRevokePublicLinkOfTemplateWithTemplateObjectID_error___block_invoke_586(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (BOOL)test_revertImageAttachmentsToUnDeduped:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  -[REMStore daemonController](self, "daemonController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncDebugPerformerWithReason:errorHandler:", CFSTR("test_revertImageAttachmentsToUnDeduped"), &__block_literal_global_590);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__REMStore_UnitTest__test_revertImageAttachmentsToUnDeduped_error___block_invoke_591;
  v13[3] = &unk_1E67F8490;
  v13[4] = &v14;
  objc_msgSend(v8, "synchronous_revertImageAttachmentsToUnDeduped:completion:", v6, v13);
  v9 = v15;
  if (a4)
  {
    v10 = (void *)v15[5];
    if (v10)
    {
      *a4 = objc_retainAutorelease(v10);
      v9 = v15;
    }
  }
  v11 = v9[5] == 0;
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __67__REMStore_UnitTest__test_revertImageAttachmentsToUnDeduped_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __67__REMStore_UnitTest__test_revertImageAttachmentsToUnDeduped_error___block_invoke_cold_1();

}

void __67__REMStore_UnitTest__test_revertImageAttachmentsToUnDeduped_error___block_invoke_591(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)fetchListSectionsWithObjectIDs:(id)a3 error:(id *)a4
{
  id v6;
  REMListSectionsDataView *v7;
  void *v8;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "sectionObjectIDs");
  v7 = -[REMListSectionsDataView initWithStore:]([REMListSectionsDataView alloc], "initWithStore:", self);
  -[REMListSectionsDataView fetchListSectionsWithObjectIDs:error:](v7, "fetchListSectionsWithObjectIDs:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchListSectionWithObjectID:(id)a3 error:(id *)a4
{
  id v6;
  REMListSectionsDataView *v7;
  void *v8;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
  v7 = -[REMListSectionsDataView initWithStore:]([REMListSectionsDataView alloc], "initWithStore:", self);
  -[REMListSectionsDataView fetchListSectionWithObjectID:error:](v7, "fetchListSectionWithObjectID:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchListSectionsForListSectionContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  REMListSectionsDataView *v8;
  void *v9;
  void *v10;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "listSectionContext");
  objc_msgSend(v6, "list");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "listSectionContext.list");
  v8 = -[REMListSectionsDataView initWithStore:]([REMListSectionsDataView alloc], "initWithStore:", self);
  objc_msgSend(v6, "list");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListSectionsDataView fetchListSectionsInList:error:](v8, "fetchListSectionsInList:error:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)fetchListSectionsForListSectionContextChangeItem:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  REMListSectionsDataView *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(v6, "listChangeItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "listSectionContextChangeItem.listChangeItem.objectID");
  v9 = -[REMListSectionsDataView initWithStore:]([REMListSectionsDataView alloc], "initWithStore:", self);
  objc_msgSend(v6, "listChangeItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListSectionsDataView fetchListSectionsWithListObjectID:error:](v9, "fetchListSectionsWithListObjectID:error:", v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)fetchListSectionsWithListObjectID:(id)a3 error:(id *)a4
{
  id v6;
  REMListSectionsDataView *v7;
  void *v8;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "listObjectID");
  v7 = -[REMListSectionsDataView initWithStore:]([REMListSectionsDataView alloc], "initWithStore:", self);
  -[REMListSectionsDataView fetchListSectionsWithListObjectID:error:](v7, "fetchListSectionsWithListObjectID:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchListSectionsCountWithListObjectID:(id)a3 error:(id *)a4
{
  id v6;
  REMListSectionsDataView *v7;
  void *v8;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "listObjectID");
  v7 = -[REMListSectionsDataView initWithStore:]([REMListSectionsDataView alloc], "initWithStore:", self);
  -[REMListSectionsDataView fetchListSectionsCountWithListObjectID:error:](v7, "fetchListSectionsCountWithListObjectID:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchSmartListSectionsWithObjectIDs:(id)a3 error:(id *)a4
{
  id v6;
  REMSmartListSectionsDataView *v7;
  void *v8;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "sectionObjectIDs");
  v7 = -[REMSmartListSectionsDataView initWithStore:]([REMSmartListSectionsDataView alloc], "initWithStore:", self);
  -[REMSmartListSectionsDataView fetchSmartListSectionsWithObjectIDs:error:](v7, "fetchSmartListSectionsWithObjectIDs:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchSmartListSectionWithObjectID:(id)a3 error:(id *)a4
{
  id v6;
  REMSmartListSectionsDataView *v7;
  void *v8;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
  v7 = -[REMSmartListSectionsDataView initWithStore:]([REMSmartListSectionsDataView alloc], "initWithStore:", self);
  -[REMSmartListSectionsDataView fetchSmartListSectionWithObjectID:error:](v7, "fetchSmartListSectionWithObjectID:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchSmartListSectionsForSmartListSectionContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  REMSmartListSectionsDataView *v8;
  void *v9;
  void *v10;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "smartListSectionContext");
  objc_msgSend(v6, "smartList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "smartListSectionContext.smartList");
  v8 = -[REMSmartListSectionsDataView initWithStore:]([REMSmartListSectionsDataView alloc], "initWithStore:", self);
  objc_msgSend(v6, "smartList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSmartListSectionsDataView fetchSmartListSectionsInSmartList:error:](v8, "fetchSmartListSectionsInSmartList:error:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)fetchTemplateSectionsWithObjectIDs:(id)a3 error:(id *)a4
{
  id v6;
  REMTemplateSectionsDataView *v7;
  void *v8;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "sectionObjectIDs");
  v7 = -[REMTemplateSectionsDataView initWithStore:]([REMTemplateSectionsDataView alloc], "initWithStore:", self);
  -[REMTemplateSectionsDataView fetchTemplateSectionsWithObjectIDs:error:](v7, "fetchTemplateSectionsWithObjectIDs:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchTemplateSectionWithObjectID:(id)a3 error:(id *)a4
{
  id v6;
  REMTemplateSectionsDataView *v7;
  void *v8;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
  v7 = -[REMTemplateSectionsDataView initWithStore:]([REMTemplateSectionsDataView alloc], "initWithStore:", self);
  -[REMTemplateSectionsDataView fetchTemplateSectionWithObjectID:error:](v7, "fetchTemplateSectionWithObjectID:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchTemplateSectionsForTemplateSectionContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  REMTemplateSectionsDataView *v8;
  void *v9;
  void *v10;

  v6 = a3;
  if (!v6)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "templateSectionContext");
  objc_msgSend(v6, "parentTemplate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "templateSectionContext.parentTemplate");
  v8 = -[REMTemplateSectionsDataView initWithStore:]([REMTemplateSectionsDataView alloc], "initWithStore:", self);
  objc_msgSend(v6, "parentTemplate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTemplateSectionsDataView fetchTemplateSectionsInTemplate:error:](v8, "fetchTemplateSectionsInTemplate:error:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __50__REMStore_createIsolatedStoreContainerWithError___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "Failed to create isolated store container {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __57__REMStore_destroyIsolatedStoreContainerWithToken_error___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "Failed to destroy isolated store container {error: %@, token: %@}");
  OUTLINED_FUNCTION_3_1();
}

void __57__REMStore_destroyIsolatedStoreContainerWithToken_error___block_invoke_25_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "XPC error trying to call destroyIsolatedStoreContainerWithToken {xpcError: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __24__REMStore_nukeDatabase__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "xpc error while using debug performer {error :%@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __50__REMStore_fetchReplicaManagerForAccountID_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "XPC error while fetching replica manager {error: %@, account: %@}");
  OUTLINED_FUNCTION_3_1();
}

void __50__REMStore_fetchReplicaManagerForAccountID_error___block_invoke_56_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "Store replica manager fetch failed {error: %@, account: %@}");
  OUTLINED_FUNCTION_3_1();
}

void __60__REMStore_fetchReplicaManagersForAccountID_bundleID_error___block_invoke_60_cold_1()
{
  NSObject *v0;
  uint8_t v1[40];

  OUTLINED_FUNCTION_31(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_8_0(&dword_1B4A39000, v0, (uint64_t)v0, "Store replica manager fetch failed {error: %@, account: %@, bundleID: %@}", v1);
  OUTLINED_FUNCTION_17();
}

void __238__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_error___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "XPC error while saving {error: %{public}@, store: %@}");
  OUTLINED_FUNCTION_3_1();
}

void __53__REMStore_fetchResultByExecutingFetchRequest_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "XPC error while executing fetchRequest {error: %@, fetchRequest: %@}");
  OUTLINED_FUNCTION_3_1();
}

void __53__REMStore_fetchResultByExecutingFetchRequest_error___block_invoke_71_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, a1, a3, "Failed to get fetchResult or error from fetchRequest {fetchRequest: %@}", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_1();
}

void __53__REMStore_fetchResultByExecutingFetchRequest_error___block_invoke_71_cold_2()
{
  NSObject *v0;
  uint8_t v1[40];

  OUTLINED_FUNCTION_31(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_8_0(&dword_1B4A39000, v0, (uint64_t)v0, "Store failed to execute fetchRequest {error: %@, fetchRequest: %@, store: %@}", v1);
  OUTLINED_FUNCTION_17();
}

void __49__REMStore_resultFromPerformingInvocation_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_12();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_4_0(&dword_1B4A39000, v0, v3, "FETCH END ERROR_XPC {name: %{public}@, error: %{public}@}", v4);

  OUTLINED_FUNCTION_1_1();
}

void __49__REMStore_resultFromPerformingInvocation_error___block_invoke_75_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_12();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_4_0(&dword_1B4A39000, v0, v3, "FETCH END ERROR {name: %{public}@, error: %{public}@}", v4);

  OUTLINED_FUNCTION_1_1();
}

void __78__REMStore_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_12();
  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(v1 + 48);
  objc_msgSend(*(id *)(v1 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 134218498;
  v6 = v2;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8_0(&dword_1B4A39000, v0, v4, "FETCH END ERROR_XPC {invocationCounter: %ld, name: %{public}@, error: %{public}@}", (uint8_t *)&v5);

  OUTLINED_FUNCTION_1();
}

void __78__REMStore_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_79_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_12();
  v12 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(v2 + 56);
  objc_msgSend(*(id *)(v2 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218498;
  v7 = v3;
  v8 = 2114;
  v9 = v4;
  v10 = 2112;
  v11 = v1;
  OUTLINED_FUNCTION_8_0(&dword_1B4A39000, v0, v5, "FETCH END ERROR {invocationCounter: %ld, name: %{public}@, error: %@}", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1();
}

void __43__REMStore_enumerateAllRemindersWithBlock___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_0(&dword_1B4A39000, a3, v5, "Unexpected error when fetching all reminders from list {list: %@, error: %@}", v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)_enumerateAllListsIncludingGroups:(void *)a1 withBlock:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_ERROR, "Unexpected error when fetching all accounts: %@", v4, 0xCu);

  OUTLINED_FUNCTION_17();
}

void __58__REMStore__xpcSyncStorePerformerWithReason_errorHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "xpc error while using xpcPerformer {error: %{public}@, store: %@}");
  OUTLINED_FUNCTION_3_1();
}

- (void)_addChangeItemChangedKeys:objectID:toChangedKeysMap:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_1B4A39000, v0, OS_LOG_TYPE_FAULT, "(client) Unexpected duplicate change item on objects with the same objectID {objectID: %{public}@}", v1, 0xCu);
  OUTLINED_FUNCTION_3_1();
}

- (void)_saveAccountChangeItems:(os_log_t)log listChangeItems:listSectionChangeItems:smartListChangeItems:smartListSectionChangeItems:templateChangeItems:templateSectionChangeItems:reminderChangeItems:author:replicaManagerProvider:synchronously:syncToCloudKit:performer:completion:.cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_1B4A39000, log, OS_LOG_TYPE_FAULT, "A template should be modified using 'REMTemplateChangeItem' instead of 'REMListChangeItem'", buf, 2u);
}

void __271__REMStore__saveAccountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_synchronously_syncToCloudKit_performer_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "(client) SAVE FAIL {error: %{public}@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __42__REMStore_fetchShareForListWithID_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "XPC error while fetching share for list {error: %@, list: %@}");
  OUTLINED_FUNCTION_3_1();
}

void __42__REMStore_fetchShareForListWithID_error___block_invoke_93_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "Store fetch share failed {error: %@, account: %@}");
  OUTLINED_FUNCTION_3_1();
}

void __55__REMStore_createShareForListWithID_appIconData_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "XPC error while creating share for list {error: %@, list: %@}");
  OUTLINED_FUNCTION_3_1();
}

void __55__REMStore_createShareForListWithID_appIconData_error___block_invoke_97_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "Store create share failed {error: %@, account: %@}");
  OUTLINED_FUNCTION_3_1();
}

void __51__REMStore_updateShare_accountID_queue_completion___block_invoke_5_cold_1()
{
  NSObject *v0;
  uint8_t v1[40];

  OUTLINED_FUNCTION_31(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_8_0(&dword_1B4A39000, v0, (uint64_t)v0, "XPC error while updating share {error: %@, share: %@, accountID: %{public}@}", v1);
  OUTLINED_FUNCTION_17();
}

void __49__REMStore_stopShare_accountID_queue_completion___block_invoke_5_cold_1()
{
  NSObject *v0;
  uint8_t v1[40];

  OUTLINED_FUNCTION_31(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_8_0(&dword_1B4A39000, v0, (uint64_t)v0, "XPC error while stopping share {error: %@, share: %@, accountID: %{public}@}", v1);
  OUTLINED_FUNCTION_17();
}

void __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke_5_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "XPC error while accepting share {error: %@, metadata: %@}");
  OUTLINED_FUNCTION_3_1();
}

void __65__REMStore_compressedDistributedEvaluationDataWithOptions_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "XPC error while fetching store performer {error: %{public}@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __65__REMStore_compressedDistributedEvaluationDataWithOptions_error___block_invoke_108_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_2(&dword_1B4A39000, v0, v1, "DistributedEvaluation Export produced no result and no error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __65__REMStore_compressedDistributedEvaluationDataWithOptions_error___block_invoke_108_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "DistributedEvaluation Export ERROR {error: %{public}@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __55__REMStore_anchoredBubbleCloudOverridesWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "XPC error while querying iCloud configuration for Suggested Attributes harvesting parameters {error: %{public}@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __64__REMStore_fetchMinimumSearchTermLengthByBaseLanguageWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "XPC error while querying iCloud configuration for minimumSearchTermLengthByBaseLanguage {error: %{public}@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __64__REMStore_fetchMinimumSearchTermLengthByBaseLanguageWithError___block_invoke_121_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "Fetch minimumSearchTermLengthByBaseLanguage failed {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_cold_1()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_30();
  objc_msgSend((id)OUTLINED_FUNCTION_28(v2), "objectID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_27(), "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4_0(&dword_1B4A39000, v0, v5, "Given invitation list has no external identifier {invitationList: %@, account: %@}", v6);

  OUTLINED_FUNCTION_1_1();
}

void __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_cold_2()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_30();
  objc_msgSend((id)OUTLINED_FUNCTION_28(v2), "objectID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_27(), "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4_0(&dword_1B4A39000, v0, v5, "Could not find the external identifier from the given invitation list {invitationList: %@, account: %@}", v6);

  OUTLINED_FUNCTION_1_1();
}

void __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_cold_3()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_30();
  objc_msgSend((id)OUTLINED_FUNCTION_28(v2), "objectID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_27(), "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4_0(&dword_1B4A39000, v0, v5, "Given invitation list isn't a sharing invitation {invitationList: %@, account: %@}", v6);

  OUTLINED_FUNCTION_1_1();
}

void __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_cold_4()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_30();
  objc_msgSend((id)OUTLINED_FUNCTION_28(v2), "objectID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_27(), "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4_0(&dword_1B4A39000, v0, v5, "Given invitation list isn't a CalDAV list {invitationList: %@, account: %@}", v6);

  OUTLINED_FUNCTION_1_1();
}

void __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_278_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a2 + 32), "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_0(&dword_1B4A39000, a3, v5, "XPC error while accepting CalDAV share {error: %@, invitationList: %@}", v6);

  OUTLINED_FUNCTION_1_1();
}

void __83__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople_force_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "Failed to notify of interaction {error: %@, people: %@}");
  OUTLINED_FUNCTION_3_1();
}

void __83__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople_force_completion___block_invoke_311_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "XPC error while notifying of interaction {error: %@, people: %@}");
  OUTLINED_FUNCTION_3_1();
}

void __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_357_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "FamilyChecklistSPI CloudKit error fetching participants for shared grocery list %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_360_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "FamilyChecklistSPI CloudKit error modifying record to add participants to shared grocery list %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_366_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "FamilyChecklistSPI error syncing shared grocery list participants %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __67__REMStore_TrialClient__requestDownloadGroceryModelAssetsFromTrial__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "XPC error while request downloading grocery model assets from trial {error: %{public}@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __72__REMStore_EventKitCompatibility__MCIsManagedAccountWithObjectID_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "XPC error while trying to perform MCIsManagedAccountWithObjectID {error: %@, account: %@}");
  OUTLINED_FUNCTION_3_1();
}

void __72__REMStore_EventKitCompatibility__MCIsManagedAccountWithObjectID_error___block_invoke_428_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "Store perform MCIsManagedAccountWithObjectID failed {error: %@, account: %@}");
  OUTLINED_FUNCTION_3_1();
}

void __90__REMStore_AccountManagement_PrivateSPIs__triggerSyncForDataAccessAccountsWithAccountIDs___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "XPC error while syncing {error: %{public}@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "Error updating account. Not Triggering sync {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke_2_460_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "XPC error while updating accounts {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __88__REMStore_AccountManagement_Internal__updateAccountWithAccountID_restartDA_completion___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "XPC error while updating account {error: %@, accountID: %@}");
  OUTLINED_FUNCTION_3_1();
}

void __77__REMStore_AccountManagement_Internal__removeOrphanedAccountsWithCompletion___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "XPC error while removing orphaned accounts {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_6_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "XPC error while syncing {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __108__REMStore_AccountManagement_Internal__requestToMergeLocalDataIntoSyncDataWithAccountIdentifier_completion___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "XPC error while requesting to initiate merge local data to sync data {accountIdentifier: %@, error: %@}");
  OUTLINED_FUNCTION_3_1();
}

void __96__REMStore_AccountManagement_Internal__requestToDeleteSyncDataWithAccountIdentifier_completion___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "XPC error while requesting to delete sync data {accountIdentifier: %@, error: %@}");
  OUTLINED_FUNCTION_3_1();
}

void __79__REMStore_AccountManagement_Internal__requestToDeleteLocalDataWithCompletion___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "XPC error while requesting to delete local data {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke_5_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "XPC error while adding share observer {error: %@, accountID: %{public}@}");
  OUTLINED_FUNCTION_3_1();
}

void __105__REMStore_ClientConnections__requestToUpdateClientConnectionsAsynchronously_shouldKeepAlive_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;

  objc_msgSend((id)OUTLINED_FUNCTION_32(), "numberWithBool:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v3 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 41));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v6;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8_0(&dword_1B4A39000, a3, v8, "XPC error while requesting to update client connections {isAsynchronous: %@, shouldKeepAlive: %@, error: %@}", (uint8_t *)&v9);

  OUTLINED_FUNCTION_6();
}

void __76__REMStore_PhantomObjectRepairing__repairPhantomObjectsWithObjectIDs_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, v0, v1, "XPC error while getting store performer for repairPhantomObjectsWithObjectIDs {error: %@, objectIDs: %{public}@}");
  OUTLINED_FUNCTION_3_1();
}

void __76__REMStore_PhantomObjectRepairing__repairPhantomObjectsWithObjectIDs_error___block_invoke_560_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_3(&dword_1B4A39000, a2, a3, "repairPhantomObjectsWithObjectIDs failed {error: %@, phantomObjectIDs: %{public}@}", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_3_1();
}

void __67__REMStore_UnitTest__test_revertImageAttachmentsToUnDeduped_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "xpc error while using debug performer {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

@end
