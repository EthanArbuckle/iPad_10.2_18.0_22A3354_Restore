@implementation TRIEvaluationStatusDefaultProvider

- (TRIEvaluationStatusDefaultProvider)init
{
  TRIEvaluationStatusDefaultProvider *v2;
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
  id v16;
  void *v17;
  uint64_t v18;
  _PASXPCClientHelper *clientHelper;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)TRIEvaluationStatusDefaultProvider;
  v2 = -[TRIEvaluationStatusDefaultProvider init](&v21, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4160C8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1A1AC6B8C]();
    v5 = objc_alloc(MEMORY[0x1E0C99E60]);
    v6 = objc_opt_class();
    v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_activeEvaluationsForMLRuntimeWithCompletion_, 0, 1);

    v8 = (void *)MEMORY[0x1A1AC6B8C]();
    v9 = objc_alloc(MEMORY[0x1E0C99E60]);
    v10 = objc_opt_class();
    v11 = (void *)objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_activeEvaluationsForBMLTWithCompletion_, 0, 1);

    v12 = (void *)MEMORY[0x1A1AC6B8C]();
    v13 = objc_alloc(MEMORY[0x1E0C99E60]);
    v14 = objc_opt_class();
    v15 = (void *)objc_msgSend(v13, "initWithObjects:", v14, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_evaluationHistoryRecordsForMLRuntimeWithLimit_newerThanDate_completion_, 0, 1);

    v16 = objc_alloc(MEMORY[0x1E0D81640]);
    TRILogCategory_ClientFramework();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "initWithServiceName:allowlistedServerInterface:allowlistedClientInterface:serverInitiatedRequestHandler:allowSystemToUserConnection:interruptionHandler:invalidationHandler:logHandle:", CFSTR("com.apple.trial.status"), v3, 0, 0, 1, &__block_literal_global_0, &__block_literal_global_76, v17);
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = (_PASXPCClientHelper *)v18;

  }
  return v2;
}

- (id)syncProxyWithErrorHandler:(id)a3
{
  return (id)-[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_clientHelper, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
}

- (BOOL)enumerateActiveBMLTWithError:(id *)a3 block:(id)a4
{
  void (**v7)(id, void *, void *, _BYTE *);
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  char v29;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _QWORD v43[5];
  uint8_t buf[8];
  uint8_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, void *, void *, _BYTE *))a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIEvaluationStatusProvider.m"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  if (+[TRIMisc unsafeFirstAuthenticationState](TRIMisc, "unsafeFirstAuthenticationState"))
  {
    *(_QWORD *)buf = 0;
    v45 = buf;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__0;
    v48 = __Block_byref_object_dispose__0;
    v8 = MEMORY[0x1E0C809B0];
    v49 = 0;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __73__TRIEvaluationStatusDefaultProvider_enumerateActiveBMLTWithError_block___block_invoke;
    v43[3] = &unk_1E3BFE738;
    v43[4] = buf;
    v9 = (void *)MEMORY[0x1A1AC6D30](v43);
    -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_clientHelper, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__0;
    v41 = __Block_byref_object_dispose__0;
    v42 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__0;
    v35 = __Block_byref_object_dispose__0;
    v36 = 0;
    v30[0] = v8;
    v30[1] = 3221225472;
    v30[2] = __73__TRIEvaluationStatusDefaultProvider_enumerateActiveBMLTWithError_block___block_invoke_2;
    v30[3] = &unk_1E3BFE8E8;
    v30[4] = &v31;
    v30[5] = &v37;
    objc_msgSend(v10, "activeEvaluationsForBMLTWithCompletion:", v30);
    v11 = (void *)*((_QWORD *)v45 + 5);
    if (v11)
    {
      if (a3)
      {
        v12 = objc_retainAutorelease(v11);
LABEL_7:
        v13 = 0;
        *a3 = v12;
LABEL_26:
        _Block_object_dispose(&v31, 8);

        _Block_object_dispose(&v37, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_27;
      }
    }
    else
    {
      v15 = (void *)v38[5];
      if (v15)
      {
        v29 = 0;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v50, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v26;
LABEL_15:
          v19 = 0;
          while (1)
          {
            if (*(_QWORD *)v26 != v18)
              objc_enumerationMutation(v16);
            v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v19);
            objc_msgSend(v20, "bmlt");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "factorsState");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v7[2](v7, v21, v22, &v29);

            if (v29)
              break;
            if (v17 == ++v19)
            {
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v50, 16);
              if (v17)
                goto LABEL_15;
              break;
            }
          }
        }

        v13 = 1;
        goto LABEL_26;
      }
      if (a3)
      {
        v12 = objc_retainAutorelease((id)v32[5]);
        goto LABEL_7;
      }
    }
    v13 = 0;
    goto LABEL_26;
  }
  TRILogCategory_ClientFramework();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19B89C000, v14, OS_LOG_TYPE_ERROR, "cannot enumerate evaluations before class C locked", buf, 2u);
  }

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 5, 0);
    v13 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_27:

  return v13;
}

void __73__TRIEvaluationStatusDefaultProvider_enumerateActiveBMLTWithError_block___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __73__TRIEvaluationStatusDefaultProvider_enumerateActiveBMLTWithError_block___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void **v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = v10;
  }
  else
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v7 = v5;
  }
  v8 = v7;
  v9 = *v6;
  *v6 = v8;

}

- (BOOL)enumerateActiveEvaluationsForMLRuntimeWithError:(id *)a3 block:(id)a4
{
  void (**v7)(id, void *, void *, _BYTE *);
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  char v29;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _QWORD v43[5];
  uint8_t buf[8];
  uint8_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, void *, void *, _BYTE *))a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIEvaluationStatusProvider.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  if (+[TRIMisc unsafeFirstAuthenticationState](TRIMisc, "unsafeFirstAuthenticationState"))
  {
    *(_QWORD *)buf = 0;
    v45 = buf;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__0;
    v48 = __Block_byref_object_dispose__0;
    v8 = MEMORY[0x1E0C809B0];
    v49 = 0;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __92__TRIEvaluationStatusDefaultProvider_enumerateActiveEvaluationsForMLRuntimeWithError_block___block_invoke;
    v43[3] = &unk_1E3BFE738;
    v43[4] = buf;
    v9 = (void *)MEMORY[0x1A1AC6D30](v43);
    -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_clientHelper, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__0;
    v41 = __Block_byref_object_dispose__0;
    v42 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__0;
    v35 = __Block_byref_object_dispose__0;
    v36 = 0;
    v30[0] = v8;
    v30[1] = 3221225472;
    v30[2] = __92__TRIEvaluationStatusDefaultProvider_enumerateActiveEvaluationsForMLRuntimeWithError_block___block_invoke_2;
    v30[3] = &unk_1E3BFE8E8;
    v30[4] = &v31;
    v30[5] = &v37;
    objc_msgSend(v10, "activeEvaluationsForMLRuntimeWithCompletion:", v30);
    v11 = (void *)*((_QWORD *)v45 + 5);
    if (v11)
    {
      if (a3)
      {
        v12 = objc_retainAutorelease(v11);
LABEL_7:
        v13 = 0;
        *a3 = v12;
LABEL_26:
        _Block_object_dispose(&v31, 8);

        _Block_object_dispose(&v37, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_27;
      }
    }
    else
    {
      v15 = (void *)v38[5];
      if (v15)
      {
        v29 = 0;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v50, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v26;
LABEL_15:
          v19 = 0;
          while (1)
          {
            if (*(_QWORD *)v26 != v18)
              objc_enumerationMutation(v16);
            v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v19);
            objc_msgSend(v20, "eval");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "factorsState");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v7[2](v7, v21, v22, &v29);

            if (v29)
              break;
            if (v17 == ++v19)
            {
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v50, 16);
              if (v17)
                goto LABEL_15;
              break;
            }
          }
        }

        v13 = 1;
        goto LABEL_26;
      }
      if (a3)
      {
        v12 = objc_retainAutorelease((id)v32[5]);
        goto LABEL_7;
      }
    }
    v13 = 0;
    goto LABEL_26;
  }
  TRILogCategory_ClientFramework();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19B89C000, v14, OS_LOG_TYPE_ERROR, "cannot enumerate evaluations before class C locked", buf, 2u);
  }

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 5, 0);
    v13 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_27:

  return v13;
}

void __92__TRIEvaluationStatusDefaultProvider_enumerateActiveEvaluationsForMLRuntimeWithError_block___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __92__TRIEvaluationStatusDefaultProvider_enumerateActiveEvaluationsForMLRuntimeWithError_block___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void **v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = v10;
  }
  else
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v7 = v5;
  }
  v8 = v7;
  v9 = *v6;
  *v6 = v8;

}

- (id)enumerateStatusOfEvaluationsForMLRuntimeWithCursor:(id)a3 error:(id *)a4 block:(id)a5
{
  void (**v8)(id, void *, void *, _BYTE *);
  void *v9;
  BOOL v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  TRIEvaluationStatusCursor *v24;
  TRIEvaluationStatusCursor *v25;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  char v36;
  _QWORD v37[6];
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
  _QWORD v50[5];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v8 = (void (**)(id, void *, void *, _BYTE *))a5;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIEvaluationStatusProvider.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__0;
  v55 = __Block_byref_object_dispose__0;
  v56 = 0;
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __101__TRIEvaluationStatusDefaultProvider_enumerateStatusOfEvaluationsForMLRuntimeWithCursor_error_block___block_invoke;
  v50[3] = &unk_1E3BFE738;
  v50[4] = &v51;
  v29 = (void *)MEMORY[0x1A1AC6D30](v50);
  -[_PASXPCClientHelper synchronousRemoteObjectProxyWithErrorHandler:](self->_clientHelper, "synchronousRemoteObjectProxyWithErrorHandler:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    objc_msgSend(v28, "date");
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  while (!v10)
  {
    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__0;
    v48 = __Block_byref_object_dispose__0;
    v49 = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__0;
    v42 = __Block_byref_object_dispose__0;
    v43 = 0;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __101__TRIEvaluationStatusDefaultProvider_enumerateStatusOfEvaluationsForMLRuntimeWithCursor_error_block___block_invoke_2;
    v37[3] = &unk_1E3BFE8E8;
    v37[4] = &v38;
    v37[5] = &v44;
    objc_msgSend(v30, "evaluationHistoryRecordsForMLRuntimeWithLimit:newerThanDate:completion:", 100, v9, v37);
    v11 = (void *)v52[5];
    if (v11)
    {
      if (!a4)
        goto LABEL_30;
      v12 = objc_retainAutorelease(v11);
    }
    else
    {
      if (v45[5])
      {
        v36 = 0;
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v14 = (id)v45[5];
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v57, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v33;
LABEL_15:
          v17 = 0;
          v18 = v9;
          while (1)
          {
            if (*(_QWORD *)v33 != v16)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v17);
            objc_msgSend(v19, "evaluation");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "status");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v8[2](v8, v20, v21, &v36);

            objc_msgSend(v19, "status");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "date");
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            if (v36)
              break;
            ++v17;
            v18 = v9;
            if (v15 == v17)
            {
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v57, 16);
              if (v15)
                goto LABEL_15;
              break;
            }
          }
        }

        v10 = (unint64_t)objc_msgSend((id)v45[5], "count") < 0x64 || v36 != 0;
        v13 = 1;
        goto LABEL_31;
      }
      if (!a4)
      {
LABEL_30:
        v10 = 0;
        v13 = 0;
        goto LABEL_31;
      }
      v12 = objc_retainAutorelease((id)v39[5]);
    }
    v10 = 0;
    v13 = 0;
    *a4 = v12;
LABEL_31:
    _Block_object_dispose(&v38, 8);

    _Block_object_dispose(&v44, 8);
    if ((v13 & 1) == 0)
    {
      v24 = 0;
      goto LABEL_34;
    }
  }
  v25 = [TRIEvaluationStatusCursor alloc];
  objc_msgSend(v9, "timeIntervalSince1970");
  v24 = -[TRIEvaluationStatusCursor initWithSecondsFromEpoch:](v25, "initWithSecondsFromEpoch:");
LABEL_34:

  _Block_object_dispose(&v51, 8);
  return v24;
}

void __101__TRIEvaluationStatusDefaultProvider_enumerateStatusOfEvaluationsForMLRuntimeWithCursor_error_block___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __101__TRIEvaluationStatusDefaultProvider_enumerateStatusOfEvaluationsForMLRuntimeWithCursor_error_block___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void **v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = v10;
  }
  else
  {
    v6 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v7 = v5;
  }
  v8 = v7;
  v9 = *v6;
  *v6 = v8;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientHelper, 0);
}

@end
