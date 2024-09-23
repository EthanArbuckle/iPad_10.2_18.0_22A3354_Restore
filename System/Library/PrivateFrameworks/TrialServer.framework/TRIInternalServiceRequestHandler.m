@implementation TRIInternalServiceRequestHandler

- (TRIInternalServiceRequestHandler)initWithPromise:(id)a3 auditToken:(id *)a4 entitlementWitness:(id)a5
{
  id v10;
  id v11;
  TRIInternalServiceRequestHandler *v12;
  TRIInternalServiceRequestHandler *v13;
  __int128 v14;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCInternalService.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("promise"));

  }
  v17.receiver = self;
  v17.super_class = (Class)TRIInternalServiceRequestHandler;
  v12 = -[TRIInternalServiceRequestHandler init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_promise, a3);
    v14 = *(_OWORD *)a4->var0;
    *(_OWORD *)&v13->_auditToken.val[4] = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)v13->_auditToken.val = v14;
    objc_storeStrong((id *)&v13->_entitlementWitness, a5);
  }

  return v13;
}

- (void)taskRecordsWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  TRIXPCServerContextPromise *promise;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__TRIInternalServiceRequestHandler_taskRecordsWithCompletion___block_invoke;
  v13[3] = &unk_1E9330738;
  v13[4] = self;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v13);
  v6[2](v6, 0);
  promise = self->_promise;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __62__TRIInternalServiceRequestHandler_taskRecordsWithCompletion___block_invoke_22;
  v10[3] = &unk_1E9330788;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](promise, "addBlockToExecuteAfterPromiseFullfillment:", v10);

}

void __62__TRIInternalServiceRequestHandler_taskRecordsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  _DWORD v11[2];
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = "end";
    v11[0] = 67109890;
    v11[1] = v5;
    if (!a2)
      v10 = "begin";
    v12 = 2114;
    v13 = v7;
    v14 = 2048;
    v15 = v9;
    v16 = 2080;
    v17 = v10;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s taskRecordsWithCompletion:", (uint8_t *)v11, 0x26u);

  }
}

void __62__TRIInternalServiceRequestHandler_taskRecordsWithCompletion___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__TRIInternalServiceRequestHandler_taskRecordsWithCompletion___block_invoke_2;
  v12[3] = &unk_1E9330760;
  v13 = *(id *)(a1 + 32);
  v7 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v12);
  if (v5 && v6)
  {
    objc_msgSend(v5, "taskDatabase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allTasks");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 40);
    if (!v11)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v10);
  }

LABEL_7:
  if (v7)
    v7[2](v7);

}

uint64_t __62__TRIInternalServiceRequestHandler_taskRecordsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)experimentNotificationsWithExperimentId:(id)a3 cloudKitContainer:(int)a4 teamId:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void (**v17)(_QWORD, _QWORD);
  TRIXPCServerContextPromise *promise;
  id v19;
  id v20;
  void (**v21)(_QWORD, _QWORD);
  id v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  int v31;
  _QWORD v32[5];
  id v33;
  int v34;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0DC0A18], "applicationBundleIdentifierFromSelf");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCInternalService.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("trialdBundleId"));

  }
  v15 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __112__TRIInternalServiceRequestHandler_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_completion___block_invoke;
  v32[3] = &unk_1E93307B0;
  v32[4] = self;
  v16 = v11;
  v33 = v16;
  v34 = a4;
  v17 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v32);
  v17[2](v17, 0);
  promise = self->_promise;
  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = __112__TRIInternalServiceRequestHandler_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_completion___block_invoke_29;
  v25[3] = &unk_1E9330828;
  v29 = v13;
  v30 = v17;
  v31 = a4;
  v26 = v16;
  v27 = v12;
  v28 = v14;
  v19 = v14;
  v20 = v12;
  v21 = v17;
  v22 = v16;
  v23 = v13;
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](promise, "addBlockToExecuteAfterPromiseFullfillment:", v25);

}

void __112__TRIInternalServiceRequestHandler_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _DWORD v13[2];
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = "end";
    else
      v8 = "begin";
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    TRICloudKitSupport_Container_EnumDescriptor();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textFormatNameForValue:", *(unsigned int *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = 67110402;
    v13[1] = v5;
    v14 = 2114;
    v15 = v7;
    v16 = 2048;
    v17 = v9;
    v18 = 2080;
    v19 = v8;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s experimentNotificationsWithExperimentId:%@ cloudKitContainer:%@ completion:", (uint8_t *)v13, 0x3Au);

  }
}

void __112__TRIInternalServiceRequestHandler_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_completion___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  TRIFetchOptions *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __112__TRIInternalServiceRequestHandler_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_completion___block_invoke_2;
    v25[3] = &unk_1E93307D8;
    v26 = *(id *)(a1 + 56);
    v8 = MEMORY[0x1D8232C48](v25);
    v9 = (void *)v8;
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(v5, "keyValueStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRIFetchDateManager managerWithKeyValueStore:](TRIFetchDateManager, "managerWithKeyValueStore:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "namespaceDatabase");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "paths");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "namespaceDescriptorsDefaultDir");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:](TRINamespaceDescriptorProvider, "providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:", v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      +[TRICKNativeArtifactProvider providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:](TRICKNativeArtifactProvider, "providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:", *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v11, v15, v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0A10]), "initWithAllowsCellular:discretionaryBehavior:", 0, 0);
      v18 = -[TRIFetchOptions initWithDownloadOptions:cacheDeleteAvailableSpaceClass:]([TRIFetchOptions alloc], "initWithDownloadOptions:cacheDeleteAvailableSpaceClass:", v17, &unk_1E93639F0);
      v19 = *(_QWORD *)(a1 + 32);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __112__TRIInternalServiceRequestHandler_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_completion___block_invoke_40;
      v22[3] = &unk_1E9330800;
      v23 = *(id *)(a1 + 56);
      v24 = *(id *)(a1 + 64);
      objc_msgSend(v16, "fetchExperimentWithLatestDeploymentForExperimentId:options:completion:", v19, v18, v22);

    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, const __CFString *))(v8 + 16))(v8, 2, CFSTR("ExperimentId must not be nil"));
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
  else
  {
    v20 = *(_QWORD *)(a1 + 56);
    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v20 + 16))(v20, 0, v21);

    }
  }

}

void __112__TRIInternalServiceRequestHandler_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = (objc_class *)MEMORY[0x1E0CB35C8];
    v6 = a3;
    v7 = [v5 alloc];
    v10 = *MEMORY[0x1E0CB2D50];
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a2, v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __112__TRIInternalServiceRequestHandler_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_completion___block_invoke_40(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  TRILogCategory_Server();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "experiment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v12;
    _os_log_debug_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEBUG, "got artifact from CloudKit with experiment %{public}@", buf, 0xCu);

  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    v13 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v8);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, id))(v10 + 16))(*(_QWORD *)(a1 + 32), 0, v8);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)rolloutNotificationWithLatestDeploymentForRolloutId:(id)a3 cloudKitContainer:(int)a4 teamId:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void (**v17)(_QWORD, _QWORD);
  TRIXPCServerContextPromise *promise;
  id v19;
  id v20;
  void (**v21)(_QWORD, _QWORD);
  id v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  int v31;
  _QWORD v32[5];
  id v33;
  int v34;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0DC0A18], "applicationBundleIdentifierFromSelf");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCInternalService.m"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("trialdBundleId"));

  }
  v15 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __124__TRIInternalServiceRequestHandler_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_completion___block_invoke;
  v32[3] = &unk_1E93307B0;
  v32[4] = self;
  v16 = v11;
  v33 = v16;
  v34 = a4;
  v17 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v32);
  v17[2](v17, 0);
  promise = self->_promise;
  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = __124__TRIInternalServiceRequestHandler_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_completion___block_invoke_43;
  v25[3] = &unk_1E9330828;
  v29 = v13;
  v30 = v17;
  v31 = a4;
  v26 = v16;
  v27 = v12;
  v28 = v14;
  v19 = v14;
  v20 = v12;
  v21 = v17;
  v22 = v16;
  v23 = v13;
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](promise, "addBlockToExecuteAfterPromiseFullfillment:", v25);

}

void __124__TRIInternalServiceRequestHandler_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _DWORD v13[2];
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = "end";
    else
      v8 = "begin";
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    TRICloudKitSupport_Container_EnumDescriptor();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textFormatNameForValue:", *(unsigned int *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = 67110402;
    v13[1] = v5;
    v14 = 2114;
    v15 = v7;
    v16 = 2048;
    v17 = v9;
    v18 = 2080;
    v19 = v8;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s rolloutNotificationsWithLatestDeploymentForRolloutId:%@ cloudKitContainer:%@ completion:", (uint8_t *)v13, 0x3Au);

  }
}

void __124__TRIInternalServiceRequestHandler_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_completion___block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  TRIFetchOptions *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  os_signpost_id_t v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __124__TRIInternalServiceRequestHandler_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_completion___block_invoke_2;
    v32[3] = &unk_1E93307D8;
    v33 = *(id *)(a1 + 56);
    v8 = MEMORY[0x1D8232C48](v32);
    v9 = (void *)v8;
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(v5, "keyValueStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRIFetchDateManager managerWithKeyValueStore:](TRIFetchDateManager, "managerWithKeyValueStore:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "namespaceDatabase");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "paths");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "namespaceDescriptorsDefaultDir");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:](TRINamespaceDescriptorProvider, "providerWithNamespaceDatabase:defaultDescriptorDirectoryPath:", v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void *)v11;
      +[TRICKNativeArtifactProvider providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:](TRICKNativeArtifactProvider, "providerForContainer:teamId:bundleId:dateProvider:namespaceDescriptorProvider:serverContext:", *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v11, v15, v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0A10]), "initWithAllowsCellular:discretionaryBehavior:", 0, 0);
      v18 = -[TRIFetchOptions initWithDownloadOptions:cacheDeleteAvailableSpaceClass:]([TRIFetchOptions alloc], "initWithDownloadOptions:cacheDeleteAvailableSpaceClass:", v17, &unk_1E9363A08);
      TRILogCategory_Server();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_signpost_id_generate(v19);

      TRILogCategory_Server();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        v23 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v35 = v23;
        _os_signpost_emit_with_name_impl(&dword_1D207F000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "FetchRolloutNotificationWithLatestDeployment", "r: %{public}@", buf, 0xCu);
      }

      v24 = *(_QWORD *)(a1 + 32);
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __124__TRIInternalServiceRequestHandler_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_completion___block_invoke_47;
      v28[3] = &unk_1E9330850;
      v29 = *(id *)(a1 + 56);
      v30 = *(id *)(a1 + 64);
      v31 = v20;
      objc_msgSend(v16, "fetchRolloutNotificationWithLatestDeploymentForRolloutId:options:completion:", v24, v18, v28);

    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, const __CFString *))(v8 + 16))(v8, 2, CFSTR("Parameter \"rolloutId\" must not be nil."));
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
  else
  {
    v25 = *(_QWORD *)(a1 + 56);
    if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v25 + 16))(v25, 0, v26);

    }
  }

}

void __124__TRIInternalServiceRequestHandler_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = (objc_class *)MEMORY[0x1E0CB35C8];
    v6 = a3;
    v7 = [v5 alloc];
    v10 = *MEMORY[0x1E0CB2D50];
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a2, v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __124__TRIInternalServiceRequestHandler_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_completion___block_invoke_47(_QWORD *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  TRILogCategory_Server();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "deployment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shortDesc");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v16;
    _os_log_debug_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEBUG, "Downloaded artifact from CloudKit for rollout %{public}@", (uint8_t *)&v17, 0xCu);

  }
  (*(void (**)(void))(a1[4] + 16))();

  (*(void (**)(void))(a1[5] + 16))();
  TRILogCategory_Server();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = a1[6];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    objc_msgSend(v7, "deployment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shortDesc");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v14;
    _os_signpost_emit_with_name_impl(&dword_1D207F000, v11, OS_SIGNPOST_INTERVAL_END, v12, "FetchRolloutNotificationWithLatestDeployment", "r: %{public}@", (uint8_t *)&v17, 0xCu);

  }
}

- (void)submitTask:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  TRIXPCServerContextPromise *promise;
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD);
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __66__TRIInternalServiceRequestHandler_submitTask_options_completion___block_invoke;
  v25[3] = &unk_1E9330878;
  v25[4] = self;
  v12 = v8;
  v26 = v12;
  v13 = v9;
  v27 = v13;
  v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v25);
  v14[2](v14, 0);
  promise = self->_promise;
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __66__TRIInternalServiceRequestHandler_submitTask_options_completion___block_invoke_49;
  v20[3] = &unk_1E93308A0;
  v23 = v10;
  v24 = v14;
  v21 = v12;
  v22 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v14;
  v19 = v10;
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](promise, "addBlockToExecuteAfterPromiseFullfillment:", v20);

}

void __66__TRIInternalServiceRequestHandler_submitTask_options_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD v13[2];
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1[4] + 44);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = "end";
    v10 = a1[4];
    v11 = a1[5];
    v12 = a1[6];
    if (!a2)
      v9 = "begin";
    v13[0] = 67110402;
    v13[1] = v5;
    v14 = 2114;
    v15 = v7;
    v16 = 2048;
    v17 = v10;
    v18 = 2080;
    v19 = v9;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s submitTask:%@ options:%@ completion:", (uint8_t *)v13, 0x3Au);

  }
}

void __66__TRIInternalServiceRequestHandler_submitTask_options_completion___block_invoke_49(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  char v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  id v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __66__TRIInternalServiceRequestHandler_submitTask_options_completion___block_invoke_2;
    v24 = &unk_1E9330760;
    v25 = *(id *)(a1 + 56);
    v8 = (void (**)(_QWORD))MEMORY[0x1D8232C48](&v21);
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      v10 = objc_msgSend(v7, "addTask:options:", v9, *(_QWORD *)(a1 + 40), v21, v22, v23, v24);
      v11 = -[TRIRunningXPCActivityDescriptor initForImmediateWorkWithCapabilities:]([TRIRunningXPCActivityDescriptor alloc], "initForImmediateWorkWithCapabilities:", 11);
      objc_msgSend(v7, "resumeWithXPCActivityDescriptor:executeWhenSuspended:", v11, 0);

      if (v10 == 2)
      {
        v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = *MEMORY[0x1E0CB2D50];
        v27 = CFSTR("Unable to add task.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 13, v13);

      }
      else
      {
        v14 = 0;
      }
      v20 = *(_QWORD *)(a1 + 48);
      if (v20)
        (*(void (**)(uint64_t, BOOL, void *))(v20 + 16))(v20, v10 != 2, v14);
    }
    else
    {
      v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v28 = *MEMORY[0x1E0CB2D50];
      v29[0] = CFSTR("Task parameter cannot be nil.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1, v21, v22, v23, v24);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v18);

      v19 = *(_QWORD *)(a1 + 48);
      if (v19)
        (*(void (**)(uint64_t, _QWORD, void *))(v19 + 16))(v19, 0, v14);
    }

    if (v8)
      v8[2](v8);

  }
  else
  {
    v15 = *(_QWORD *)(a1 + 48);
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v16);

    }
  }

}

uint64_t __66__TRIInternalServiceRequestHandler_submitTask_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)lastFetchDateForContainer:(int)a3 teamId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  TRIXPCServerContextPromise *promise;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  int v21;
  _QWORD v22[5];
  id v23;
  int v24;

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __80__TRIInternalServiceRequestHandler_lastFetchDateForContainer_teamId_completion___block_invoke;
  v22[3] = &unk_1E93307B0;
  v22[4] = self;
  v24 = a3;
  v11 = v8;
  v23 = v11;
  v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v22);
  v12[2](v12, 0);
  promise = self->_promise;
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __80__TRIInternalServiceRequestHandler_lastFetchDateForContainer_teamId_completion___block_invoke_55;
  v17[3] = &unk_1E93308C8;
  v19 = v9;
  v20 = v12;
  v21 = a3;
  v18 = v11;
  v14 = v11;
  v15 = v12;
  v16 = v9;
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](promise, "addBlockToExecuteAfterPromiseFullfillment:", v17);

}

void __80__TRIInternalServiceRequestHandler_lastFetchDateForContainer_teamId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _DWORD v13[2];
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    if (a2)
      v9 = "end";
    else
      v9 = "begin";
    TRICloudKitSupport_Container_EnumDescriptor();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enumNameForValue:", *(unsigned int *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    v13[0] = 67110402;
    v13[1] = v5;
    v14 = 2114;
    v15 = v7;
    v16 = 2048;
    v17 = v8;
    v18 = 2080;
    v19 = v9;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s lastFetchDateForContainer:%@ teamId:%@ completion:", (uint8_t *)v13, 0x3Au);

  }
}

void __80__TRIInternalServiceRequestHandler_lastFetchDateForContainer_teamId_completion___block_invoke_55(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __80__TRIInternalServiceRequestHandler_lastFetchDateForContainer_teamId_completion___block_invoke_2;
    v19 = &unk_1E9330760;
    v20 = *(id *)(a1 + 48);
    v8 = (void (**)(_QWORD))MEMORY[0x1D8232C48](&v16);
    if (*(_QWORD *)(a1 + 40))
    {
      if (TRICloudKitSupport_Container_IsValidValue() && *(_DWORD *)(a1 + 56))
      {
        objc_msgSend(v5, "keyValueStore", v16, v17, v18, v19);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[TRIFetchDateManager managerWithKeyValueStore:](TRIFetchDateManager, "managerWithKeyValueStore:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "lastFetchDateWithType:container:teamId:", 0, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 32));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      }
      else
      {
        v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v21 = *MEMORY[0x1E0CB2D50];
        v22[0] = CFSTR("Container value is unsupported.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1, v16, v17, v18, v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v14, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v15);

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }

    }
    if (v8)
      v8[2](v8);

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

    }
  }

}

uint64_t __80__TRIInternalServiceRequestHandler_lastFetchDateForContainer_teamId_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setLastFetchDate:(id)a3 forContainer:(int)a4 teamId:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  void (**v16)(_QWORD, _QWORD);
  TRIXPCServerContextPromise *promise;
  id v18;
  id v19;
  void (**v20)(_QWORD, _QWORD);
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  int v27;
  _QWORD v28[5];
  id v29;
  id v30;
  int v31;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __84__TRIInternalServiceRequestHandler_setLastFetchDate_forContainer_teamId_completion___block_invoke;
  v28[3] = &unk_1E93308F0;
  v28[4] = self;
  v14 = v10;
  v29 = v14;
  v31 = a4;
  v15 = v11;
  v30 = v15;
  v16 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v28);
  v16[2](v16, 0);
  promise = self->_promise;
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __84__TRIInternalServiceRequestHandler_setLastFetchDate_forContainer_teamId_completion___block_invoke_58;
  v22[3] = &unk_1E9330918;
  v25 = v12;
  v26 = v16;
  v27 = a4;
  v23 = v14;
  v24 = v15;
  v18 = v15;
  v19 = v14;
  v20 = v16;
  v21 = v12;
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](promise, "addBlockToExecuteAfterPromiseFullfillment:", v22);

}

void __84__TRIInternalServiceRequestHandler_setLastFetchDate_forContainer_teamId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _DWORD v14[2];
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = "end";
    else
      v8 = "begin";
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    TRICloudKitSupport_Container_EnumDescriptor();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "enumNameForValue:", *(unsigned int *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 48);
    v14[0] = 67110658;
    v14[1] = v5;
    v15 = 2114;
    v16 = v7;
    v17 = 2048;
    v18 = v9;
    v19 = 2080;
    v20 = v8;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v12;
    v25 = 2114;
    v26 = v13;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s setLastFetchDate:%@ forContainer:%@ teamId:%{public}@ completion:", (uint8_t *)v14, 0x44u);

  }
}

void __84__TRIInternalServiceRequestHandler_setLastFetchDate_forContainer_teamId_completion___block_invoke_58(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __84__TRIInternalServiceRequestHandler_setLastFetchDate_forContainer_teamId_completion___block_invoke_2;
    v22 = &unk_1E9330760;
    v23 = *(id *)(a1 + 56);
    v8 = (void (**)(_QWORD))MEMORY[0x1D8232C48](&v19);
    if (*(_QWORD *)(a1 + 32))
    {
      if (TRICloudKitSupport_Container_IsValidValue() && *(_DWORD *)(a1 + 64))
      {
        objc_msgSend(v5, "keyValueStore", v19, v20, v21, v22);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[TRIFetchDateManager managerWithKeyValueStore:](TRIFetchDateManager, "managerWithKeyValueStore:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "setLastFetchDate:type:container:teamId:", *(_QWORD *)(a1 + 32), 0, *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 40));
        v11 = *(_QWORD *)(a1 + 48);
        if (v11)
          (*(void (**)(uint64_t, uint64_t, _QWORD))(v11 + 16))(v11, 1, 0);
        goto LABEL_14;
      }
      v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v24 = *MEMORY[0x1E0CB2D50];
      v25 = CFSTR("Container value is unsupported.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1, v19, v20, v21, v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v14, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v15);

      v16 = *(_QWORD *)(a1 + 48);
      if (v16)
        goto LABEL_13;
    }
    else
    {
      v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v26 = *MEMORY[0x1E0CB2D50];
      v27[0] = CFSTR("Date parameter must be non-nil.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1, v19, v20, v21, v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v18);

      v16 = *(_QWORD *)(a1 + 48);
      if (v16)
LABEL_13:
        (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v10);
    }
LABEL_14:

    if (v8)
      v8[2](v8);

    goto LABEL_17;
  }
  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
LABEL_17:

}

uint64_t __84__TRIInternalServiceRequestHandler_setLastFetchDate_forContainer_teamId_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setFailureInjectionDelegate:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  TRIXPCServerContextPromise *promise;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__TRIInternalServiceRequestHandler_setFailureInjectionDelegate___block_invoke;
  v14[3] = &unk_1E9330940;
  v14[4] = self;
  v6 = v4;
  v15 = v6;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v14);
  v7[2](v7, 0);
  promise = self->_promise;
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __64__TRIInternalServiceRequestHandler_setFailureInjectionDelegate___block_invoke_61;
  v11[3] = &unk_1E9330968;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](promise, "addBlockToExecuteAfterPromiseFullfillment:", v11);

}

void __64__TRIInternalServiceRequestHandler_setFailureInjectionDelegate___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD v12[2];
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = "end";
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12[0] = 67110146;
    if (!a2)
      v9 = "begin";
    v12[1] = v5;
    v13 = 2114;
    v14 = v7;
    v15 = 2048;
    v16 = v10;
    v17 = 2080;
    v18 = v9;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s setFailureInjectionDelegate: %@", (uint8_t *)v12, 0x30u);

  }
}

void __64__TRIInternalServiceRequestHandler_setFailureInjectionDelegate___block_invoke_61(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD);
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__TRIInternalServiceRequestHandler_setFailureInjectionDelegate___block_invoke_2;
    v9[3] = &unk_1E9330760;
    v10 = *(id *)(a1 + 40);
    v8 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v9);
    objc_msgSend(v5, "setFailureInjectionDelegate:", *(_QWORD *)(a1 + 32));
    if (v8)
      v8[2](v8);

  }
}

uint64_t __64__TRIInternalServiceRequestHandler_setFailureInjectionDelegate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)suspendSQLiteCKDatabaseQueueWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  TRIXPCServerContextPromise *promise;
  void (**v8)(_QWORD, _QWORD);
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__TRIInternalServiceRequestHandler_suspendSQLiteCKDatabaseQueueWithCompletion___block_invoke;
  v13[3] = &unk_1E9330738;
  v13[4] = self;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v13);
  v6[2](v6, 0);
  promise = self->_promise;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __79__TRIInternalServiceRequestHandler_suspendSQLiteCKDatabaseQueueWithCompletion___block_invoke_62;
  v10[3] = &unk_1E9330788;
  v11 = v4;
  v12 = v6;
  v8 = v6;
  v9 = v4;
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](promise, "addBlockToExecuteAfterPromiseFullfillment:", v10);

}

void __79__TRIInternalServiceRequestHandler_suspendSQLiteCKDatabaseQueueWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  _DWORD v11[2];
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = "end";
    v11[0] = 67109890;
    v11[1] = v5;
    if (!a2)
      v10 = "begin";
    v12 = 2114;
    v13 = v7;
    v14 = 2048;
    v15 = v9;
    v16 = 2080;
    v17 = v10;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s suspendSQLiteCKDatabaseQueueWithCompletion:", (uint8_t *)v11, 0x26u);

  }
}

void __79__TRIInternalServiceRequestHandler_suspendSQLiteCKDatabaseQueueWithCompletion___block_invoke_62(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD);
  void *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79__TRIInternalServiceRequestHandler_suspendSQLiteCKDatabaseQueueWithCompletion___block_invoke_2;
    v12[3] = &unk_1E9330760;
    v13 = *(id *)(a1 + 40);
    v8 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v12);
    if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
    {
      objc_msgSend(v5, "ensureFakeCKDatabase");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "operationQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      dispatch_suspend(v10);

    }
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      (*(void (**)(void))(v11 + 16))();
    if (v8)
      v8[2](v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __79__TRIInternalServiceRequestHandler_suspendSQLiteCKDatabaseQueueWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)resumeSQLiteCKDatabaseQueueWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  TRIXPCServerContextPromise *promise;
  void (**v8)(_QWORD, _QWORD);
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__TRIInternalServiceRequestHandler_resumeSQLiteCKDatabaseQueueWithCompletion___block_invoke;
  v13[3] = &unk_1E9330738;
  v13[4] = self;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v13);
  v6[2](v6, 0);
  promise = self->_promise;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __78__TRIInternalServiceRequestHandler_resumeSQLiteCKDatabaseQueueWithCompletion___block_invoke_64;
  v10[3] = &unk_1E9330788;
  v11 = v4;
  v12 = v6;
  v8 = v6;
  v9 = v4;
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](promise, "addBlockToExecuteAfterPromiseFullfillment:", v10);

}

void __78__TRIInternalServiceRequestHandler_resumeSQLiteCKDatabaseQueueWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  _DWORD v11[2];
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = "end";
    v11[0] = 67109890;
    v11[1] = v5;
    if (!a2)
      v10 = "begin";
    v12 = 2114;
    v13 = v7;
    v14 = 2048;
    v15 = v9;
    v16 = 2080;
    v17 = v10;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s resumeSQLiteCKDatabaseQueueWithCompletion:", (uint8_t *)v11, 0x26u);

  }
}

void __78__TRIInternalServiceRequestHandler_resumeSQLiteCKDatabaseQueueWithCompletion___block_invoke_64(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD);
  void *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __78__TRIInternalServiceRequestHandler_resumeSQLiteCKDatabaseQueueWithCompletion___block_invoke_2;
    v12[3] = &unk_1E9330760;
    v13 = *(id *)(a1 + 40);
    v8 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v12);
    if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
    {
      objc_msgSend(v5, "ensureFakeCKDatabase");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "operationQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      dispatch_resume(v10);

    }
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      (*(void (**)(void))(v11 + 16))();
    if (v8)
      v8[2](v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __78__TRIInternalServiceRequestHandler_resumeSQLiteCKDatabaseQueueWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeUnusedChannelsWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  TRIXPCServerContextPromise *promise;
  void (**v8)(_QWORD, _QWORD);
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__TRIInternalServiceRequestHandler_removeUnusedChannelsWithCompletion___block_invoke;
  v13[3] = &unk_1E9330738;
  v13[4] = self;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v13);
  v6[2](v6, 0);
  promise = self->_promise;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __71__TRIInternalServiceRequestHandler_removeUnusedChannelsWithCompletion___block_invoke_65;
  v10[3] = &unk_1E9330788;
  v11 = v4;
  v12 = v6;
  v8 = v6;
  v9 = v4;
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](promise, "addBlockToExecuteAfterPromiseFullfillment:", v10);

}

void __71__TRIInternalServiceRequestHandler_removeUnusedChannelsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  _DWORD v11[2];
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = "end";
    v11[0] = 67109890;
    v11[1] = v5;
    if (!a2)
      v10 = "begin";
    v12 = 2114;
    v13 = v7;
    v14 = 2048;
    v15 = v9;
    v16 = 2080;
    v17 = v10;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s removeUnusedChannelsWithCompletion:", (uint8_t *)v11, 0x26u);

  }
}

void __71__TRIInternalServiceRequestHandler_removeUnusedChannelsWithCompletion___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __71__TRIInternalServiceRequestHandler_removeUnusedChannelsWithCompletion___block_invoke_2;
    v22[3] = &unk_1E9330760;
    v23 = *(id *)(a1 + 40);
    v9 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v22);
    v10 = (void *)objc_opt_new();
    objc_msgSend(v5, "rolloutDatabase");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __71__TRIInternalServiceRequestHandler_removeUnusedChannelsWithCompletion___block_invoke_3;
    v20[3] = &unk_1E93304F8;
    v12 = v10;
    v21 = v12;
    objc_msgSend(v11, "enumerateActiveRecordsWithVisibility:usingTransaction:block:", 1, 0, v20);

    v13 = (void *)objc_opt_new();
    objc_msgSend(v5, "experimentDatabase");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __71__TRIInternalServiceRequestHandler_removeUnusedChannelsWithCompletion___block_invoke_4;
    v18[3] = &unk_1E9330520;
    v15 = v13;
    v19 = v15;
    objc_msgSend(v14, "enumerateActiveExperimentRecordsWithVisibility:block:", 1, v18);

    objc_msgSend(v5, "pushServiceMuxer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ensureSubscriptionsExistOnlyForRolloutDeployments:experimentIds:maxChannelsAllowed:", v12, v15, 75);

    v17 = *(_QWORD *)(a1 + 32);
    if (v17)
      (*(void (**)(void))(v17 + 16))();

    if (v9)
      v9[2](v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __71__TRIInternalServiceRequestHandler_removeUnusedChannelsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__TRIInternalServiceRequestHandler_removeUnusedChannelsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "deployment");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __71__TRIInternalServiceRequestHandler_removeUnusedChannelsWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "experimentDeployment");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)registerNamespaceWithNamespaceName:(id)a3 compatibilityVersion:(unsigned int)a4 defaultsFileURL:(id)a5 teamId:(id)a6 appContainerId:(id)a7 appContainerType:(int64_t)a8 cloudKitContainerId:(int)a9 completion:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void (**v24)(_QWORD, _QWORD);
  TRIXPCServerContextPromise *promise;
  id v26;
  id v27;
  id v28;
  id v29;
  void (**v30)(_QWORD, _QWORD);
  id v31;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  int64_t v40;
  unsigned int v41;
  int v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  id v47;
  int64_t v48;
  unsigned int v49;
  int v50;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a10;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __178__TRIInternalServiceRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainerId_completion___block_invoke;
  v43[3] = &unk_1E9330990;
  v43[4] = self;
  v20 = v15;
  v44 = v20;
  v49 = a4;
  v21 = v16;
  v45 = v21;
  v22 = v17;
  v46 = v22;
  v23 = v18;
  v47 = v23;
  v48 = a8;
  v50 = a9;
  v24 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v43);
  v24[2](v24, 0);
  promise = self->_promise;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __178__TRIInternalServiceRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainerId_completion___block_invoke_69;
  v33[3] = &unk_1E93309E0;
  v38 = v19;
  v39 = v24;
  v34 = v20;
  v35 = v23;
  v36 = v22;
  v37 = v21;
  v40 = a8;
  v41 = a4;
  v42 = a9;
  v26 = v21;
  v27 = v22;
  v28 = v23;
  v29 = v20;
  v30 = v24;
  v31 = v19;
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](promise, "addBlockToExecuteAfterPromiseFullfillment:", v33);

}

void __178__TRIInternalServiceRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainerId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = "end";
    else
      v8 = "begin";
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_DWORD *)(a1 + 80);
    v12 = *(_QWORD *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 56);
    v16 = *(_QWORD *)(a1 + 64);
    v17 = *(_QWORD *)(a1 + 72);
    TRICloudKitSupport_Container_EnumDescriptor();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "enumNameForValue:", *(unsigned int *)(a1 + 84));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67111682;
    v19 = v5;
    v20 = 2114;
    v21 = v7;
    v22 = 2048;
    v23 = v9;
    v24 = 2080;
    v25 = v8;
    v26 = 2114;
    v27 = v10;
    v28 = 1024;
    v29 = v11;
    v30 = 2112;
    v31 = v12;
    v32 = 2114;
    v33 = v15;
    v34 = 2112;
    v35 = v16;
    v36 = 1024;
    v37 = v17;
    v38 = 2112;
    v39 = v14;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s registerNamespaceWithNamespaceName:%{public}@ compatibilityVersion:%u defaultsFileURL:%@ teamId:%{public}@ appContainerId:%@ appContainerType:%u cloudKitContainerId:%@", buf, 0x64u);

  }
}

void __178__TRIInternalServiceRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainerId_completion___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD, _QWORD, _QWORD);
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __178__TRIInternalServiceRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainerId_completion___block_invoke_2;
    v20[3] = &unk_1E9330760;
    v21 = *(id *)(a1 + 72);
    v9 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v20);
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __178__TRIInternalServiceRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainerId_completion___block_invoke_3;
    v17[3] = &unk_1E93309B8;
    v19 = *(id *)(a1 + 64);
    v18 = *(id *)(a1 + 32);
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D8232C48](v17);
    if (*(_QWORD *)(a1 + 32))
    {
      if ((objc_msgSend(MEMORY[0x1E0DC0BB8], "validateSafeASCIISubsetIdentifier:") & 1) != 0)
      {
        if (!*(_QWORD *)(a1 + 40))
        {
          v14 = CFSTR("bundleOrGroupId must be non-nil.");
          goto LABEL_17;
        }
        if ((objc_msgSend(MEMORY[0x1E0DC0BB8], "validateSafeASCIISubsetIdentifier:") & 1) != 0)
        {
          v11 = *(_QWORD *)(a1 + 48);
          if (v11)
          {
            LODWORD(v16) = *(_DWORD *)(a1 + 92);
            +[TRIXPCNamespaceManagementRequestHandler usingServerContext:registerNamespaceWithNamespaceName:compatibilityVersion:defaultsFileURL:teamId:appContainerId:appContainerType:cloudKitContainerId:bundleId:completion:](TRIXPCNamespaceManagementRequestHandler, "usingServerContext:registerNamespaceWithNamespaceName:compatibilityVersion:defaultsFileURL:teamId:appContainerId:appContainerType:cloudKitContainerId:bundleId:completion:", v5, *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 88), *(_QWORD *)(a1 + 56), v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), v16, CFSTR("com.apple.trial"), *(_QWORD *)(a1 + 64));
LABEL_18:

            if (v9)
              v9[2](v9);

            goto LABEL_21;
          }
          v14 = CFSTR("teamId not found in caller entitlements.");
LABEL_17:
          ((void (**)(_QWORD, uint64_t, const __CFString *))v10)[2](v10, 2, v14);
          goto LABEL_18;
        }
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("appContainerId(%@) can only contain alphanumeric characters, underscore (_), hyphen (-) or period (.)"), *(_QWORD *)(a1 + 40));
        ((void (**)(_QWORD, uint64_t, void *))v10)[2](v10, 2, v15);
      }
      else
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("namespaceName(%@) can only contain alphanumeric characters, underscore (_), hyphen (-) or period (.)"), *(_QWORD *)(a1 + 32));
        ((void (**)(_QWORD, uint64_t, void *))v10)[2](v10, 2, v15);
      }

      goto LABEL_18;
    }
    v14 = CFSTR("namespaceName must be non-nil.");
    goto LABEL_17;
  }
  v12 = *(_QWORD *)(a1 + 64);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

  }
LABEL_21:

}

uint64_t __178__TRIInternalServiceRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainerId_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __178__TRIInternalServiceRequestHandler_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_teamId_appContainerId_appContainerType_cloudKitContainerId_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      TRILoggedNamespaceName(*(void **)(a1 + 32));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v5;
      _os_log_debug_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEBUG, "failed to register namespace %{public}@: %{public}@", buf, 0x16u);

    }
    v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = *MEMORY[0x1E0CB2D50];
    v12 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a2, v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)deregisterNamespaceWithNamespaceName:(id)a3 teamId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  TRIXPCServerContextPromise *promise;
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD);
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __91__TRIInternalServiceRequestHandler_deregisterNamespaceWithNamespaceName_teamId_completion___block_invoke;
  v25[3] = &unk_1E9330878;
  v25[4] = self;
  v12 = v8;
  v26 = v12;
  v13 = v9;
  v27 = v13;
  v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v25);
  v14[2](v14, 0);
  promise = self->_promise;
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __91__TRIInternalServiceRequestHandler_deregisterNamespaceWithNamespaceName_teamId_completion___block_invoke_85;
  v20[3] = &unk_1E93308A0;
  v23 = v10;
  v24 = v14;
  v21 = v12;
  v22 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v14;
  v19 = v10;
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](promise, "addBlockToExecuteAfterPromiseFullfillment:", v20);

}

void __91__TRIInternalServiceRequestHandler_deregisterNamespaceWithNamespaceName_teamId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _DWORD v12[2];
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = "end";
    else
      v8 = "begin";
    v9 = *(_QWORD *)(a1 + 32);
    TRILoggedNamespaceName(*(void **)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 48);
    v12[0] = 67110402;
    v12[1] = v5;
    v13 = 2114;
    v14 = v7;
    v15 = 2048;
    v16 = v9;
    v17 = 2080;
    v18 = v8;
    v19 = 2114;
    v20 = v10;
    v21 = 2114;
    v22 = v11;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s deregisterNamespaceWithNamespaceName:%{public}@ teamId:%{public}@ completion:", (uint8_t *)v12, 0x3Au);

  }
}

void __91__TRIInternalServiceRequestHandler_deregisterNamespaceWithNamespaceName_teamId_completion___block_invoke_85(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD, _QWORD, _QWORD);
  id v11;
  id v12;
  void *v13;
  void (**v14)(id, _QWORD, void *);
  void *v15;
  const __CFString *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __91__TRIInternalServiceRequestHandler_deregisterNamespaceWithNamespaceName_teamId_completion___block_invoke_2;
    v20[3] = &unk_1E9330760;
    v21 = a1[7];
    v9 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v20);
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __91__TRIInternalServiceRequestHandler_deregisterNamespaceWithNamespaceName_teamId_completion___block_invoke_3;
    v17[3] = &unk_1E93309B8;
    v19 = a1[6];
    v18 = a1[4];
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D8232C48](v17);
    if (a1[4])
    {
      v11 = a1[5];
      if (v11)
      {
        if (objc_msgSend(v11, "length"))
        {
          v12 = a1[4];
          objc_msgSend(a1[5], "stringByAppendingString:", CFSTR("."));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v12) = objc_msgSend(v12, "hasPrefix:", v13);

          if ((v12 & 1) != 0)
          {
            +[TRIXPCNamespaceManagementRequestHandler usingServerContext:deregisterNamespaceWithName:teamId:taskQueue:completion:](TRIXPCNamespaceManagementRequestHandler, "usingServerContext:deregisterNamespaceWithName:teamId:taskQueue:completion:", v5, a1[4], a1[5], v7, a1[6]);
LABEL_14:

            if (v9)
              v9[2](v9);

            goto LABEL_17;
          }
        }
        v16 = CFSTR("app not entitled to remove namespace.");
      }
      else
      {
        v16 = CFSTR("teamId must be non-nil.");
      }
    }
    else
    {
      v16 = CFSTR("namespaceName must be non-nil.");
    }
    ((void (**)(_QWORD, uint64_t, const __CFString *))v10)[2](v10, 2, v16);
    goto LABEL_14;
  }
  v14 = (void (**)(id, _QWORD, void *))a1[6];
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, v15);

  }
LABEL_17:

}

uint64_t __91__TRIInternalServiceRequestHandler_deregisterNamespaceWithNamespaceName_teamId_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __91__TRIInternalServiceRequestHandler_deregisterNamespaceWithNamespaceName_teamId_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      TRILoggedNamespaceName(*(void **)(a1 + 32));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v5;
      _os_log_debug_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEBUG, "failed to deregister namespace %{public}@: %{public}@", buf, 0x16u);

    }
    v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = *MEMORY[0x1E0CB2D50];
    v12 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a2, v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)startDownloadNamespaceWithName:(id)a3 teamId:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD);
  TRIXPCServerContextPromise *promise;
  id v20;
  id v21;
  id v22;
  void (**v23)(_QWORD, _QWORD);
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __93__TRIInternalServiceRequestHandler_startDownloadNamespaceWithName_teamId_options_completion___block_invoke;
  v31[3] = &unk_1E9330A08;
  v31[4] = self;
  v15 = v10;
  v32 = v15;
  v16 = v11;
  v33 = v16;
  v17 = v12;
  v34 = v17;
  v18 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v31);
  v18[2](v18, 0);
  promise = self->_promise;
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __93__TRIInternalServiceRequestHandler_startDownloadNamespaceWithName_teamId_options_completion___block_invoke_92;
  v25[3] = &unk_1E9330A30;
  v29 = v13;
  v30 = v18;
  v26 = v15;
  v27 = v16;
  v28 = v17;
  v20 = v17;
  v21 = v16;
  v22 = v15;
  v23 = v18;
  v24 = v13;
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](promise, "addBlockToExecuteAfterPromiseFullfillment:", v25);

}

void __93__TRIInternalServiceRequestHandler_startDownloadNamespaceWithName_teamId_options_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _DWORD v14[2];
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1[4] + 44);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = "end";
    v10 = a1[4];
    v11 = a1[5];
    if (!a2)
      v9 = "begin";
    v12 = a1[6];
    v13 = a1[7];
    v14[0] = 67110658;
    v14[1] = v5;
    v15 = 2114;
    v16 = v7;
    v17 = 2048;
    v18 = v10;
    v19 = 2080;
    v20 = v9;
    v21 = 2114;
    v22 = v11;
    v23 = 2114;
    v24 = v12;
    v25 = 2112;
    v26 = v13;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s startDownloadNamespaceWithName:%{public}@ teamId:%{public}@ options:%@ completion:", (uint8_t *)v14, 0x44u);

  }
}

void __93__TRIInternalServiceRequestHandler_startDownloadNamespaceWithName_teamId_options_completion___block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  void *v11;
  TRITaskAttributionInternalInsecure *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __93__TRIInternalServiceRequestHandler_startDownloadNamespaceWithName_teamId_options_completion___block_invoke_2;
    v19[3] = &unk_1E9330760;
    v20 = *(id *)(a1 + 64);
    v9 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v19);
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __93__TRIInternalServiceRequestHandler_startDownloadNamespaceWithName_teamId_options_completion___block_invoke_3;
    v16[3] = &unk_1E93309B8;
    v18 = *(id *)(a1 + 56);
    v17 = *(id *)(a1 + 32);
    v10 = MEMORY[0x1D8232C48](v16);
    v11 = (void *)v10;
    if (*(_QWORD *)(a1 + 32))
    {
      if (*(_QWORD *)(a1 + 40))
      {
        v12 = -[TRITaskAttributionInternalInsecure initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:]([TRITaskAttributionInternalInsecure alloc], "initWithTeamIdentifier:triCloudKitContainer:applicationBundleIdentifier:networkOptions:", *(_QWORD *)(a1 + 40), 2, CFSTR("com.apple.triald"), *(_QWORD *)(a1 + 48));
        +[TRIXPCNamespaceManagementRequestHandler usingServerContext:taskQueue:startDownloadNamespaceWithName:attribution:completion:](TRIXPCNamespaceManagementRequestHandler, "usingServerContext:taskQueue:startDownloadNamespaceWithName:attribution:completion:", v5, v7, *(_QWORD *)(a1 + 32), v12, *(_QWORD *)(a1 + 56));

LABEL_11:
        if (v9)
          v9[2](v9);

        goto LABEL_14;
      }
      v15 = CFSTR("teamId must be non-nil.");
    }
    else
    {
      v15 = CFSTR("namespaceName must be non-nil.");
    }
    (*(void (**)(uint64_t, uint64_t, const __CFString *))(v10 + 16))(v10, 2, v15);
    goto LABEL_11;
  }
  v13 = *(_QWORD *)(a1 + 56);
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

  }
LABEL_14:

}

uint64_t __93__TRIInternalServiceRequestHandler_startDownloadNamespaceWithName_teamId_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __93__TRIInternalServiceRequestHandler_startDownloadNamespaceWithName_teamId_options_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v5;
      _os_log_debug_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEBUG, "failed to deregister namespace %{public}@: %{public}@", buf, 0x16u);
    }

    v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = *MEMORY[0x1E0CB2D50];
    v12 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a2, v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)dynamicNamespaceRecordsWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  TRIXPCServerContextPromise *promise;
  void (**v8)(_QWORD, _QWORD);
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__TRIInternalServiceRequestHandler_dynamicNamespaceRecordsWithCompletion___block_invoke;
  v13[3] = &unk_1E9330738;
  v13[4] = self;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v13);
  v6[2](v6, 0);
  promise = self->_promise;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __74__TRIInternalServiceRequestHandler_dynamicNamespaceRecordsWithCompletion___block_invoke_96;
  v10[3] = &unk_1E9330788;
  v11 = v4;
  v12 = v6;
  v8 = v6;
  v9 = v4;
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](promise, "addBlockToExecuteAfterPromiseFullfillment:", v10);

}

void __74__TRIInternalServiceRequestHandler_dynamicNamespaceRecordsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  _DWORD v11[2];
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = "end";
    v11[0] = 67109890;
    v11[1] = v5;
    if (!a2)
      v10 = "begin";
    v12 = 2114;
    v13 = v7;
    v14 = 2048;
    v15 = v9;
    v16 = 2080;
    v17 = v10;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s dynamicNamespaceRecordsWithCompletion:", (uint8_t *)v11, 0x26u);

  }
}

void __74__TRIInternalServiceRequestHandler_dynamicNamespaceRecordsWithCompletion___block_invoke_96(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  id v12;
  int v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __74__TRIInternalServiceRequestHandler_dynamicNamespaceRecordsWithCompletion___block_invoke_2;
    v20[3] = &unk_1E9330760;
    v21 = *(id *)(a1 + 40);
    v9 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v20);
    v10 = (void *)objc_opt_new();
    objc_msgSend(v5, "namespaceDatabase");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __74__TRIInternalServiceRequestHandler_dynamicNamespaceRecordsWithCompletion___block_invoke_3;
    v18[3] = &unk_1E93304D0;
    v12 = v10;
    v19 = v12;
    v13 = objc_msgSend(v11, "enumerateDynamicNamespaceRecordsWithBlock:", v18);

    v14 = *(_QWORD *)(a1 + 32);
    if (v14)
    {
      if (v13)
        v15 = v12;
      else
        v15 = 0;
      (*(void (**)(uint64_t, id, _QWORD))(v14 + 16))(v14, v15, 0);
    }

    if (v9)
      v9[2](v9);

  }
  else
  {
    v16 = *(_QWORD *)(a1 + 32);
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v17);

    }
  }

}

uint64_t __74__TRIInternalServiceRequestHandler_dynamicNamespaceRecordsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__TRIInternalServiceRequestHandler_dynamicNamespaceRecordsWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)subscriptionForNamespaceName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  TRIXPCServerContextPromise *promise;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  promise = self->_promise;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__TRIInternalServiceRequestHandler_subscriptionForNamespaceName_completion___block_invoke;
  v11[3] = &unk_1E9330968;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](promise, "addBlockToExecuteAfterPromiseFullfillment:", v11);

}

void __76__TRIInternalServiceRequestHandler_subscriptionForNamespaceName_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (v11 && v5)
  {
    objc_msgSend(v11, "keyValueStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRINamespaceFactorSubscriptionSettings settingsWithKeyValueStore:](TRINamespaceFactorSubscriptionSettings, "settingsWithKeyValueStore:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "subscribedFactorsForNamespaceName:", *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v8, 0);

    goto LABEL_8;
  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, MEMORY[0x1E0C9AA60], v7);
LABEL_8:

  }
}

- (void)setSubscription:(id)a3 namespaceName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  TRIXPCServerContextPromise *promise;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  promise = self->_promise;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__TRIInternalServiceRequestHandler_setSubscription_namespaceName_completion___block_invoke;
  v15[3] = &unk_1E9330A58;
  v17 = v9;
  v18 = v10;
  v16 = v8;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](promise, "addBlockToExecuteAfterPromiseFullfillment:", v15);

}

void __77__TRIInternalServiceRequestHandler_setSubscription_namespaceName_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    objc_msgSend(v5, "keyValueStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRINamespaceFactorSubscriptionSettings settingsWithKeyValueStore:](TRINamespaceFactorSubscriptionSettings, "settingsWithKeyValueStore:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = a1[4];
    v11 = a1[5];
    v16 = 0;
    v12 = objc_msgSend(v9, "setSubscriptionWithFactorNames:inNamespaceName:error:", v10, v11, &v16);
    v13 = v16;
    v14 = a1[6];
    if (v14)
      (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, v12, v13);

    goto LABEL_8;
  }
  v15 = a1[6];
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v9);
LABEL_8:

  }
}

- (void)activeRolloutInformationWithPrivacyFilterPolicy:(unsigned __int8)a3 completion:(id)a4
{
  id v6;
  TRIXPCServerContextPromise *promise;
  id v8;
  _QWORD v9[4];
  id v10;
  unsigned __int8 v11;

  v6 = a4;
  promise = self->_promise;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __95__TRIInternalServiceRequestHandler_activeRolloutInformationWithPrivacyFilterPolicy_completion___block_invoke;
  v9[3] = &unk_1E9330B28;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](promise, "addBlockToExecuteAfterPromiseFullfillment:", v9);

}

void __95__TRIInternalServiceRequestHandler_activeRolloutInformationWithPrivacyFilterPolicy_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  id obj;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *context;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[5];
  char v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  _BYTE v72[128];
  _QWORD v73[3];
  _QWORD v74[3];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v50 = v5;
  if (v5 && v6)
  {
    v48 = v6;
    v49 = a1;
    v66 = 0;
    v67 = &v66;
    v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__7;
    v70 = __Block_byref_object_dispose__7;
    v71 = (id)objc_opt_new();
    objc_msgSend(v5, "rolloutDatabase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __95__TRIInternalServiceRequestHandler_activeRolloutInformationWithPrivacyFilterPolicy_completion___block_invoke_99;
    v64[3] = &unk_1E9330A80;
    v65 = *(_BYTE *)(a1 + 40);
    v64[4] = &v66;
    v8 = objc_msgSend(v7, "enumerateRecordsUsingTransaction:block:", 0, v64);

    if ((v8 & 1) != 0)
    {
      v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend((id)v67[5], "sortedArrayUsingComparator:", &__block_literal_global_4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "initWithArray:", v10);
      v12 = (void *)v67[5];
      v67[5] = v11;

      v13 = objc_alloc(MEMORY[0x1E0DC09F8]);
      objc_msgSend(v50, "paths");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithPaths:factorsState:", v14, 0);

      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      obj = (id)v67[5];
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
      v52 = v16;
      if (v17)
      {
        v53 = *(_QWORD *)v61;
        do
        {
          v18 = 0;
          v54 = v17;
          do
          {
            if (*(_QWORD *)v61 != v53)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v18);
            context = (void *)MEMORY[0x1D8232A5C]();
            objc_msgSend(v19, "activeFactorPackSetId");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v20 == 0;

            if (!v21)
            {
              v73[0] = CFSTR("rolloutId");
              objc_msgSend(v19, "deployment");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "rolloutId");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v74[0] = v23;
              v73[1] = CFSTR("deploymentId");
              v24 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v19, "deployment");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "numberWithInt:", objc_msgSend(v25, "deploymentId"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v74[1] = v26;
              v73[2] = CFSTR("status");
              v27 = objc_msgSend(v19, "status") - 1;
              v28 = CFSTR("inactive  ");
              if (v27 <= 3)
                v28 = off_1E9330DE0[v27];
              -[__CFString triTrim](v28, "triTrim", v48);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v74[2] = v29;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 3);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = (void *)objc_msgSend(v30, "mutableCopy");

              objc_msgSend(v52, "addObject:", v31);
              objc_msgSend(v19, "rampId");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setObject:forKeyedSubscript:", v32, CFSTR("rampId"));

              objc_msgSend(v19, "activeFactorPackSetId");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setObject:forKeyedSubscript:", v33, CFSTR("activeFactorPackSetId"));

              objc_msgSend(v19, "targetedFactorPackSetId");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setObject:forKeyedSubscript:", v34, CFSTR("targetedFactorPackSetId"));

              v35 = (void *)objc_opt_new();
              objc_msgSend(v31, "setObject:forKeyedSubscript:", v35, CFSTR("namespaces"));
              objc_msgSend(v19, "artifact");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "rollout");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "selectedNamespaceArray");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "sortedArrayUsingComparator:", &__block_literal_global_131);
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              v58 = 0u;
              v59 = 0u;
              v56 = 0u;
              v57 = 0u;
              v40 = v39;
              v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
              if (v41)
              {
                v42 = *(_QWORD *)v57;
                do
                {
                  for (i = 0; i != v41; ++i)
                  {
                    if (*(_QWORD *)v57 != v42)
                      objc_enumerationMutation(v40);
                    _namespaceDictionaryForClientSelectedNamespace(*(void **)(*((_QWORD *)&v56 + 1) + 8 * i), v15);
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "addObject:", v44);

                  }
                  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
                }
                while (v41);
              }

            }
            objc_autoreleasePoolPop(context);
            ++v18;
          }
          while (v18 != v54);
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
        }
        while (v17);
      }

      (*(void (**)(void))(*(_QWORD *)(v49 + 32) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    _Block_object_dispose(&v66, 8);

    v6 = v48;
  }
  else
  {
    v45 = *(_QWORD *)(a1 + 32);
    if (v45)
    {
      v46 = v6;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v45 + 16))(v45, 0, v47);

      v6 = v46;
    }
  }

}

void __95__TRIInternalServiceRequestHandler_activeRolloutInformationWithPrivacyFilterPolicy_completion___block_invoke_99(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v3, "namespaces", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(MEMORY[0x1E0DC0AF0], "shouldPrivacyFilterNamespace:policy:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8), *(unsigned __int8 *)(a1 + 40)) & 1) != 0)
        {

          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v6)
        continue;
      break;
    }
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
LABEL_11:

}

uint64_t __95__TRIInternalServiceRequestHandler_activeRolloutInformationWithPrivacyFilterPolicy_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "deployment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rolloutId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deployment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rolloutId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "compare:", v9);

  if (!v10)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "deployment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "deploymentId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "deployment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "deploymentId"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v13, "compare:", v16);

  }
  return v10;
}

uint64_t __95__TRIInternalServiceRequestHandler_activeRolloutInformationWithPrivacyFilterPolicy_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)_experimentRecordsWithDeploymentEnvironments:(id)a3 privacyFilterPolicy:(unsigned __int8)a4 serverContext:(id)a5 completion:(id)a6
{
  int v8;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void (**v14)(_QWORD, _QWORD);
  void (**v15)(_QWORD, _QWORD);
  void (**v16)(_QWORD);
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  void *v19;
  void *v20;
  void *v21;
  id v22;
  char v23;
  void *v24;
  int v25;
  id v26;
  _QWORD v27[4];
  char v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[6];

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __126__TRIInternalServiceRequestHandler__experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_serverContext_completion___block_invoke;
  v36[3] = &unk_1E9330738;
  v36[4] = self;
  v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v36);
  v14[2](v14, 0);
  v34[0] = v13;
  v34[1] = 3221225472;
  v34[2] = __126__TRIInternalServiceRequestHandler__experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_serverContext_completion___block_invoke_132;
  v34[3] = &unk_1E9330760;
  v15 = v14;
  v35 = v15;
  v16 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v34);
  v32[0] = v13;
  v32[1] = 3221225472;
  v32[2] = __126__TRIInternalServiceRequestHandler__experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_serverContext_completion___block_invoke_2;
  v32[3] = &unk_1E93307D8;
  v17 = v12;
  v33 = v17;
  v18 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D8232C48](v32);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E9363720);
  if (v10)
  {
    if ((objc_msgSend(v10, "isSubsetOfSet:", v19) & 1) != 0)
    {
      v25 = v8;
      v20 = (void *)objc_opt_new();
      v26 = v11;
      objc_msgSend(v11, "experimentDatabase");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v13;
      v29[1] = 3221225472;
      v29[2] = __126__TRIInternalServiceRequestHandler__experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_serverContext_completion___block_invoke_142;
      v29[3] = &unk_1E9330B50;
      v30 = v10;
      v22 = v20;
      v31 = v22;
      v23 = objc_msgSend(v21, "enumerateExperimentRecordsWithBlock:", v29);

      if ((v23 & 1) != 0)
      {
        if (v25)
        {
          v27[0] = v13;
          v27[1] = 3221225472;
          v27[2] = __126__TRIInternalServiceRequestHandler__experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_serverContext_completion___block_invoke_2_147;
          v27[3] = &__block_descriptor_33_e25_B24__0_8__NSDictionary_16l;
          v28 = v25;
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v27);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "filterUsingPredicate:", v24);

        }
        if (v17)
          (*((void (**)(id, id, _QWORD))v17 + 2))(v17, v22, 0);
      }
      else
      {
        ((void (**)(_QWORD, uint64_t, const __CFString *))v18)[2](v18, 12, CFSTR("The database query failed."));
      }

      v11 = v26;
    }
    else
    {
      v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The calling process is not entitled for access to deployment environments %@."), v10);
      ((void (**)(_QWORD, uint64_t, id))v18)[2](v18, 3, v22);
    }

  }
  else
  {
    ((void (**)(_QWORD, uint64_t, const __CFString *))v18)[2](v18, 2, CFSTR("Parameter 'environments' must be non-nil."));
  }

  if (v16)
    v16[2](v16);

}

void __126__TRIInternalServiceRequestHandler__experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_serverContext_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  _DWORD v11[2];
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = "end";
    v11[0] = 67109890;
    v11[1] = v5;
    if (!a2)
      v10 = "begin";
    v12 = 2114;
    v13 = v7;
    v14 = 2048;
    v15 = v9;
    v16 = 2080;
    v17 = v10;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s experimentRecordsWithDeploymentEnvironments:completion:", (uint8_t *)v11, 0x26u);

  }
}

uint64_t __126__TRIInternalServiceRequestHandler__experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_serverContext_completion___block_invoke_132(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __126__TRIInternalServiceRequestHandler__experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_serverContext_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v5;
      _os_log_debug_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEBUG, "experimentRecordsWithDeploymentEnvironments: %{public}@", buf, 0xCu);
    }

    v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v10 = *MEMORY[0x1E0CB2D50];
    v11 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a2, v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __126__TRIInternalServiceRequestHandler__experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_serverContext_completion___block_invoke_142(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v18 = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "deploymentEnvironment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    v17 = objc_alloc(MEMORY[0x1E0DC0B30]);
    v6 = objc_msgSend(v18, "deploymentEnvironment");
    objc_msgSend(v18, "experimentDeployment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "treatmentId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "factorPackSetId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v18, "type");
    v11 = objc_msgSend(v18, "status");
    objc_msgSend(v18, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "namespaces");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = objc_msgSend(v18, "isShadow");
    v15 = (void *)objc_msgSend(v17, "initWithDeploymentEnvironment:experimentDeployment:treatmentId:factorPackSetId:type:status:startDate:endDate:namespaces:isShadow:", v6, v7, v8, v9, v10, v11, v12, v13, v14, v16);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);
  }

}

uint64_t __126__TRIInternalServiceRequestHandler__experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_serverContext_completion___block_invoke_2_147(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a2, "namespaces", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)MEMORY[0x1E0DC0AF0];
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v8) = objc_msgSend(v8, "shouldPrivacyFilterNamespace:policy:", v9, *(unsigned __int8 *)(a1 + 32));

        if ((v8 & 1) != 0)
        {
          v10 = 0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (void)activeExperimentInformationWithPrivacyFilterPolicy:(unsigned __int8)a3 completion:(id)a4
{
  id v5;
  TRIXPCServerContextPromise *promise;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  promise = self->_promise;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __98__TRIInternalServiceRequestHandler_activeExperimentInformationWithPrivacyFilterPolicy_completion___block_invoke;
  v8[3] = &unk_1E9330968;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](promise, "addBlockToExecuteAfterPromiseFullfillment:", v8);

}

void __98__TRIInternalServiceRequestHandler_activeExperimentInformationWithPrivacyFilterPolicy_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  __CFString *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  id obj;
  uint64_t i;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t j;
  void *v66;
  id v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[5];
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _QWORD v95[3];
  _QWORD v96[3];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v59 = v5;
  if (v5 && v6)
  {
    v52 = v6;
    v87 = 0;
    v88 = &v87;
    v89 = 0x3032000000;
    v90 = __Block_byref_object_copy__7;
    v91 = __Block_byref_object_dispose__7;
    v92 = 0;
    v8 = *(void **)(a1 + 32);
    v9 = (void *)MEMORY[0x1D8232A5C]();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E9363A20, 0);
    objc_autoreleasePoolPop(v9);
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __98__TRIInternalServiceRequestHandler_activeExperimentInformationWithPrivacyFilterPolicy_completion___block_invoke_2;
    v86[3] = &unk_1E9330B98;
    v86[4] = &v87;
    objc_msgSend(v8, "_experimentRecordsWithDeploymentEnvironments:privacyFilterPolicy:serverContext:completion:", v10, 1, v59, v86);

    v57 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 1);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    obj = (id)v88[5];
    v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v97, 16);
    if (!v53)
      goto LABEL_40;
    v54 = *(_QWORD *)v83;
    while (1)
    {
      for (i = 0; i != v53; ++i)
      {
        if (*(_QWORD *)v83 != v54)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
        v95[0] = CFSTR("experiment");
        objc_msgSend(v11, "experimentId");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v96[0] = v12;
        v95[1] = CFSTR("deploymentId");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "deploymentId"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v96[1] = v13;
        v95[2] = CFSTR("treatmentId");
        objc_msgSend(v11, "treatmentId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v96[2] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = (void *)objc_msgSend(v15, "mutableCopy");

        objc_msgSend(v57, "addObject:", v58);
        v16 = objc_opt_new();
        objc_msgSend(v58, "setObject:forKeyedSubscript:", v16, CFSTR("namespaces"));
        v63 = (void *)v16;
        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        objc_msgSend(v11, "namespaces");
        v60 = (id)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
        if (v62)
        {
          v61 = *(_QWORD *)v79;
          do
          {
            for (j = 0; j != v62; ++j)
            {
              if (*(_QWORD *)v79 != v61)
                objc_enumerationMutation(v60);
              v71 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "addObject:", v66);
              objc_msgSend(v71, "name");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "setObject:forKeyedSubscript:", v17, CFSTR("name"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v71, "compatibilityVersion"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "setObject:forKeyedSubscript:", v18, CFSTR("compatibility"));

              v19 = objc_opt_new();
              objc_msgSend(v66, "setObject:forKeyedSubscript:", v19, CFSTR("factors"));
              v70 = (void *)v19;
              v20 = *(void **)(a1 + 32);
              objc_msgSend(v71, "name");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "_activeExperimentFactorLevelsForNamespaceName:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              v76 = 0u;
              v77 = 0u;
              v74 = 0u;
              v75 = 0u;
              v67 = v22;
              v23 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v74, v93, 16);
              if (v23)
              {
                v69 = *(_QWORD *)v75;
                do
                {
                  v72 = v23;
                  for (k = 0; k != v72; ++k)
                  {
                    if (*(_QWORD *)v75 != v69)
                      objc_enumerationMutation(v67);
                    v25 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * k);
                    objc_msgSend(v25, "factor");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "name");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v71, "name");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v68, "levelForFactor:withNamespaceName:", v27, v28);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();

                    if (objc_msgSend(v29, "levelOneOfCase") == 101)
                    {
                      objc_msgSend(v29, "directoryValue");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v30, "path");
                      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v29, "directoryValue");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v32, "asset");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      v34 = objc_msgSend(v33, "size");

                      objc_msgSend(v29, "directoryValue");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v35, "asset");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v36, "assetId");
                      v37 = objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      if (objc_msgSend(v29, "levelOneOfCase") != 100)
                      {
                        v34 = 0;
                        v41 = 0;
                        v31 = &stru_1E9336E60;
                        goto LABEL_24;
                      }
                      objc_msgSend(v29, "fileValue");
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v38, "path");
                      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v29, "fileValue");
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v39, "asset");
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      v34 = objc_msgSend(v40, "size");

                      objc_msgSend(v29, "fileValue");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v35, "asset");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v36, "assetId");
                      v37 = objc_claimAutoreleasedReturnValue();
                    }
                    v41 = (void *)v37;

LABEL_24:
                    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "factor");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "name");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "setObject:forKeyedSubscript:", v44, CFSTR("name"));

                    objc_msgSend(v29, "metadata");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "setObject:forKeyedSubscript:", v45, CFSTR("metadata"));

                    objc_msgSend(v25, "factor");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "typeString");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "setObject:forKeyedSubscript:", v47, CFSTR("type"));

                    if (v31 && -[__CFString length](v31, "length"))
                    {
                      objc_msgSend(v42, "setObject:forKeyedSubscript:", v41, CFSTR("assetReference"));
                      objc_msgSend(v42, "setObject:forKeyedSubscript:", v31, CFSTR("path"));
                      if (!v34)
                        goto LABEL_34;
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v34);
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v42, "setObject:forKeyedSubscript:", v48, CFSTR("size"));
                    }
                    else
                    {
                      objc_msgSend(v29, "object");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v48)
                      {
                        v49 = (void *)MEMORY[0x1E0CB3940];
                        objc_msgSend(v29, "object");
                        v73 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v49, "stringWithFormat:", CFSTR("%@"), v73);
                        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
                        v50 = v3;
                      }
                      else
                      {
                        v50 = &stru_1E9336E60;
                      }
                      objc_msgSend(v42, "setObject:forKeyedSubscript:", v50, CFSTR("levelValue"));
                      if (v48)
                      {

                      }
                    }

LABEL_34:
                    objc_msgSend(v70, "addObject:", v42);

                  }
                  v23 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v74, v93, 16);
                }
                while (v23);
              }

            }
            v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
          }
          while (v62);
        }

      }
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v97, 16);
      if (!v53)
      {
LABEL_40:

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        _Block_object_dispose(&v87, 8);

        v7 = v52;
        goto LABEL_43;
      }
    }
  }
  v51 = *(_QWORD *)(a1 + 40);
  if (v51)
    (*(void (**)(uint64_t, _QWORD))(v51 + 16))(v51, MEMORY[0x1E0C9AA60]);
LABEL_43:

}

void __98__TRIInternalServiceRequestHandler_activeExperimentInformationWithPrivacyFilterPolicy_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *obj;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = objc_opt_new();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v5;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v11)
    {
      v12 = v11;
      v36 = v7;
      v37 = v5;
      v13 = *(_QWORD *)v50;
      v39 = *(_QWORD *)v50;
      do
      {
        v14 = 0;
        v40 = v12;
        do
        {
          if (*(_QWORD *)v50 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v14);
          if (objc_msgSend(v15, "status", v36, v37) == 1)
          {
            objc_msgSend(v15, "treatmentId");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              v17 = (void *)objc_opt_new();
              v45 = 0u;
              v46 = 0u;
              v47 = 0u;
              v48 = 0u;
              v44 = v15;
              objc_msgSend(v15, "namespaces");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
              if (v19)
              {
                v20 = v19;
                v21 = *(_QWORD *)v46;
                do
                {
                  for (i = 0; i != v20; ++i)
                  {
                    if (*(_QWORD *)v46 != v21)
                      objc_enumerationMutation(v18);
                    v23 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
                    v24 = objc_alloc(MEMORY[0x1E0DC0BB0]);
                    objc_msgSend(v23, "name");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    v26 = (void *)objc_msgSend(v24, "initWithName:compatibilityVersion:", v25, objc_msgSend(v23, "compatibilityVersion"));
                    objc_msgSend(v17, "addObject:", v26);

                  }
                  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
                }
                while (v20);
              }

              v43 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
              v27 = objc_alloc(MEMORY[0x1E0DC0A28]);
              objc_msgSend(v44, "startDate");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = (uint64_t)v28;
              if (!v28)
              {
                v29 = objc_opt_new();
                v38 = (void *)v29;
              }
              objc_msgSend(v44, "experimentDeployment");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "experimentId");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "experimentDeployment");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "deploymentId");
              objc_msgSend(v44, "treatmentId");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = (void *)objc_msgSend(v27, "initWithType:date:experimentId:deploymentId:treatmentId:namespaces:", 2, v29, v30, v32, v33, v17);
              objc_msgSend(v43, "addObject:", v34);

              if (!v28)
              v13 = v39;
              v12 = v40;
            }
          }
          ++v14;
        }
        while (v14 != v12);
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v12);
      v7 = v36;
      v5 = v37;
    }
LABEL_27:

    goto LABEL_28;
  }
  if (v6)
  {
    TRILogCategory_Server();
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "localizedDescription");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v56 = v35;
      _os_log_error_impl(&dword_1D207F000, obj, OS_LOG_TYPE_ERROR, "activeExperimentInformationWithPrivacyFilterPolicy: %{public}@", buf, 0xCu);

    }
    goto LABEL_27;
  }
LABEL_28:

}

- (id)_activeExperimentFactorLevelsForNamespaceName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)MEMORY[0x1E0DC0AE0];
  objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "factorProviderWithNamespaceName:paths:treatmentLayer:faultOnMissingFactors:shouldLockFactorDirectory:", v3, v7, 4, 1, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "factorLevels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __82__TRIInternalServiceRequestHandler__activeExperimentFactorLevelsForNamespaceName___block_invoke;
  v26[3] = &unk_1E9330BC0;
  v11 = v4;
  v27 = v11;
  v12 = v5;
  v28 = v12;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v26);

  if (_os_feature_enabled_impl())
  {
    v13 = (void *)MEMORY[0x1E0DC0AE0];
    objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "factorProviderWithNamespaceName:paths:treatmentLayer:faultOnMissingFactors:shouldLockFactorDirectory:", v3, v14, 32, 1, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "factorLevels");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v10;
    v21 = 3221225472;
    v22 = __82__TRIInternalServiceRequestHandler__activeExperimentFactorLevelsForNamespaceName___block_invoke_2;
    v23 = &unk_1E9330BC0;
    v24 = v11;
    v25 = v12;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", &v20);

  }
  objc_msgSend(v11, "allValues", v20, v21, v22, v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v17);

  objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_187);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __82__TRIInternalServiceRequestHandler__activeExperimentFactorLevelsForNamespaceName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "factor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v5);
  else
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __82__TRIInternalServiceRequestHandler__activeExperimentFactorLevelsForNamespaceName___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "factor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v5);
  else
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

uint64_t __82__TRIInternalServiceRequestHandler__activeExperimentFactorLevelsForNamespaceName___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "factor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "factor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "factor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "compare:", v11);

  }
  else
  {
    v12 = -1;
  }

  return v12;
}

- (void)activeBMLTInformationWithPrivacyFilterPolicy:(unsigned __int8)a3 completion:(id)a4
{
  id v6;
  TRIXPCServerContextPromise *promise;
  id v8;
  _QWORD v9[4];
  id v10;
  unsigned __int8 v11;

  v6 = a4;
  promise = self->_promise;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __92__TRIInternalServiceRequestHandler_activeBMLTInformationWithPrivacyFilterPolicy_completion___block_invoke;
  v9[3] = &unk_1E9330B28;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](promise, "addBlockToExecuteAfterPromiseFullfillment:", v9);

}

void __92__TRIInternalServiceRequestHandler_activeBMLTInformationWithPrivacyFilterPolicy_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v44;
  void *v45;
  id obj;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *context;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  char v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  _QWORD v63[4];
  _QWORD v64[4];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v44 = v4;
  if (v4 && v5)
  {
    v42 = v5;
    v57 = 0;
    v58 = &v57;
    v59 = 0x3032000000;
    v60 = __Block_byref_object_copy__7;
    v61 = __Block_byref_object_dispose__7;
    v62 = (id)objc_opt_new();
    objc_msgSend(v4, "bmltDatabase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __92__TRIInternalServiceRequestHandler_activeBMLTInformationWithPrivacyFilterPolicy_completion___block_invoke_2;
    v55[3] = &unk_1E9330C28;
    v56 = *(_BYTE *)(a1 + 40);
    v55[4] = &v57;
    v7 = objc_msgSend(v6, "enumerateActiveTasksWithBlock:", v55);

    if ((v7 & 1) != 0)
    {
      v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend((id)v58[5], "sortedArrayUsingComparator:", &__block_literal_global_190);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "initWithArray:", v9);
      v11 = (void *)v58[5];
      v58[5] = v10;

      v12 = objc_alloc(MEMORY[0x1E0DC09F8]);
      objc_msgSend(v44, "paths");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)objc_msgSend(v12, "initWithPaths:factorsState:", v13, 0);

      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      obj = (id)v58[5];
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
      v47 = v14;
      if (v15)
      {
        v48 = *(_QWORD *)v52;
        do
        {
          v16 = 0;
          v49 = v15;
          do
          {
            if (*(_QWORD *)v52 != v48)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v16);
            context = (void *)MEMORY[0x1D8232A5C]();
            objc_msgSend(v17, "activeFactorPackSetId");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18 == 0;

            if (!v19)
            {
              v63[0] = CFSTR("bmltId");
              objc_msgSend(v17, "bmltDeployment");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "backgroundMLTaskId");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v64[0] = v21;
              v63[1] = CFSTR("deploymentId");
              v22 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v17, "bmltDeployment");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "numberWithInt:", objc_msgSend(v23, "deploymentId"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v64[1] = v24;
              v63[2] = CFSTR("pluginId");
              objc_msgSend(v17, "pluginId");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v64[2] = v25;
              v63[3] = CFSTR("status");
              v26 = objc_msgSend(v17, "status") - 1;
              v27 = CFSTR("inactive  ");
              if (v26 <= 3)
                v27 = off_1E9330E00[v26];
              -[__CFString triTrim](v27, "triTrim");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v64[3] = v28;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 4);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = (void *)objc_msgSend(v29, "mutableCopy");

              objc_msgSend(v47, "addObject:", v30);
              objc_msgSend(v17, "activeFactorPackSetId");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, CFSTR("activeFactorPackSetId"));

              v32 = (void *)objc_opt_new();
              objc_msgSend(v30, "setObject:forKeyedSubscript:", v32, CFSTR("namespaces"));
              objc_msgSend(v17, "artifact");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "backgroundTask");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "selectedNamespace");
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              if (v35)
              {
                _namespaceDictionaryForClientSelectedNamespace(v35, v45);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "addObject:", v36);

              }
            }
            objc_autoreleasePoolPop(context);
            ++v16;
          }
          while (v49 != v16);
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
        }
        while (v15);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v37 = v45;
    }
    else
    {
      v41 = *(_QWORD *)(a1 + 32);
      if (!v41)
      {
LABEL_23:
        _Block_object_dispose(&v57, 8);

        v5 = v42;
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v41 + 16))(v41, 0, v37);
    }

    goto LABEL_23;
  }
  v38 = *(_QWORD *)(a1 + 32);
  if (v38)
  {
    v39 = v5;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v38 + 16))(v38, 0, v40);

    v5 = v39;
  }
LABEL_24:

}

void __92__TRIInternalServiceRequestHandler_activeBMLTInformationWithPrivacyFilterPolicy_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "artifact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedNamespace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasName");

  v7 = v12;
  if (v6)
  {
    objc_msgSend(v12, "artifact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backgroundTask");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectedNamespace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(MEMORY[0x1E0DC0AF0], "shouldPrivacyFilterNamespace:policy:", v11, *(unsigned __int8 *)(a1 + 40)) & 1) == 0)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v12);

    v7 = v12;
  }

}

uint64_t __92__TRIInternalServiceRequestHandler_activeBMLTInformationWithPrivacyFilterPolicy_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "bmltDeployment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundMLTaskId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bmltDeployment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backgroundMLTaskId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "compare:", v9);

  if (!v10)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "bmltDeployment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "deploymentId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "bmltDeployment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "deploymentId"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v13, "compare:", v16);

  }
  return v10;
}

- (void)immediatelySchedulePostUpgradeActivityWithCompletion:(id)a3
{
  id v4;
  TRIXPCServerContextPromise *promise;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  promise = self->_promise;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__TRIInternalServiceRequestHandler_immediatelySchedulePostUpgradeActivityWithCompletion___block_invoke;
  v7[3] = &unk_1E9330C90;
  v8 = v4;
  v6 = v4;
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](promise, "addBlockToExecuteAfterPromiseFullfillment:", v7);

}

void __89__TRIInternalServiceRequestHandler_immediatelySchedulePostUpgradeActivityWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL8 v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild") & 1) != 0)
  {
    +[TRILaunchDaemonActivityDescriptor postUpgradeDescriptor](TRILaunchDaemonActivityDescriptor, "postUpgradeDescriptor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = +[TRIXPCActivitySupport unsafe_immediatelyScheduleActivityWithLaunchDaemonDescriptor:](TRIXPCActivitySupport, "unsafe_immediatelyScheduleActivityWithLaunchDaemonDescriptor:", v2);

    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      (*(void (**)(uint64_t, _BOOL8, _QWORD))(v4 + 16))(v4, v3, 0);
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v9 = *MEMORY[0x1E0CB2D50];
    v10[0] = CFSTR("Permission denied.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 3, v6);

    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v7);

  }
}

- (void)logSystemCovariates
{
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](self->_promise, "addBlockToExecuteAfterPromiseFullfillment:", &__block_literal_global_202);
}

void __55__TRIInternalServiceRequestHandler_logSystemCovariates__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  TRISystemCovariates *v3;
  void *v4;
  TRISystemCovariates *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = [TRISystemCovariates alloc];
  objc_msgSend(v2, "paths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[TRISystemCovariates initWithPaths:](v3, "initWithPaths:", v4);
  TRILogCategory_Backtrace();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[TRISystemCovariates dictionary](v5, "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "System covariates at the time of sysdiagnose: %@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)experimentIdsWithActiveStateAndNamespaceName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  TRIXPCServerContextPromise *promise;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __92__TRIInternalServiceRequestHandler_experimentIdsWithActiveStateAndNamespaceName_completion___block_invoke;
  v18[3] = &unk_1E9330738;
  v18[4] = self;
  v9 = (void *)MEMORY[0x1D8232C48](v18);
  promise = self->_promise;
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __92__TRIInternalServiceRequestHandler_experimentIdsWithActiveStateAndNamespaceName_completion___block_invoke_204;
  v14[3] = &unk_1E9330CF8;
  v16 = v9;
  v17 = v7;
  v15 = v6;
  v11 = v6;
  v12 = v7;
  v13 = v9;
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](promise, "addBlockToExecuteAfterPromiseFullfillment:", v14);

}

void __92__TRIInternalServiceRequestHandler_experimentIdsWithActiveStateAndNamespaceName_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  _DWORD v11[2];
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = "end";
    v11[0] = 67109890;
    v11[1] = v5;
    if (!a2)
      v10 = "begin";
    v12 = 2114;
    v13 = v7;
    v14 = 2048;
    v15 = v9;
    v16 = 2080;
    v17 = v10;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s experimentIdsWithActiveStateAndNamespaceName:completion:", (uint8_t *)v11, 0x26u);

  }
}

void __92__TRIInternalServiceRequestHandler_experimentIdsWithActiveStateAndNamespaceName_completion___block_invoke_204(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v5 = a2;
  v6 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v7 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __92__TRIInternalServiceRequestHandler_experimentIdsWithActiveStateAndNamespaceName_completion___block_invoke_2;
  v20[3] = &unk_1E9330760;
  v21 = *(id *)(a1 + 40);
  v8 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v20);
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __92__TRIInternalServiceRequestHandler_experimentIdsWithActiveStateAndNamespaceName_completion___block_invoke_3;
  v18[3] = &unk_1E93307D8;
  v19 = *(id *)(a1 + 48);
  v9 = MEMORY[0x1D8232C48](v18);
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
  if (*(_QWORD *)(a1 + 32))
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(v5, "experimentDatabase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __92__TRIInternalServiceRequestHandler_experimentIdsWithActiveStateAndNamespaceName_completion___block_invoke_207;
    v16[3] = &unk_1E9330520;
    v14 = v11;
    v17 = v14;
    LOBYTE(v13) = objc_msgSend(v12, "enumerateExperimentRecordsMatchingNamespaceName:block:", v13, v16);

    if ((v13 & 1) != 0)
    {
      v15 = *(_QWORD *)(a1 + 48);
      if (v15)
        (*(void (**)(uint64_t, id, _QWORD))(v15 + 16))(v15, v14, 0);
    }
    else
    {
      ((void (**)(_QWORD, uint64_t, const __CFString *))v10)[2](v10, 12, CFSTR("The database query failed."));
    }

  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, const __CFString *))(v9 + 16))(v9, 2, CFSTR("Parameter 'namespace-name' must be non-nil."));
  }

  if (v8)
    v8[2](v8);

}

uint64_t __92__TRIInternalServiceRequestHandler_experimentIdsWithActiveStateAndNamespaceName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __92__TRIInternalServiceRequestHandler_experimentIdsWithActiveStateAndNamespaceName_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v5;
      _os_log_debug_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEBUG, "_experimentIdsWithActiveStateAndNamespaceName: %{public}@", buf, 0xCu);
    }

    v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v10 = *MEMORY[0x1E0CB2D50];
    v11 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a2, v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __92__TRIInternalServiceRequestHandler_experimentIdsWithActiveStateAndNamespaceName_completion___block_invoke_207(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "status") == 1 || objc_msgSend(v6, "status") == 2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v6, "experimentDeployment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "experimentId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementWitness, 0);
  objc_storeStrong((id *)&self->_promise, 0);
}

@end
