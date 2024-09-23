@implementation REMSuggestedAttributesPerformer

- (REMSuggestedAttributesPerformer)initWithQueue:(id)a3 store:(id)a4
{
  id v7;
  id v8;
  REMSuggestedAttributesPerformer *v9;
  REMSuggestedAttributesPerformer *v10;
  uint64_t v11;
  REMStore *store;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REMSuggestedAttributesPerformer;
  v9 = -[REMSuggestedAttributesPerformer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_msgSend(v8, "nonUserInteractiveStore");
    v11 = objc_claimAutoreleasedReturnValue();
    store = v10->_store;
    v10->_store = (REMStore *)v11;

  }
  return v10;
}

- (void)preWarmModels
{
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  -[REMSuggestedAttributesPerformer queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__REMSuggestedAttributesPerformer_preWarmModels__block_invoke;
  v5[3] = &unk_1E67F84E0;
  v6 = 0;
  -[REMSuggestedAttributesPerformer q_syncSuggestedAttributesPerformerWithReason:errorHandler:](self, "q_syncSuggestedAttributesPerformerWithReason:errorHandler:", CFSTR("preWarmModels"), v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preWarmModels");

}

void __48__REMSuggestedAttributesPerformer_preWarmModels__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  +[REMLogStore utility](REMLogStore, "utility");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __48__REMSuggestedAttributesPerformer_preWarmModels__block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

}

- (id)resultFromPerformingSwiftInvocation:(id)a3 parametersData:(id)a4 storages:(id)a5 error:(id *)a6
{
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  os_signpost_id_t spid;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  uint64_t *v46;
  uint64_t *v47;
  _QWORD v48[4];
  id v49;
  uint64_t *v50;
  os_activity_scope_state_s state;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v42 = a4;
  v43 = a5;
  -[REMSuggestedAttributesPerformer queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__7;
  v62 = __Block_byref_object_dispose__7;
  v63 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__7;
  v56 = __Block_byref_object_dispose__7;
  v57 = 0;
  v12 = _os_activity_create(&dword_1B4A39000, "REMSuggestedAttributesPerformer swiftInvocation", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  +[REMSignpost database](REMSignpost, "database");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_generate(v13);
  v15 = v13;
  v16 = v15;
  spid = v14;
  v17 = v14 - 1;
  if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    objc_msgSend(v10, "name");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = objc_msgSend(v18, "cStringUsingEncoding:", 1);
    *(_DWORD *)buf = 136446210;
    v65 = v19;
    _os_signpost_emit_with_name_impl(&dword_1B4A39000, v16, OS_SIGNPOST_INTERVAL_BEGIN, spid, "REMStore.invocation", " enableTelemetry=YES Name=%{public, signpost.telemetry:string1, Name=InvocationName}s}d", buf, 0xCu);

  }
  +[REMLogStore read](REMLogStore, "read");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v42, "length");
    v23 = objc_msgSend(v43, "count");
    *(_DWORD *)buf = 138543874;
    v65 = (uint64_t)v21;
    v66 = 2048;
    v67 = v22;
    v68 = 2048;
    v69 = v23;
    _os_log_impl(&dword_1B4A39000, v20, OS_LOG_TYPE_DEFAULT, "INVOCATION START {name: %{public}@, parametersData.length %ld, storages.count: %ld}", buf, 0x20u);

  }
  v24 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "name");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("swInv_%@"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v12;
  v28 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __101__REMSuggestedAttributesPerformer_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke;
  v48[3] = &unk_1E67F85C0;
  v29 = v10;
  v49 = v29;
  v50 = &v58;
  -[REMSuggestedAttributesPerformer q_syncSuggestedAttributesPerformerWithReason:errorHandler:](self, "q_syncSuggestedAttributesPerformerWithReason:errorHandler:", v26, v48);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v28;
  v44[1] = 3221225472;
  v44[2] = __101__REMSuggestedAttributesPerformer_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_6;
  v44[3] = &unk_1E67F98A0;
  v31 = v29;
  v45 = v31;
  v46 = &v52;
  v47 = &v58;
  objc_msgSend(v30, "performSwiftInvocation:withParametersData:storages:completion:", v31, v42, v43, v44);
  v32 = v27;
  if (a6)
    *a6 = objc_retainAutorelease((id)v59[5]);
  v33 = v16;
  v34 = v33;
  if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    objc_msgSend((id)v53[5], "resultStorages");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");
    objc_msgSend((id)v53[5], "resultData");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "length");
    *(_DWORD *)buf = 134349312;
    v65 = v36;
    v66 = 2050;
    v67 = v38;
    _os_signpost_emit_with_name_impl(&dword_1B4A39000, v34, OS_SIGNPOST_INTERVAL_END, spid, "REMStore.invocation", " enableTelemetry=YES ResultCount=%{public, signpost.telemetry:number1, Name:ResultCount}ld DataSize=%{public, signpost.telemetry:number2, Name:DataSize}ld", buf, 0x16u);

  }
  v39 = (id)v53[5];

  os_activity_scope_leave(&state);
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(&v58, 8);
  return v39;
}

void __101__REMSuggestedAttributesPerformer_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  +[REMLogStore xpc](REMLogStore, "xpc");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __101__REMSuggestedAttributesPerformer_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_cold_1(a1);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __101__REMSuggestedAttributesPerformer_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void **v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[REMLogStore read](REMLogStore, "read");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __101__REMSuggestedAttributesPerformer_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_6_cold_1(a1);

    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v10 = v6;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resultData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");
      objc_msgSend(v5, "resultStorages");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v11;
      v19 = 2048;
      v20 = v13;
      v21 = 2048;
      v22 = objc_msgSend(v14, "count");
      _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_DEFAULT, "INVOCATION END {name: %{public}@, result.data.length: %ld, result.storages.count: %ld}", (uint8_t *)&v17, 0x20u);

    }
    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = v5;
  }
  v15 = v10;
  v16 = *v9;
  *v9 = v15;

}

- (id)q_syncSuggestedAttributesPerformerWithReason:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  -[REMSuggestedAttributesPerformer q_cachedXPCPerformer](self, "q_cachedXPCPerformer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_initWeak(&location, self);
    -[REMSuggestedAttributesPerformer q_resolveSuggestedAttributesPerformerWithReason:errorHandler:](self, "q_resolveSuggestedAttributesPerformerWithReason:errorHandler:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EF10E3A8))
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __93__REMSuggestedAttributesPerformer_q_syncSuggestedAttributesPerformerWithReason_errorHandler___block_invoke;
      v16[3] = &unk_1E67F98F0;
      objc_copyWeak(&v17, &location);
      objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSuggestedAttributesPerformer setQ_cachedXPCPerformer:](self, "setQ_cachedXPCPerformer:", v10);

      objc_destroyWeak(&v17);
    }
    else
    {
      -[REMSuggestedAttributesPerformer setQ_cachedXPCPerformer:](self, "setQ_cachedXPCPerformer:", v9);
    }

    objc_destroyWeak(&location);
  }
  -[REMSuggestedAttributesPerformer q_cachedXPCPerformer](self, "q_cachedXPCPerformer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EF10E3A8))
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __93__REMSuggestedAttributesPerformer_q_syncSuggestedAttributesPerformerWithReason_errorHandler___block_invoke_14;
    v14[3] = &unk_1E67F86B0;
    v15 = v7;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = v11;
  }

  return v12;
}

void __93__REMSuggestedAttributesPerformer_q_syncSuggestedAttributesPerformerWithReason_errorHandler___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__REMSuggestedAttributesPerformer_q_syncSuggestedAttributesPerformerWithReason_errorHandler___block_invoke_2;
    block[3] = &unk_1E67F98C8;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);

    objc_destroyWeak(&v6);
  }

}

void __93__REMSuggestedAttributesPerformer_q_syncSuggestedAttributesPerformerWithReason_errorHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  +[REMLogStore utility](REMLogStore, "utility");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B4A39000, v2, OS_LOG_TYPE_DEFAULT, "suggestedAttributesPerformer invalidated. Dropping cache", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setQ_cachedXPCPerformer:", 0);

}

uint64_t __93__REMSuggestedAttributesPerformer_q_syncSuggestedAttributesPerformerWithReason_errorHandler___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)q_resolveSuggestedAttributesPerformerWithReason:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  uint8_t *v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  +[REMLogStore utility](REMLogStore, "utility");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_DEFAULT, "Cache-miss getting suggestedAttributesPerformer. Resolving.", buf, 2u);
  }

  -[REMSuggestedAttributesPerformer store](self, "store");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "daemonController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("suggestedAttributesPerformer-%@"), v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "syncStorePerformerWithReason:errorHandler:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    *(_QWORD *)buf = 0;
    v20 = buf;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__7;
    v23 = __Block_byref_object_dispose__7;
    v24 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __96__REMSuggestedAttributesPerformer_q_resolveSuggestedAttributesPerformerWithReason_errorHandler___block_invoke;
    v16[3] = &unk_1E67F9918;
    v18 = buf;
    v17 = v7;
    objc_msgSend(v12, "uncachedSuggestedAttributesPerformerWithReason:completion:", v11, v16);
    v13 = *((id *)v20 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    +[REMLogStore utility](REMLogStore, "utility");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[REMSuggestedAttributesPerformer q_resolveSuggestedAttributesPerformerWithReason:errorHandler:].cold.1();

    v13 = 0;
  }

  return v13;
}

void __96__REMSuggestedAttributesPerformer_q_resolveSuggestedAttributesPerformerWithReason_errorHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    +[REMLogStore utility](REMLogStore, "utility");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __96__REMSuggestedAttributesPerformer_q_resolveSuggestedAttributesPerformerWithReason_errorHandler___block_invoke_cold_2();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    +[REMLogStore xpc](REMLogStore, "xpc");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __96__REMSuggestedAttributesPerformer_q_resolveSuggestedAttributesPerformerWithReason_errorHandler___block_invoke_cold_1(v9);

    v10 = *(_QWORD *)(a1 + 32);
    +[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", CFSTR("uncachedSuggestedAttributesPerfomer produced no result and no error"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  }
}

- (REMStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (REMXPCSuggestedAttributesPerformer)q_cachedXPCPerformer
{
  return self->_q_cachedXPCPerformer;
}

- (void)setQ_cachedXPCPerformer:(id)a3
{
  objc_storeStrong((id *)&self->_q_cachedXPCPerformer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_q_cachedXPCPerformer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

void __48__REMSuggestedAttributesPerformer_preWarmModels__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, a2, a3, "XPC error performing suggestedAttributesPerformer.preWarmModel {error: %{public}@}", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_1();
}

void __101__REMSuggestedAttributesPerformer_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v2, v3, "INVOCATION END ERROR_XPC {name: %{public}@, error: %{public}@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

void __101__REMSuggestedAttributesPerformer_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_6_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v2, v3, "INVOCATION END ERROR {name: %{public}@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)q_resolveSuggestedAttributesPerformerWithReason:errorHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "Failed to get storePerformer for suggestedAttributesPerformer. {action: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

void __96__REMSuggestedAttributesPerformer_q_resolveSuggestedAttributesPerformerWithReason_errorHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B4A39000, log, OS_LOG_TYPE_FAULT, "uncachedSuggestedAttributesPerfomer produced no result and no error", v1, 2u);
}

void __96__REMSuggestedAttributesPerformer_q_resolveSuggestedAttributesPerformerWithReason_errorHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "uncachedSuggestedAttributesPerfomer ERROR {error: %{public}@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

@end
