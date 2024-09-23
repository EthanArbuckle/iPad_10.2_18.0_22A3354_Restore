@implementation TRIXPCInternalServiceClient

- (TRIXPCInternalServiceClient)init
{
  TRIXPCInternalServiceClient *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  _PASXPCClientHelper *helper;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)TRIXPCInternalServiceClient;
  v2 = -[TRIXPCInternalServiceClient init](&v25, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC7E850);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1D8232A5C]();
    v5 = objc_alloc(MEMORY[0x1E0C99E60]);
    v6 = objc_opt_class();
    v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_completion_, 0, 1);

    v8 = (void *)MEMORY[0x1D8232A5C]();
    v9 = objc_alloc(MEMORY[0x1E0C99E60]);
    v10 = objc_opt_class();
    v11 = (void *)objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_dynamicNamespaceRecordsWithCompletion_, 0, 1);

    v12 = (void *)MEMORY[0x1D8232A5C]();
    v13 = objc_alloc(MEMORY[0x1E0C99E60]);
    v14 = objc_opt_class();
    v15 = (void *)objc_msgSend(v13, "initWithObjects:", v14, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_taskRecordsWithCompletion_, 0, 1);

    v16 = (void *)MEMORY[0x1D8232A5C]();
    v17 = objc_alloc(MEMORY[0x1E0C99E60]);
    v18 = objc_opt_class();
    v19 = (void *)objc_msgSend(v17, "initWithObjects:", v18, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v16);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_subscriptionForNamespaceName_completion_, 0, 1);

    v20 = objc_alloc(MEMORY[0x1E0D81640]);
    TRILogCategory_ClientFramework();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "initWithServiceName:allowlistedServerInterface:allowlistedClientInterface:serverInitiatedRequestHandler:allowSystemToUserConnection:interruptionHandler:invalidationHandler:logHandle:", CFSTR("com.apple.triald.internal"), v3, 0, 0, 1, &__block_literal_global_24, &__block_literal_global_68, v21);
    helper = v2->_helper;
    v2->_helper = (_PASXPCClientHelper *)v22;

  }
  return v2;
}

- (BOOL)_performSyncXpcWithError:(id *)a3 block:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = (void (**)(id, void *))a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__42;
  v16 = __Block_byref_object_dispose__42;
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__TRIXPCInternalServiceClient__performSyncXpcWithError_block___block_invoke;
  v11[3] = &unk_1E9333890;
  v11[4] = &v12;
  v7 = (void *)MEMORY[0x1D8232C48](v11);
  -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_helper, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v8);
  v9 = (void *)v13[5];
  if (a3 && v9)
    *a3 = objc_retainAutorelease(v9);

  _Block_object_dispose(&v12, 8);
  return v9 == 0;
}

void __62__TRIXPCInternalServiceClient__performSyncXpcWithError_block___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)taskRecordsWithError:(id *)a3
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
  v17 = __Block_byref_object_copy__42;
  v18 = __Block_byref_object_dispose__42;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__42;
  v12 = __Block_byref_object_dispose__42;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__TRIXPCInternalServiceClient_taskRecordsWithError___block_invoke;
  v7[3] = &unk_1E93354C8;
  v7[4] = &v14;
  v7[5] = &v8;
  if (!-[TRIXPCInternalServiceClient _performSyncXpcWithError:block:](self, "_performSyncXpcWithError:block:", a3, v7))
    goto LABEL_5;
  v4 = (void *)v9[5];
  if (!v4)
  {
    v5 = (id)v15[5];
    goto LABEL_7;
  }
  if (a3)
  {
    v5 = 0;
    *a3 = objc_retainAutorelease(v4);
  }
  else
  {
LABEL_5:
    v5 = 0;
  }
LABEL_7:
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

uint64_t __52__TRIXPCInternalServiceClient_taskRecordsWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__TRIXPCInternalServiceClient_taskRecordsWithError___block_invoke_2;
  v3[3] = &unk_1E93354A0;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "taskRecordsWithCompletion:", v3);
}

void __52__TRIXPCInternalServiceClient_taskRecordsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (id)experimentNotificationsWithExperimentId:(id)a3 cloudKitContainer:(int)a4 teamId:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  int v22;
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

  v10 = a3;
  v11 = a5;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__42;
  v33 = __Block_byref_object_dispose__42;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__42;
  v27 = __Block_byref_object_dispose__42;
  v28 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __102__TRIXPCInternalServiceClient_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_error___block_invoke;
  v17[3] = &unk_1E93354F0;
  v12 = v10;
  v18 = v12;
  v22 = a4;
  v13 = v11;
  v19 = v13;
  v20 = &v29;
  v21 = &v23;
  if (!-[TRIXPCInternalServiceClient _performSyncXpcWithError:block:](self, "_performSyncXpcWithError:block:", a6, v17))
    goto LABEL_5;
  v14 = (void *)v24[5];
  if (!v14)
  {
    v15 = (id)v30[5];
    goto LABEL_7;
  }
  if (a6)
  {
    v15 = 0;
    *a6 = objc_retainAutorelease(v14);
  }
  else
  {
LABEL_5:
    v15 = 0;
  }
LABEL_7:

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

uint64_t __102__TRIXPCInternalServiceClient_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[4];
  __int128 v7;

  v2 = *(unsigned int *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __102__TRIXPCInternalServiceClient_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_error___block_invoke_2;
  v6[3] = &unk_1E93354A0;
  v7 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "experimentNotificationsWithExperimentId:cloudKitContainer:teamId:completion:", v3, v2, v4, v6);
}

void __102__TRIXPCInternalServiceClient_experimentNotificationsWithExperimentId_cloudKitContainer_teamId_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (v6 && objc_msgSend(v6, "count"))
  {
    TRILogCategory_ClientFramework();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "experiment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "encodedExperimentDefinition");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v12;
      v17 = 2112;
      v18 = v14;
      _os_log_debug_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEBUG, "got artifact from server with experiment %@ -- encoded: %@", (uint8_t *)&v15, 0x16u);

    }
  }

}

- (id)rolloutNotificationWithLatestDeploymentForRolloutId:(id)a3 cloudKitContainer:(int)a4 teamId:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  int v22;
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

  v10 = a3;
  v11 = a5;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__42;
  v33 = __Block_byref_object_dispose__42;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__42;
  v27 = __Block_byref_object_dispose__42;
  v28 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __114__TRIXPCInternalServiceClient_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_error___block_invoke;
  v17[3] = &unk_1E93354F0;
  v12 = v10;
  v18 = v12;
  v22 = a4;
  v13 = v11;
  v19 = v13;
  v20 = &v29;
  v21 = &v23;
  if (!-[TRIXPCInternalServiceClient _performSyncXpcWithError:block:](self, "_performSyncXpcWithError:block:", a6, v17))
    goto LABEL_5;
  v14 = (void *)v24[5];
  if (!v14)
  {
    v15 = (id)v30[5];
    goto LABEL_7;
  }
  if (a6)
  {
    v15 = 0;
    *a6 = objc_retainAutorelease(v14);
  }
  else
  {
LABEL_5:
    v15 = 0;
  }
LABEL_7:

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

uint64_t __114__TRIXPCInternalServiceClient_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[4];
  __int128 v7;

  v2 = *(unsigned int *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __114__TRIXPCInternalServiceClient_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_error___block_invoke_2;
  v6[3] = &unk_1E9335518;
  v7 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "rolloutNotificationWithLatestDeploymentForRolloutId:cloudKitContainer:teamId:completion:", v3, v2, v4, v6);
}

void __114__TRIXPCInternalServiceClient_rolloutNotificationWithLatestDeploymentForRolloutId_cloudKitContainer_teamId_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  TRILogCategory_ClientFramework();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "deployment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shortDesc");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v14;
    _os_log_debug_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEBUG, "Received rollout artifact from server: %{public}@", (uint8_t *)&v15, 0xCu);

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v6;

}

- (BOOL)submitTask:(id)a3 options:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  BOOL v15;
  id v16;
  id v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCInternalServiceClient.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("task"));

  }
  +[TRITaskSupport sharedInstance](TRITaskSupport, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "XPCTaskAllowlist");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", objc_opt_class());

  if ((v13 & 1) != 0)
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__42;
    v33 = __Block_byref_object_dispose__42;
    v34 = 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __56__TRIXPCInternalServiceClient_submitTask_options_error___block_invoke;
    v24[3] = &unk_1E9335568;
    v25 = v9;
    v26 = v10;
    v27 = &v35;
    v28 = &v29;
    if (!-[TRIXPCInternalServiceClient _performSyncXpcWithError:block:](self, "_performSyncXpcWithError:block:", a5, v24))goto LABEL_11;
    v14 = (void *)v30[5];
    if (!v14)
    {
      v15 = *((_BYTE *)v36 + 24) != 0;
      goto LABEL_13;
    }
    if (a5)
    {
      v15 = 0;
      *a5 = objc_retainAutorelease(v14);
    }
    else
    {
LABEL_11:
      v15 = 0;
    }
LABEL_13:

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v35, 8);
    goto LABEL_14;
  }
  if (a5)
  {
    v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v39 = *MEMORY[0x1E0CB2D50];
    v17 = objc_alloc(MEMORY[0x1E0CB3940]);
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("Task class %@ is not allowlisted for remote submission."), v19);
    v40[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *a5 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 2, v21);

  }
  v15 = 0;
LABEL_14:

  return v15;
}

uint64_t __56__TRIXPCInternalServiceClient_submitTask_options_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__TRIXPCInternalServiceClient_submitTask_options_error___block_invoke_2;
  v5[3] = &unk_1E9335540;
  v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "submitTask:options:completion:", v2, v3, v5);
}

void __56__TRIXPCInternalServiceClient_submitTask_options_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (id)lastFetchDateForContainer:(int)a3 teamId:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__42;
  v28 = __Block_byref_object_dispose__42;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__42;
  v22 = __Block_byref_object_dispose__42;
  v23 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__TRIXPCInternalServiceClient_lastFetchDateForContainer_teamId_error___block_invoke;
  v13[3] = &unk_1E93355B8;
  v17 = a3;
  v9 = v8;
  v14 = v9;
  v15 = &v24;
  v16 = &v18;
  if (!-[TRIXPCInternalServiceClient _performSyncXpcWithError:block:](self, "_performSyncXpcWithError:block:", a5, v13))
    goto LABEL_5;
  v10 = (void *)v19[5];
  if (!v10)
  {
    v11 = (id)v25[5];
    goto LABEL_7;
  }
  if (a5)
  {
    v11 = 0;
    *a5 = objc_retainAutorelease(v10);
  }
  else
  {
LABEL_5:
    v11 = 0;
  }
LABEL_7:

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

uint64_t __70__TRIXPCInternalServiceClient_lastFetchDateForContainer_teamId_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(unsigned int *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__TRIXPCInternalServiceClient_lastFetchDateForContainer_teamId_error___block_invoke_2;
  v5[3] = &unk_1E9335590;
  v6 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "lastFetchDateForContainer:teamId:completion:", v2, v3, v5);
}

void __70__TRIXPCInternalServiceClient_lastFetchDateForContainer_teamId_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (BOOL)setLastFetchDate:(id)a3 forContainer:(int)a4 teamId:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  int v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v11 = a3;
  v12 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCInternalServiceClient.m"), 237, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

  }
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__42;
  v29 = __Block_byref_object_dispose__42;
  v30 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __74__TRIXPCInternalServiceClient_setLastFetchDate_forContainer_teamId_error___block_invoke;
  v19[3] = &unk_1E93354F0;
  v13 = v11;
  v20 = v13;
  v24 = a4;
  v14 = v12;
  v21 = v14;
  v22 = &v31;
  v23 = &v25;
  if (!-[TRIXPCInternalServiceClient _performSyncXpcWithError:block:](self, "_performSyncXpcWithError:block:", a6, v19))
    goto LABEL_7;
  v15 = (void *)v26[5];
  if (!v15)
  {
    v16 = *((_BYTE *)v32 + 24) != 0;
    goto LABEL_9;
  }
  if (a6)
  {
    v16 = 0;
    *a6 = objc_retainAutorelease(v15);
  }
  else
  {
LABEL_7:
    v16 = 0;
  }
LABEL_9:

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

uint64_t __74__TRIXPCInternalServiceClient_setLastFetchDate_forContainer_teamId_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[4];
  __int128 v7;

  v2 = *(unsigned int *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__TRIXPCInternalServiceClient_setLastFetchDate_forContainer_teamId_error___block_invoke_2;
  v6[3] = &unk_1E9335540;
  v7 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "setLastFetchDate:forContainer:teamId:completion:", v3, v2, v4, v6);
}

void __74__TRIXPCInternalServiceClient_setLastFetchDate_forContainer_teamId_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)setFailureInjectionDelegate:(id)a3 error:(id *)a4
{
  id v7;
  id v8;
  BOOL v9;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCInternalServiceClient.m"), 266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__TRIXPCInternalServiceClient_setFailureInjectionDelegate_error___block_invoke;
  v12[3] = &unk_1E93355E0;
  v13 = v7;
  v8 = v7;
  v9 = -[TRIXPCInternalServiceClient _performSyncXpcWithError:block:](self, "_performSyncXpcWithError:block:", a4, v12);

  return v9;
}

uint64_t __65__TRIXPCInternalServiceClient_setFailureInjectionDelegate_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFailureInjectionDelegate:", *(_QWORD *)(a1 + 32));
}

- (BOOL)suspendSQLiteCKDatabaseQueueWithError:(id *)a3
{
  return -[TRIXPCInternalServiceClient _performSyncXpcWithError:block:](self, "_performSyncXpcWithError:block:", a3, &__block_literal_global_91);
}

uint64_t __69__TRIXPCInternalServiceClient_suspendSQLiteCKDatabaseQueueWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "suspendSQLiteCKDatabaseQueueWithCompletion:", &__block_literal_global_92);
}

- (BOOL)resumeSQLiteCKDatabaseQueueWithError:(id *)a3
{
  return -[TRIXPCInternalServiceClient _performSyncXpcWithError:block:](self, "_performSyncXpcWithError:block:", a3, &__block_literal_global_93);
}

uint64_t __68__TRIXPCInternalServiceClient_resumeSQLiteCKDatabaseQueueWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resumeSQLiteCKDatabaseQueueWithCompletion:", &__block_literal_global_94);
}

- (BOOL)removeUnusedChannels:(id *)a3
{
  return -[TRIXPCInternalServiceClient _performSyncXpcWithError:block:](self, "_performSyncXpcWithError:block:", a3, &__block_literal_global_95_0);
}

uint64_t __52__TRIXPCInternalServiceClient_removeUnusedChannels___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeUnusedChannelsWithCompletion:", &__block_literal_global_96);
}

- (BOOL)registerNamespaceWithNamespaceName:(id)a3 compatibilityVersion:(unsigned int)a4 defaultsFileURL:(id)a5 withTeamId:(id)a6 appContainerId:(id)a7 appContainerType:(int64_t)a8 cloudKitContainerId:(int)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v32[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  _QWORD v43[5];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCInternalServiceClient.m"), 304, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCInternalServiceClient.m"), 305, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("teamId"));

  }
  v19 = v17;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCInternalServiceClient.m"), 306, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appContainerId"));

  }
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__42;
  v48 = __Block_byref_object_dispose__42;
  v20 = MEMORY[0x1E0C809B0];
  v49 = 0;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __172__TRIXPCInternalServiceClient_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_withTeamId_appContainerId_appContainerType_cloudKitContainerId_error___block_invoke;
  v43[3] = &unk_1E9333890;
  v43[4] = &v44;
  v21 = (void *)MEMORY[0x1D8232C48](v43);
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__42;
  v37 = __Block_byref_object_dispose__42;
  v38 = 0;
  -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_helper, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v20;
  v32[1] = 3221225472;
  v32[2] = __172__TRIXPCInternalServiceClient_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_withTeamId_appContainerId_appContainerType_cloudKitContainerId_error___block_invoke_2;
  v32[3] = &unk_1E9335540;
  v32[4] = &v39;
  v32[5] = &v33;
  LODWORD(v29) = a9;
  objc_msgSend(v22, "registerNamespaceWithNamespaceName:compatibilityVersion:defaultsFileURL:teamId:appContainerId:appContainerType:cloudKitContainerId:completion:", v15, a4, v16, v17, v18, a8, v29, v32);
  v23 = (void *)v45[5];
  if (!v23)
  {
    v23 = (void *)v34[5];
    if (!v23)
    {
      v24 = *((_BYTE *)v40 + 24) != 0;
      goto LABEL_14;
    }
    if (a10)
      goto LABEL_9;
LABEL_12:
    v24 = 0;
    goto LABEL_14;
  }
  if (!a10)
    goto LABEL_12;
LABEL_9:
  v24 = 0;
  *a10 = objc_retainAutorelease(v23);
LABEL_14:

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v44, 8);
  return v24;
}

void __172__TRIXPCInternalServiceClient_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_withTeamId_appContainerId_appContainerType_cloudKitContainerId_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __172__TRIXPCInternalServiceClient_registerNamespaceWithNamespaceName_compatibilityVersion_defaultsFileURL_withTeamId_appContainerId_appContainerType_cloudKitContainerId_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)deregisterNamespaceWithNamespaceName:(id)a3 withTeamId:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v18;
  void *v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCInternalServiceClient.m"), 348, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCInternalServiceClient.m"), 349, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("teamId"));

LABEL_3:
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__42;
  v36 = __Block_byref_object_dispose__42;
  v12 = MEMORY[0x1E0C809B0];
  v37 = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __85__TRIXPCInternalServiceClient_deregisterNamespaceWithNamespaceName_withTeamId_error___block_invoke;
  v31[3] = &unk_1E9333890;
  v31[4] = &v32;
  v13 = (void *)MEMORY[0x1D8232C48](v31);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__42;
  v25 = __Block_byref_object_dispose__42;
  v26 = 0;
  -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_helper, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __85__TRIXPCInternalServiceClient_deregisterNamespaceWithNamespaceName_withTeamId_error___block_invoke_2;
  v20[3] = &unk_1E9335540;
  v20[4] = &v27;
  v20[5] = &v21;
  objc_msgSend(v14, "deregisterNamespaceWithNamespaceName:teamId:completion:", v9, v11, v20);
  v15 = (void *)v33[5];
  if (!v15)
  {
    v15 = (void *)v22[5];
    if (!v15)
    {
      v16 = *((_BYTE *)v28 + 24) != 0;
      goto LABEL_10;
    }
    if (a5)
      goto LABEL_5;
LABEL_8:
    v16 = 0;
    goto LABEL_10;
  }
  if (!a5)
    goto LABEL_8;
LABEL_5:
  v16 = 0;
  *a5 = objc_retainAutorelease(v15);
LABEL_10:

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v32, 8);
  return v16;
}

void __85__TRIXPCInternalServiceClient_deregisterNamespaceWithNamespaceName_withTeamId_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __85__TRIXPCInternalServiceClient_deregisterNamespaceWithNamespaceName_withTeamId_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)startNamespaceDownloadWithName:(id)a3 withTeamId:(id)a4 options:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  BOOL v20;
  void *v22;
  void *v23;
  id *v24;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  _QWORD v36[5];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCInternalServiceClient.m"), 387, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  v24 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCInternalServiceClient.m"), 388, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("teamId"));

  }
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__42;
  v41 = __Block_byref_object_dispose__42;
  v14 = MEMORY[0x1E0C809B0];
  v42 = 0;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __87__TRIXPCInternalServiceClient_startNamespaceDownloadWithName_withTeamId_options_error___block_invoke;
  v36[3] = &unk_1E9333890;
  v36[4] = &v37;
  v15 = (void *)MEMORY[0x1D8232C48](v36);
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__42;
  v30 = __Block_byref_object_dispose__42;
  v31 = 0;
  -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_helper, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v13;
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __87__TRIXPCInternalServiceClient_startNamespaceDownloadWithName_withTeamId_options_error___block_invoke_2;
  v25[3] = &unk_1E9335540;
  v25[4] = &v32;
  v25[5] = &v26;
  objc_msgSend(v16, "startDownloadNamespaceWithName:teamId:options:completion:", v11, v12, v13, v25);
  v18 = (void *)v38[5];
  if (!v18)
  {
    v18 = (void *)v27[5];
    v19 = v24;
    if (!v18)
    {
      v20 = *((_BYTE *)v33 + 24) != 0;
      goto LABEL_12;
    }
    if (v24)
      goto LABEL_7;
LABEL_10:
    v20 = 0;
    goto LABEL_12;
  }
  v19 = v24;
  if (!v24)
    goto LABEL_10;
LABEL_7:
  v20 = 0;
  *v19 = objc_retainAutorelease(v18);
LABEL_12:

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v37, 8);
  return v20;
}

void __87__TRIXPCInternalServiceClient_startNamespaceDownloadWithName_withTeamId_options_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __87__TRIXPCInternalServiceClient_startNamespaceDownloadWithName_withTeamId_options_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (id)dynamicNamespaceRecordsWithError:(id *)a3
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
  v17 = __Block_byref_object_copy__42;
  v18 = __Block_byref_object_dispose__42;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__42;
  v12 = __Block_byref_object_dispose__42;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__TRIXPCInternalServiceClient_dynamicNamespaceRecordsWithError___block_invoke;
  v7[3] = &unk_1E93354C8;
  v7[4] = &v14;
  v7[5] = &v8;
  if (!-[TRIXPCInternalServiceClient _performSyncXpcWithError:block:](self, "_performSyncXpcWithError:block:", a3, v7))
    goto LABEL_5;
  v4 = (void *)v9[5];
  if (!v4)
  {
    v5 = (id)v15[5];
    goto LABEL_7;
  }
  if (a3)
  {
    v5 = 0;
    *a3 = objc_retainAutorelease(v4);
  }
  else
  {
LABEL_5:
    v5 = 0;
  }
LABEL_7:
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

uint64_t __64__TRIXPCInternalServiceClient_dynamicNamespaceRecordsWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__TRIXPCInternalServiceClient_dynamicNamespaceRecordsWithError___block_invoke_2;
  v3[3] = &unk_1E93354A0;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "dynamicNamespaceRecordsWithCompletion:", v3);
}

void __64__TRIXPCInternalServiceClient_dynamicNamespaceRecordsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (id)activeExperimentIdsForNamespaceName:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__42;
  v25 = __Block_byref_object_dispose__42;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__42;
  v19 = __Block_byref_object_dispose__42;
  v20 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__TRIXPCInternalServiceClient_activeExperimentIdsForNamespaceName_error___block_invoke;
  v11[3] = &unk_1E93356E8;
  v7 = v6;
  v12 = v7;
  v13 = &v21;
  v14 = &v15;
  if (!-[TRIXPCInternalServiceClient _performSyncXpcWithError:block:](self, "_performSyncXpcWithError:block:", a4, v11))
    goto LABEL_5;
  v8 = (void *)v16[5];
  if (!v8)
  {
    v9 = (id)v22[5];
    goto LABEL_7;
  }
  if (a4)
  {
    v9 = 0;
    *a4 = objc_retainAutorelease(v8);
  }
  else
  {
LABEL_5:
    v9 = 0;
  }
LABEL_7:

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

uint64_t __73__TRIXPCInternalServiceClient_activeExperimentIdsForNamespaceName_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__TRIXPCInternalServiceClient_activeExperimentIdsForNamespaceName_error___block_invoke_2;
  v4[3] = &unk_1E93354A0;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "experimentIdsWithActiveStateAndNamespaceName:completion:", v2, v4);
}

void __73__TRIXPCInternalServiceClient_activeExperimentIdsForNamespaceName_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (id)subscriptionForNamespaceName:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__42;
  v25 = __Block_byref_object_dispose__42;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__42;
  v19 = __Block_byref_object_dispose__42;
  v20 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__TRIXPCInternalServiceClient_subscriptionForNamespaceName_error___block_invoke;
  v11[3] = &unk_1E93356E8;
  v7 = v6;
  v12 = v7;
  v13 = &v21;
  v14 = &v15;
  if (-[TRIXPCInternalServiceClient _performSyncXpcWithError:block:](self, "_performSyncXpcWithError:block:", a4, v11))
  {
    v8 = (void *)v16[5];
    if (!v8)
    {
      v9 = (id)v22[5];
      goto LABEL_6;
    }
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }
  v9 = (id)MEMORY[0x1E0C9AA60];
LABEL_6:

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

uint64_t __66__TRIXPCInternalServiceClient_subscriptionForNamespaceName_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__TRIXPCInternalServiceClient_subscriptionForNamespaceName_error___block_invoke_2;
  v4[3] = &unk_1E93354A0;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "subscriptionForNamespaceName:completion:", v2, v4);
}

void __66__TRIXPCInternalServiceClient_subscriptionForNamespaceName_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (BOOL)setSubscription:(id)a3 namespaceName:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCInternalServiceClient.m"), 496, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorNames"));

  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__42;
  v26 = __Block_byref_object_dispose__42;
  v27 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67__TRIXPCInternalServiceClient_setSubscription_namespaceName_error___block_invoke;
  v17[3] = &unk_1E9335568;
  v11 = v9;
  v18 = v11;
  v12 = v10;
  v19 = v12;
  v20 = &v28;
  v21 = &v22;
  if (!-[TRIXPCInternalServiceClient _performSyncXpcWithError:block:](self, "_performSyncXpcWithError:block:", a5, v17))
    goto LABEL_7;
  v13 = (void *)v23[5];
  if (!v13)
  {
    v14 = *((_BYTE *)v29 + 24) != 0;
    goto LABEL_9;
  }
  if (a5)
  {
    v14 = 0;
    *a5 = objc_retainAutorelease(v13);
  }
  else
  {
LABEL_7:
    v14 = 0;
  }
LABEL_9:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v14;
}

uint64_t __67__TRIXPCInternalServiceClient_setSubscription_namespaceName_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__TRIXPCInternalServiceClient_setSubscription_namespaceName_error___block_invoke_2;
  v5[3] = &unk_1E9335540;
  v6 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(a2, "setSubscription:namespaceName:completion:", v2, v3, v5);
}

void __67__TRIXPCInternalServiceClient_setSubscription_namespaceName_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)immediatelySchedulePostUpgradeActivityWithError:(id *)a3
{
  void *v4;
  BOOL v5;
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
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__42;
  v12 = __Block_byref_object_dispose__42;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__TRIXPCInternalServiceClient_immediatelySchedulePostUpgradeActivityWithError___block_invoke;
  v7[3] = &unk_1E93354C8;
  v7[4] = &v14;
  v7[5] = &v8;
  if (!-[TRIXPCInternalServiceClient _performSyncXpcWithError:block:](self, "_performSyncXpcWithError:block:", a3, v7))
    goto LABEL_5;
  v4 = (void *)v9[5];
  if (!v4)
  {
    v5 = *((_BYTE *)v15 + 24) != 0;
    goto LABEL_7;
  }
  if (a3)
  {
    v5 = 0;
    *a3 = objc_retainAutorelease(v4);
  }
  else
  {
LABEL_5:
    v5 = 0;
  }
LABEL_7:
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

uint64_t __79__TRIXPCInternalServiceClient_immediatelySchedulePostUpgradeActivityWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__TRIXPCInternalServiceClient_immediatelySchedulePostUpgradeActivityWithError___block_invoke_2;
  v3[3] = &unk_1E9335540;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "immediatelySchedulePostUpgradeActivityWithCompletion:", v3);
}

void __79__TRIXPCInternalServiceClient_immediatelySchedulePostUpgradeActivityWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helper, 0);
}

@end
