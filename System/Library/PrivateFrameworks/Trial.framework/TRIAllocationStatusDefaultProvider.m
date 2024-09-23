@implementation TRIAllocationStatusDefaultProvider

- (TRIAllocationStatusDefaultProvider)init
{
  TRIAllocationStatusDefaultProvider *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  _PASXPCClientHelper *clientHelper;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  _PASXPCClientHelper *internalHelper;
  _QWORD *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  _PASLock *lock;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)TRIAllocationStatusDefaultProvider;
  v2 = -[TRIAllocationStatusDefaultProvider init](&v49, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4160C8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1A1AC6B8C]();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion_, 0, 1);

    v6 = (void *)MEMORY[0x1A1AC6B8C]();
    v7 = objc_alloc(MEMORY[0x1E0C99E60]);
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion_, 1, 1);

    v10 = (void *)MEMORY[0x1A1AC6B8C]();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion_, 2, 1);

    v12 = (void *)MEMORY[0x1A1AC6B8C]();
    v13 = objc_alloc(MEMORY[0x1E0C99E60]);
    v14 = objc_opt_class();
    v15 = (void *)objc_msgSend(v13, "initWithObjects:", v14, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion_, 0, 1);

    v16 = (void *)MEMORY[0x1A1AC6B8C]();
    v17 = objc_alloc(MEMORY[0x1E0C99E60]);
    v18 = objc_opt_class();
    v19 = (void *)objc_msgSend(v17, "initWithObjects:", v18, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v16);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_rolloutRecordsWithCompletion_, 0, 1);

    v20 = (void *)MEMORY[0x1A1AC6B8C]();
    v21 = objc_alloc(MEMORY[0x1E0C99E60]);
    v22 = objc_opt_class();
    v23 = (void *)objc_msgSend(v21, "initWithObjects:", v22, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v20);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_bmltRecordsWithCompletion_, 0, 1);

    v24 = (void *)MEMORY[0x1A1AC6B8C]();
    v25 = objc_alloc(MEMORY[0x1E0C99E60]);
    v26 = objc_opt_class();
    v27 = (void *)objc_msgSend(v25, "initWithObjects:", v26, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v24);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_rolloutAllocationStatusWithPrivacyFilterPolicy_completion_, 0, 1);

    v28 = objc_alloc(MEMORY[0x1E0D81640]);
    TRILogCategory_ClientFramework();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "initWithServiceName:allowlistedServerInterface:allowlistedClientInterface:serverInitiatedRequestHandler:allowSystemToUserConnection:interruptionHandler:invalidationHandler:logHandle:", CFSTR("com.apple.trial.status"), v3, 0, 0, 1, &__block_literal_global_18, &__block_literal_global_86, v29);
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = (_PASXPCClientHelper *)v30;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE416008);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x1A1AC6B8C]();
    v34 = objc_alloc(MEMORY[0x1E0C99E60]);
    v35 = objc_opt_class();
    v36 = objc_opt_class();
    v37 = objc_opt_class();
    v38 = (void *)objc_msgSend(v34, "initWithObjects:", v35, v36, v37, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v33);
    objc_msgSend(v32, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_activeExperimentInformationWithPrivacyFilterPolicy_completion_, 0, 1);

    v39 = objc_alloc(MEMORY[0x1E0D81640]);
    TRILogCategory_ClientFramework();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "initWithServiceName:allowlistedServerInterface:allowlistedClientInterface:serverInitiatedRequestHandler:allowSystemToUserConnection:interruptionHandler:invalidationHandler:logHandle:", CFSTR("com.apple.triald.internal"), v32, 0, 0, 1, &__block_literal_global_133, &__block_literal_global_134, v40);
    internalHelper = v2->_internalHelper;
    v2->_internalHelper = (_PASXPCClientHelper *)v41;

    v43 = (_QWORD *)objc_opt_new();
    v44 = objc_opt_new();
    v45 = (void *)v43[1];
    v43[1] = v44;

    v46 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v43);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v46;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_139);
  v3.receiver = self;
  v3.super_class = (Class)TRIAllocationStatusDefaultProvider;
  -[TRIAllocationStatusDefaultProvider dealloc](&v3, sel_dealloc);
}

void __45__TRIAllocationStatusDefaultProvider_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a2 + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        notify_cancel(objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "intValue", (_QWORD)v7));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)syncProxyWithErrorHandler:(id)a3
{
  return (id)-[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_clientHelper, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
}

- (id)_defaultQueue
{
  if (qword_1ECED7D30 != -1)
    dispatch_once(&qword_1ECED7D30, &__block_literal_global_142);
  return (id)_MergedGlobals_1;
}

void __51__TRIAllocationStatusDefaultProvider__defaultQueue__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A1AC6B8C]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.trial.status", 17);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v1;

  objc_autoreleasePoolPop(v0);
}

- (id)enumerateExperimentStatusesForEnvironment:(int)a3 startingFromCursor:(id)a4 error:(id *)a5 block:(id)a6
{
  return -[TRIAllocationStatusDefaultProvider enumerateExperimentStatusesForEnvironment:privacyFilterPolicy:startingFromCursor:error:block:](self, "enumerateExperimentStatusesForEnvironment:privacyFilterPolicy:startingFromCursor:error:block:", *(_QWORD *)&a3, 1, a4, a5, a6);
}

- (id)enumerateExperimentStatusesForTestingPrivacyFilterPolicyWithEnvironment:(int)a3 startingFromCursor:(id)a4 error:(id *)a5 block:(id)a6
{
  return -[TRIAllocationStatusDefaultProvider enumerateExperimentStatusesForEnvironment:privacyFilterPolicy:startingFromCursor:error:block:](self, "enumerateExperimentStatusesForEnvironment:privacyFilterPolicy:startingFromCursor:error:block:", *(_QWORD *)&a3, 2, a4, a5, a6);
}

- (id)enumerateExperimentStatusesForEnvironment:(int)a3 privacyFilterPolicy:(unsigned __int8)a4 startingFromCursor:(id)a5 error:(id *)a6 block:(id)a7
{
  dispatch_semaphore_t v9;
  NSObject *v10;
  TRIAllocationStatusCursor *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  char v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  TRIExperimentAllocationStatus *v32;
  __CFString *v33;
  BOOL v34;
  TRIExperimentAllocationStatus *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  int v42;
  void *v44;
  TRIAllocationStatusCursor *v45;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  void (**v51)(id, void *, uint8_t *);
  unsigned int v54;
  NSObject *v55;
  void *v56;
  void *v58;
  id obj;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[4];
  NSObject *v68;
  uint64_t *v69;
  uint64_t *v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t (*v94)(uint64_t, uint64_t);
  void (*v95)(uint64_t);
  id v96;
  _QWORD v97[4];
  NSObject *v98;
  uint8_t *v99;
  uint8_t v100[8];
  uint8_t *v101;
  uint64_t v102;
  uint64_t (*v103)(uint64_t, uint64_t);
  void (*v104)(uint64_t);
  id v105;
  uint8_t v106[128];
  uint8_t buf[4];
  void *v108;
  uint64_t v109;
  _QWORD v110[3];

  v54 = a4;
  v110[1] = *MEMORY[0x1E0C80C00];
  v49 = a5;
  v51 = (void (**)(id, void *, uint8_t *))a7;
  if (!v51)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAllocationStatusProvider.m"), 224, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  if (+[TRIMisc unsafeFirstAuthenticationState](TRIMisc, "unsafeFirstAuthenticationState"))
  {
    v9 = dispatch_semaphore_create(0);
    *(_QWORD *)v100 = 0;
    v101 = v100;
    v102 = 0x3032000000;
    v103 = __Block_byref_object_copy__7;
    v104 = __Block_byref_object_dispose__7;
    v105 = 0;
    v97[0] = MEMORY[0x1E0C809B0];
    v97[1] = 3221225472;
    v97[2] = __131__TRIAllocationStatusDefaultProvider_enumerateExperimentStatusesForEnvironment_privacyFilterPolicy_startingFromCursor_error_block___block_invoke;
    v97[3] = &unk_1E3BFF930;
    v99 = v100;
    v55 = v9;
    v98 = v55;
    v48 = (void *)MEMORY[0x1A1AC6D30](v97);
    -[_PASXPCClientHelper remoteObjectProxyWithErrorHandler:](self->_clientHelper, "remoteObjectProxyWithErrorHandler:", v48);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
      objc_msgSend(v49, "date");
    else
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v50 = *MEMORY[0x1E0CB2D50];
    while (1)
    {
      if (v12)
      {
        v45 = [TRIAllocationStatusCursor alloc];
        objc_msgSend(v58, "timeIntervalSince1970");
        v11 = -[TRIAllocationStatusCursor initWithSecondsFromEpoch:](v45, "initWithSecondsFromEpoch:");
        goto LABEL_58;
      }
      v91 = 0;
      v92 = &v91;
      v93 = 0x3032000000;
      v94 = __Block_byref_object_copy__7;
      v95 = __Block_byref_object_dispose__7;
      v96 = 0;
      v85 = 0;
      v86 = &v85;
      v87 = 0x3032000000;
      v88 = __Block_byref_object_copy__7;
      v89 = __Block_byref_object_dispose__7;
      v90 = 0;
      v79 = 0;
      v80 = &v79;
      v81 = 0x3032000000;
      v82 = __Block_byref_object_copy__7;
      v83 = __Block_byref_object_dispose__7;
      v84 = 0;
      v73 = 0;
      v74 = &v73;
      v75 = 0x3032000000;
      v76 = __Block_byref_object_copy__7;
      v77 = __Block_byref_object_dispose__7;
      v78 = 0;
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __131__TRIAllocationStatusDefaultProvider_enumerateExperimentStatusesForEnvironment_privacyFilterPolicy_startingFromCursor_error_block___block_invoke_2;
      v67[3] = &unk_1E3BFF958;
      v13 = v55;
      v68 = v13;
      v69 = &v91;
      v70 = &v85;
      v71 = &v79;
      v72 = &v73;
      objc_msgSend(v56, "experimentHistoryRecordsWithLimit:newerThanDate:privacyFilterPolicy:deploymentEnvironment:completion:", 100, v58, v54, a3, v67);
      if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v13, 10.0))
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("Timeout while attempting to invoke method on TRIXPCStatusServiceProtocol proxy object from: %@."), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (a6)
        {
          v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v109 = v50;
          v110[0] = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, &v109, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *a6 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 7, v18);

        }
        TRILogCategory_ClientFramework();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v108 = v44;
          _os_log_error_impl(&dword_19B89C000, v19, OS_LOG_TYPE_ERROR, "Timeout while attempting to invoke method on TRIXPCStatusServiceProtocol proxy object from: %@.", buf, 0xCu);

        }
      }
      else
      {
        v21 = (void *)*((_QWORD *)v101 + 5);
        if (v21)
        {
          if (a6)
          {
            v22 = objc_retainAutorelease(v21);
LABEL_25:
            v12 = 0;
            v20 = 0;
            *a6 = v22;
            goto LABEL_20;
          }
        }
        else
        {
          if (v92[5])
          {
            v23 = (void *)v74[5];
            if (v23)
            {
              v24 = v23;

              v58 = v24;
            }
            +[TRIAllocationStatus internalToExternalStatusMapping](TRIAllocationStatus, "internalToExternalStatusMapping");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            buf[0] = 0;
            v65 = 0u;
            v66 = 0u;
            v63 = 0u;
            v64 = 0u;
            obj = (id)v92[5];
            v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v106, 16);
            if (!v25)
            {
LABEL_48:

              v12 = objc_msgSend((id)v80[5], "intValue") < 0x64 || buf[0] != 0;
              v20 = 1;
              goto LABEL_20;
            }
            v60 = *(_QWORD *)v64;
            while (2)
            {
              v26 = 0;
              v61 = v25;
LABEL_32:
              if (*(_QWORD *)v64 != v60)
                objc_enumerationMutation(obj);
              v27 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v26);
              v28 = (void *)MEMORY[0x1A1AC6B8C]();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v27, "eventType"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "objectForKeyedSubscript:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v30, "intValue");

              if (!v31)
                goto LABEL_40;
              objc_msgSend(v27, "namespaces");
              v32 = (TRIExperimentAllocationStatus *)objc_claimAutoreleasedReturnValue();
              if (!v32)
                goto LABEL_40;
              objc_msgSend(v27, "treatmentId");
              v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (v33 == CFSTR("unspecified-or-default-treatment"))
              {
                v42 = 7;
                goto LABEL_43;
              }
              v34 = objc_msgSend(v27, "deploymentId") == -1;

              if (!v34)
              {
                v35 = [TRIExperimentAllocationStatus alloc];
                objc_msgSend(v27, "eventDate");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "experimentId");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_msgSend(v27, "deploymentId");
                objc_msgSend(v27, "treatmentId");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "namespaces");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = -[TRIExperimentAllocationStatus initWithType:date:experimentId:deploymentId:treatmentId:namespaces:](v35, "initWithType:date:experimentId:deploymentId:treatmentId:namespaces:", v31, v36, v37, v38, v39, v40);

                v51[2](v51, v32, buf);
                if (buf[0])
                {
                  objc_msgSend(v27, "eventDate");
                  v41 = objc_claimAutoreleasedReturnValue();

                  v42 = 6;
                  v58 = (void *)v41;
                }
                else
                {
                  v42 = 0;
                }
LABEL_43:

              }
              else
              {
LABEL_40:
                v42 = 7;
              }
              objc_autoreleasePoolPop(v28);
              if (v42 != 7 && v42)
                goto LABEL_48;
              if (v61 == ++v26)
              {
                v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v106, 16);
                if (!v25)
                  goto LABEL_48;
                continue;
              }
              goto LABEL_32;
            }
          }
          if (a6)
          {
            v22 = objc_retainAutorelease((id)v86[5]);
            goto LABEL_25;
          }
        }
      }
      v12 = 0;
      v20 = 0;
LABEL_20:

      _Block_object_dispose(&v73, 8);
      _Block_object_dispose(&v79, 8);

      _Block_object_dispose(&v85, 8);
      _Block_object_dispose(&v91, 8);

      if ((v20 & 1) == 0)
      {
        v11 = 0;
LABEL_58:

        _Block_object_dispose(v100, 8);
        goto LABEL_59;
      }
    }
  }
  TRILogCategory_ClientFramework();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v100 = 0;
    _os_log_error_impl(&dword_19B89C000, v10, OS_LOG_TYPE_ERROR, "unable to enumerate experiment statuses while device is class C locked", v100, 2u);
  }

  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 5, 0);
    v11 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_59:

  return v11;
}

void __131__TRIAllocationStatusDefaultProvider_enumerateExperimentStatusesForEnvironment_privacyFilterPolicy_startingFromCursor_error_block___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __131__TRIAllocationStatusDefaultProvider_enumerateExperimentStatusesForEnvironment_privacyFilterPolicy_startingFromCursor_error_block___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __131__TRIAllocationStatusDefaultProvider_enumerateExperimentStatusesForEnvironment_privacyFilterPolicy_startingFromCursor_error_block___block_invoke_3;
  v18[3] = &unk_1E3BFE828;
  v19 = *(id *)(a1 + 32);
  v14 = (void (**)(_QWORD))MEMORY[0x1A1AC6D30](v18);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a5);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v12;
  v17 = v12;

  if (v14)
    v14[2](v14);

}

intptr_t __131__TRIAllocationStatusDefaultProvider_enumerateExperimentStatusesForEnvironment_privacyFilterPolicy_startingFromCursor_error_block___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)enumerateActiveExperimentsForEnvironment:(int)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v6;
  void (**v9)(id, _QWORD, uint8_t *);
  dispatch_semaphore_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  BOOL v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  NSObject *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _QWORD v58[4];
  NSObject *v59;
  uint8_t *v60;
  uint8_t v61[128];
  uint8_t buf[4];
  void *v63;
  uint64_t v64;
  void *v65;
  uint8_t v66[8];
  uint8_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint64_t v72;

  v6 = *(_QWORD *)&a3;
  v72 = *MEMORY[0x1E0C80C00];
  v9 = (void (**)(id, _QWORD, uint8_t *))a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAllocationStatusProvider.m"), 324, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  if (+[TRIMisc unsafeFirstAuthenticationState](TRIMisc, "unsafeFirstAuthenticationState"))
  {
    v10 = dispatch_semaphore_create(0);
    *(_QWORD *)v66 = 0;
    v67 = v66;
    v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__7;
    v70 = __Block_byref_object_dispose__7;
    v11 = MEMORY[0x1E0C809B0];
    v71 = 0;
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __91__TRIAllocationStatusDefaultProvider_enumerateActiveExperimentsForEnvironment_error_block___block_invoke;
    v58[3] = &unk_1E3BFF930;
    v60 = v66;
    v12 = v10;
    v59 = v12;
    v13 = (void *)MEMORY[0x1A1AC6D30](v58);
    -[_PASXPCClientHelper remoteObjectProxyWithErrorHandler:](self->_clientHelper, "remoteObjectProxyWithErrorHandler:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    v53 = &v52;
    v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__7;
    v56 = __Block_byref_object_dispose__7;
    v57 = 0;
    v46 = 0;
    v47 = &v46;
    v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__7;
    v50 = __Block_byref_object_dispose__7;
    v51 = 0;
    v15 = (void *)MEMORY[0x1A1AC6B8C]();
    v16 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithObjects:", v17, 0);

    objc_autoreleasePoolPop(v15);
    v42[0] = v11;
    v42[1] = 3221225472;
    v42[2] = __91__TRIAllocationStatusDefaultProvider_enumerateActiveExperimentsForEnvironment_error_block___block_invoke_2;
    v42[3] = &unk_1E3BFF980;
    v19 = v12;
    v43 = v19;
    v44 = &v46;
    v45 = &v52;
    objc_msgSend(v14, "experimentRecordsWithDeploymentEnvironments:privacyFilterPolicy:completion:", v18, 1, v42);

    if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v19, 10.0))
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("Timeout while attempting to invoke method on TRIXPCStatusServiceProtocol proxy object from: %@."), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4)
      {
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v64 = *MEMORY[0x1E0CB2D50];
        v65 = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 7, v24);

      }
      TRILogCategory_ClientFramework();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v63 = v36;
        _os_log_error_impl(&dword_19B89C000, v25, OS_LOG_TYPE_ERROR, "Timeout while attempting to invoke method on TRIXPCStatusServiceProtocol proxy object from: %@.", buf, 0xCu);

      }
      goto LABEL_10;
    }
    v28 = (void *)*((_QWORD *)v67 + 5);
    if (v28)
    {
      if (!a4)
      {
LABEL_10:
        v26 = 0;
LABEL_11:

        _Block_object_dispose(&v46, 8);
        _Block_object_dispose(&v52, 8);

        _Block_object_dispose(v66, 8);
        goto LABEL_21;
      }
      v29 = objc_retainAutorelease(v28);
    }
    else
    {
      v31 = (void *)v53[5];
      if (v31)
      {
        buf[0] = 0;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v32 = v31;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v38, v61, 16);
        if (v33)
        {
          v34 = *(_QWORD *)v39;
LABEL_25:
          v35 = 0;
          while (1)
          {
            if (*(_QWORD *)v39 != v34)
              objc_enumerationMutation(v32);
            v9[2](v9, *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v35), buf);
            if (buf[0])
              break;
            if (v33 == ++v35)
            {
              v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v38, v61, 16);
              if (v33)
                goto LABEL_25;
              break;
            }
          }
        }

        v26 = 1;
        goto LABEL_11;
      }
      if (!a4)
        goto LABEL_10;
      v29 = objc_retainAutorelease((id)v47[5]);
    }
    v26 = 0;
    *a4 = v29;
    goto LABEL_11;
  }
  TRILogCategory_ClientFramework();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v66 = 67240192;
    *(_DWORD *)&v66[4] = qos_class_self();
    _os_log_error_impl(&dword_19B89C000, v27, OS_LOG_TYPE_ERROR, "unable to enumerate active experiments while device is class C locked qos:%{public}u", v66, 8u);
  }

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 5, 0);
    v26 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }
LABEL_21:

  return v26;
}

void __91__TRIAllocationStatusDefaultProvider_enumerateActiveExperimentsForEnvironment_error_block___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __91__TRIAllocationStatusDefaultProvider_enumerateActiveExperimentsForEnvironment_error_block___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  TRIVersionedNamespace *v17;
  void *v18;
  TRIVersionedNamespace *v19;
  TRIExperimentAllocationStatus *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  TRIExperimentAllocationStatus *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  id obj;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v32 = a2;
  v30 = a3;
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __91__TRIAllocationStatusDefaultProvider_enumerateActiveExperimentsForEnvironment_error_block___block_invoke_3;
  v48[3] = &unk_1E3BFE828;
  v33 = a1;
  v49 = *(id *)(a1 + 32);
  v31 = (id)MEMORY[0x1A1AC6D30](v48);
  if (v32)
  {
    v5 = objc_opt_new();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v32;
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16, v30);
    if (v38)
    {
      v37 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v45 != v37)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          if (objc_msgSend(v8, "status") == 1)
          {
            objc_msgSend(v8, "treatmentId");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = v9 == 0;

            if (!v10)
            {
              v11 = (void *)objc_opt_new();
              v42 = 0u;
              v43 = 0u;
              v40 = 0u;
              v41 = 0u;
              objc_msgSend(v8, "namespaces");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
              if (v13)
              {
                v14 = *(_QWORD *)v41;
                do
                {
                  for (j = 0; j != v13; ++j)
                  {
                    if (*(_QWORD *)v41 != v14)
                      objc_enumerationMutation(v12);
                    v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
                    v17 = [TRIVersionedNamespace alloc];
                    objc_msgSend(v16, "name");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    v19 = -[TRIVersionedNamespace initWithName:compatibilityVersion:](v17, "initWithName:compatibilityVersion:", v18, objc_msgSend(v16, "compatibilityVersion"));
                    objc_msgSend(v11, "addObject:", v19);

                  }
                  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
                }
                while (v13);
              }

              v36 = *(void **)(*(_QWORD *)(*(_QWORD *)(v33 + 48) + 8) + 40);
              v20 = [TRIExperimentAllocationStatus alloc];
              objc_msgSend(v8, "startDate");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = v21;
              if (!v21)
              {
                v34 = (void *)objc_opt_new();
                v22 = v34;
              }
              objc_msgSend(v8, "experimentDeployment");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "experimentId");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "experimentDeployment");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "deploymentId");
              objc_msgSend(v8, "treatmentId");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = -[TRIExperimentAllocationStatus initWithType:date:experimentId:deploymentId:treatmentId:namespaces:](v20, "initWithType:date:experimentId:deploymentId:treatmentId:namespaces:", 2, v22, v24, v26, v27, v11);
              objc_msgSend(v36, "addObject:", v28);

              if (!v21)
            }
          }
        }
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
      }
      while (v38);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  v29 = v31;
  if (v31)
  {
    (*((void (**)(void))v31 + 2))();
    v29 = v31;
  }

}

intptr_t __91__TRIAllocationStatusDefaultProvider_enumerateActiveExperimentsForEnvironment_error_block___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)enumerateSampledActiveExperimentsForEnvironment:(int)a3 correlationID:(id)a4 error:(id *)a5 block:(id)a6
{
  uint64_t v8;
  id v11;
  void (**v12)(id, uint64_t, unsigned __int8 *);
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  unsigned __int8 v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v8 = *(_QWORD *)&a3;
  v35 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = (void (**)(id, uint64_t, unsigned __int8 *))a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAllocationStatusProvider.m"), 412, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__7;
  v32 = __Block_byref_object_dispose__7;
  v33 = (id)objc_opt_new();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __112__TRIAllocationStatusDefaultProvider_enumerateSampledActiveExperimentsForEnvironment_correlationID_error_block___block_invoke;
  v27[3] = &unk_1E3BFF9A8;
  v27[4] = &v28;
  -[TRIAllocationStatusDefaultProvider enumerateActiveExperimentsForEnvironment:error:block:](self, "enumerateActiveExperimentsForEnvironment:error:block:", v8, a5, v27);
  if ((_DWORD)v8 || objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
  {
    v13 = (id)v29[5];
  }
  else
  {
    +[TRIAllocationStatus sampleAllocationStatuses:correlationId:nrSamples:](TRIAllocationStatus, "sampleAllocationStatuses:correlationId:nrSamples:", v29[5], v11, 2);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = 0;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v23;
LABEL_8:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v16)
        objc_enumerationMutation(v14);
      v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17);
      v19 = (void *)MEMORY[0x1A1AC6B8C]();
      v12[2](v12, v18, &v26);
      LODWORD(v18) = v26;
      objc_autoreleasePoolPop(v19);
      if ((_DWORD)v18)
        break;
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
        if (v15)
          goto LABEL_8;
        break;
      }
    }
  }

  _Block_object_dispose(&v28, 8);
  return 1;
}

uint64_t __112__TRIAllocationStatusDefaultProvider_enumerateSampledActiveExperimentsForEnvironment_correlationID_error_block___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
}

- (id)activeExperimentInformationWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[5];
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (+[TRIMisc unsafeFirstAuthenticationState](TRIMisc, "unsafeFirstAuthenticationState"))
  {
    *(_QWORD *)buf = 0;
    v21 = buf;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__7;
    v24 = __Block_byref_object_dispose__7;
    v5 = MEMORY[0x1E0C809B0];
    v25 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __75__TRIAllocationStatusDefaultProvider_activeExperimentInformationWithError___block_invoke;
    v19[3] = &unk_1E3BFE738;
    v19[4] = buf;
    v6 = (void *)MEMORY[0x1A1AC6D30](v19);
    -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_internalHelper, "synchronousRemoteObjectProxyWithErrorHandler:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__7;
    v17 = __Block_byref_object_dispose__7;
    v18 = 0;
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __75__TRIAllocationStatusDefaultProvider_activeExperimentInformationWithError___block_invoke_2;
    v12[3] = &unk_1E3BFF9D0;
    v12[4] = &v13;
    objc_msgSend(v7, "activeExperimentInformationWithPrivacyFilterPolicy:completion:", 1, v12);
    v8 = (void *)*((_QWORD *)v21 + 5);
    if (v8)
    {
      v9 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v8);
    }
    else
    {
      v9 = (id)v14[5];
    }
    _Block_object_dispose(&v13, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    TRILogCategory_ClientFramework();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&buf[4] = qos_class_self();
      _os_log_error_impl(&dword_19B89C000, v10, OS_LOG_TYPE_ERROR, "unable to fetch active experiments while device is class C locked qos:%{public}u", buf, 8u);
    }

    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 5, 0);
      v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  return v9;
}

void __75__TRIAllocationStatusDefaultProvider_activeExperimentInformationWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __75__TRIAllocationStatusDefaultProvider_activeExperimentInformationWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)enumerateActiveRolloutsWithError:(id *)a3 block:(id)a4
{
  void (**v7)(id, _QWORD, uint8_t *);
  dispatch_semaphore_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  NSObject *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _QWORD v53[4];
  NSObject *v54;
  uint8_t *v55;
  uint8_t v56[8];
  uint8_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint8_t v62[128];
  uint8_t buf[4];
  void *v64;
  uint64_t v65;
  _QWORD v66[3];

  v66[1] = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _QWORD, uint8_t *))a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAllocationStatusProvider.m"), 473, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  if (+[TRIMisc unsafeFirstAuthenticationState](TRIMisc, "unsafeFirstAuthenticationState"))
  {
    v8 = dispatch_semaphore_create(0);
    *(_QWORD *)v56 = 0;
    v57 = v56;
    v58 = 0x3032000000;
    v59 = __Block_byref_object_copy__7;
    v60 = __Block_byref_object_dispose__7;
    v9 = MEMORY[0x1E0C809B0];
    v61 = 0;
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __77__TRIAllocationStatusDefaultProvider_enumerateActiveRolloutsWithError_block___block_invoke;
    v53[3] = &unk_1E3BFF930;
    v55 = v56;
    v10 = v8;
    v54 = v10;
    v11 = MEMORY[0x1A1AC6D30](v53);
    -[_PASXPCClientHelper remoteObjectProxyWithErrorHandler:](self->_clientHelper, "remoteObjectProxyWithErrorHandler:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    v48 = &v47;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__7;
    v51 = __Block_byref_object_dispose__7;
    v52 = 0;
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__7;
    v45 = __Block_byref_object_dispose__7;
    v46 = 0;
    v37[0] = v9;
    v37[1] = 3221225472;
    v37[2] = __77__TRIAllocationStatusDefaultProvider_enumerateActiveRolloutsWithError_block___block_invoke_2;
    v37[3] = &unk_1E3BFF980;
    v13 = v10;
    v38 = v13;
    v39 = &v41;
    v40 = &v47;
    objc_msgSend(v12, "rolloutAllocationStatusWithPrivacyFilterPolicy:completion:", 1, v37);
    v14 = (void *)v11;
    if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v13, 10.0))
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("Timeout while attempting to invoke method on TRIXPCStatusServiceProtocol proxy object from: %@."), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (a3)
      {
        v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v65 = *MEMORY[0x1E0CB2D50];
        v66[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, &v65, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *a3 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 7, v19);

      }
      TRILogCategory_ClientFramework();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v64 = v31;
        _os_log_error_impl(&dword_19B89C000, v20, OS_LOG_TYPE_ERROR, "Timeout while attempting to invoke method on TRIXPCStatusServiceProtocol proxy object from: %@.", buf, 0xCu);

      }
      goto LABEL_10;
    }
    v23 = (void *)*((_QWORD *)v57 + 5);
    if (v23)
    {
      if (!a3)
      {
LABEL_10:
        v21 = 0;
LABEL_11:

        _Block_object_dispose(&v41, 8);
        _Block_object_dispose(&v47, 8);

        _Block_object_dispose(v56, 8);
        goto LABEL_21;
      }
      v24 = objc_retainAutorelease(v23);
    }
    else
    {
      v26 = (void *)v48[5];
      if (v26)
      {
        buf[0] = 0;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v27 = v26;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v62, 16);
        if (v28)
        {
          v29 = *(_QWORD *)v34;
LABEL_25:
          v30 = 0;
          while (1)
          {
            if (*(_QWORD *)v34 != v29)
              objc_enumerationMutation(v27);
            v7[2](v7, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v30), buf);
            if (buf[0])
              break;
            if (v28 == ++v30)
            {
              v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v62, 16);
              if (v28)
                goto LABEL_25;
              break;
            }
          }
        }

        v21 = 1;
        goto LABEL_11;
      }
      if (!a3)
        goto LABEL_10;
      v24 = objc_retainAutorelease((id)v42[5]);
    }
    v21 = 0;
    *a3 = v24;
    goto LABEL_11;
  }
  TRILogCategory_ClientFramework();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v56 = 0;
    _os_log_error_impl(&dword_19B89C000, v22, OS_LOG_TYPE_ERROR, "unable to enumerate active rollouts while device is class C locked", v56, 2u);
  }

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 5, 0);
    v21 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
LABEL_21:

  return v21;
}

void __77__TRIAllocationStatusDefaultProvider_enumerateActiveRolloutsWithError_block___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __77__TRIAllocationStatusDefaultProvider_enumerateActiveRolloutsWithError_block___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD);
  void **v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__TRIAllocationStatusDefaultProvider_enumerateActiveRolloutsWithError_block___block_invoke_3;
  v12[3] = &unk_1E3BFE828;
  v13 = *(id *)(a1 + 32);
  v7 = (void (**)(_QWORD))MEMORY[0x1A1AC6D30](v12);
  if (v6)
  {
    v8 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v9 = v6;
  }
  else
  {
    v8 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v9 = v5;
  }
  v10 = v9;
  v11 = *v8;
  *v8 = v10;

  if (v7)
    v7[2](v7);

}

intptr_t __77__TRIAllocationStatusDefaultProvider_enumerateActiveRolloutsWithError_block___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)enumerateSampledActiveRolloutsForCorrelationID:(id)a3 error:(id *)a4 block:(id)a5
{
  id v9;
  void (**v10)(id, uint64_t, unsigned __int8 *);
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  unsigned __int8 v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, uint64_t, unsigned __int8 *))a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAllocationStatusProvider.m"), 546, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__7;
  v30 = __Block_byref_object_dispose__7;
  v31 = (id)objc_opt_new();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __97__TRIAllocationStatusDefaultProvider_enumerateSampledActiveRolloutsForCorrelationID_error_block___block_invoke;
  v25[3] = &unk_1E3BFF9F8;
  v25[4] = &v26;
  -[TRIAllocationStatusDefaultProvider enumerateActiveRolloutsWithError:block:](self, "enumerateActiveRolloutsWithError:block:", a4, v25);
  if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
  {
    v11 = (id)v27[5];
  }
  else
  {
    +[TRIAllocationStatus sampleAllocationStatuses:correlationId:nrSamples:](TRIAllocationStatus, "sampleAllocationStatuses:correlationId:nrSamples:", v27[5], v9, 2);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = 0;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v21;
LABEL_8:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v14)
        objc_enumerationMutation(v12);
      v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15);
      v17 = (void *)MEMORY[0x1A1AC6B8C]();
      v10[2](v10, v16, &v24);
      LODWORD(v16) = v24;
      objc_autoreleasePoolPop(v17);
      if ((_DWORD)v16)
        break;
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
        if (v13)
          goto LABEL_8;
        break;
      }
    }
  }

  _Block_object_dispose(&v26, 8);
  return 1;
}

uint64_t __97__TRIAllocationStatusDefaultProvider_enumerateSampledActiveRolloutsForCorrelationID_error_block___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
}

- (id)activeBMLTInformationWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[5];
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (+[TRIMisc unsafeFirstAuthenticationState](TRIMisc, "unsafeFirstAuthenticationState"))
  {
    *(_QWORD *)buf = 0;
    v21 = buf;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__7;
    v24 = __Block_byref_object_dispose__7;
    v5 = MEMORY[0x1E0C809B0];
    v25 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __69__TRIAllocationStatusDefaultProvider_activeBMLTInformationWithError___block_invoke;
    v19[3] = &unk_1E3BFE738;
    v19[4] = buf;
    v6 = (void *)MEMORY[0x1A1AC6D30](v19);
    -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_internalHelper, "synchronousRemoteObjectProxyWithErrorHandler:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__7;
    v17 = __Block_byref_object_dispose__7;
    v18 = 0;
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __69__TRIAllocationStatusDefaultProvider_activeBMLTInformationWithError___block_invoke_2;
    v12[3] = &unk_1E3BFFA20;
    v12[4] = &v13;
    objc_msgSend(v7, "activeBMLTInformationWithPrivacyFilterPolicy:completion:", 1, v12);
    v8 = (void *)*((_QWORD *)v21 + 5);
    if (v8)
    {
      v9 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v8);
    }
    else
    {
      v9 = (id)v14[5];
    }
    _Block_object_dispose(&v13, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    TRILogCategory_ClientFramework();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&buf[4] = qos_class_self();
      _os_log_error_impl(&dword_19B89C000, v10, OS_LOG_TYPE_ERROR, "unable to fetch active BMLTs while device is class C locked qos:%{public}u", buf, 8u);
    }

    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 5, 0);
      v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  return v9;
}

void __69__TRIAllocationStatusDefaultProvider_activeBMLTInformationWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __69__TRIAllocationStatusDefaultProvider_activeBMLTInformationWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)addStatusUpdateHandlerForEnvironment:(int)a3 queue:(id)a4 block:(id)a5
{
  uint64_t v6;
  NSObject *v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  TRINotificationState *v14;
  _PASLock *lock;
  TRINotificationState *v16;
  void *v18;
  _QWORD v19[4];
  int v20;
  _QWORD handler[4];
  id v22;
  int out_token;

  v6 = *(_QWORD *)&a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAllocationStatusProvider.m"), 606, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  +[TRIAllocationStatus notificationNameForDeploymentEnvironment:](TRIAllocationStatus, "notificationNameForDeploymentEnvironment:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (!v9)
    {
      -[TRIAllocationStatusDefaultProvider _defaultQueue](self, "_defaultQueue");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    out_token = 0;
    v12 = (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    v13 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __87__TRIAllocationStatusDefaultProvider_addStatusUpdateHandlerForEnvironment_queue_block___block_invoke;
    handler[3] = &unk_1E3BFEA40;
    v22 = v10;
    if (notify_register_dispatch(v12, &out_token, v9, handler))
    {
      v14 = 0;
    }
    else
    {
      lock = self->_lock;
      v19[0] = v13;
      v19[1] = 3221225472;
      v19[2] = __87__TRIAllocationStatusDefaultProvider_addStatusUpdateHandlerForEnvironment_queue_block___block_invoke_2;
      v19[3] = &__block_descriptor_36_e48_v16__0__TRIAllocationStatusProviderGuardedData_8l;
      v20 = out_token;
      -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v19);
      v16 = [TRINotificationState alloc];
      v14 = -[TRINotificationState initWithToken:](v16, "initWithToken:", out_token);
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __87__TRIAllocationStatusDefaultProvider_addStatusUpdateHandlerForEnvironment_queue_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__TRIAllocationStatusDefaultProvider_addStatusUpdateHandlerForEnvironment_queue_block___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a2 + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (BOOL)removeUpdateHandlerForToken:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  _PASLock *lock;
  _QWORD v9[4];
  int v10;

  v4 = a3;
  if (!v4)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "token");
    if (!notify_cancel(v5))
    {
      lock = self->_lock;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __66__TRIAllocationStatusDefaultProvider_removeUpdateHandlerForToken___block_invoke;
      v9[3] = &__block_descriptor_36_e48_v16__0__TRIAllocationStatusProviderGuardedData_8l;
      v10 = v5;
      -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
LABEL_6:
      v6 = 1;
      goto LABEL_7;
    }
  }
  v6 = 0;
LABEL_7:

  return v6;
}

void __66__TRIAllocationStatusDefaultProvider_removeUpdateHandlerForToken___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a2 + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_internalHelper, 0);
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

@end
