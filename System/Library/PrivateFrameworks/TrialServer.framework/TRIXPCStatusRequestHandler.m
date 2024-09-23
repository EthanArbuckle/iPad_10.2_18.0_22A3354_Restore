@implementation TRIXPCStatusRequestHandler

- (void)rolloutRecordsWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  void (**v7)(_QWORD, _QWORD);
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  TRIXPCStatusRequestHandler *v14;
  id v15;
  id v16;
  _QWORD v17[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__TRIXPCStatusRequestHandler_rolloutRecordsWithCompletion___block_invoke;
  v17[3] = &unk_1E9330738;
  v17[4] = self;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v17);
  v6[2](v6, 0);
  v10 = v5;
  v11 = 3221225472;
  v12 = __59__TRIXPCStatusRequestHandler_rolloutRecordsWithCompletion___block_invoke_107;
  v13 = &unk_1E9330CF8;
  v15 = v4;
  v16 = v6;
  v14 = self;
  v7 = v6;
  v8 = v4;
  v9 = (void *)MEMORY[0x1D8232C48](&v10);
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](self->_promise, "addBlockToExecuteAfterPromiseFullfillment:", v9, v10, v11, v12, v13, v14);

}

void __59__TRIXPCStatusRequestHandler_rolloutRecordsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
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
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
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
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s rolloutRecordsWithCompletion:", (uint8_t *)v11, 0x26u);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promise, 0);
}

void __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    if (a2)
      v9 = "end";
    else
      v9 = "begin";
    TRIDeploymentEnvironment_EnumDescriptor();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textFormatNameForValue:", *(unsigned int *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = 67110146;
    v12[1] = v5;
    v13 = 2114;
    v14 = v7;
    v15 = 2048;
    v16 = v8;
    v17 = 2080;
    v18 = v9;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s experimentHistoryRecordsWithLimit:newerThanDate:deploymentEnvironment:completion: with env %@", (uint8_t *)v12, 0x30u);

  }
}

- (void)experimentHistoryRecordsWithLimit:(unint64_t)a3 newerThanDate:(id)a4 privacyFilterPolicy:(unsigned __int8)a5 deploymentEnvironment:(int)a6 completion:(id)a7
{
  id v12;
  id v13;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD);
  TRIXPCServerContextPromise *promise;
  id v17;
  id v18;
  void (**v19)(_QWORD, _QWORD);
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  int v25;
  unsigned __int8 v26;
  _QWORD v27[5];
  int v28;

  v12 = a4;
  v13 = a7;
  v14 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke;
  v27[3] = &unk_1E9336700;
  v27[4] = self;
  v28 = a6;
  v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v27);
  v15[2](v15, 0);
  promise = self->_promise;
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_33;
  v20[3] = &unk_1E9336778;
  v22 = v15;
  v23 = v13;
  v25 = a6;
  v20[4] = self;
  v21 = v12;
  v24 = a3;
  v26 = a5;
  v17 = v12;
  v18 = v13;
  v19 = v15;
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](promise, "addBlockToExecuteAfterPromiseFullfillment:", v20);

}

- (void)rolloutAllocationStatusWithPrivacyFilterPolicy:(unsigned __int8)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  unsigned __int8 v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__TRIXPCStatusRequestHandler_rolloutAllocationStatusWithPrivacyFilterPolicy_completion___block_invoke;
  v8[3] = &unk_1E9336840;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  -[TRIXPCStatusRequestHandler rolloutRecordsWithCompletion:](self, "rolloutRecordsWithCompletion:", v8);

}

- (void)experimentRecordsWithDeploymentEnvironments:(id)a3 privacyFilterPolicy:(unsigned __int8)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD);
  id v12;
  void (**v13)(_QWORD, _QWORD);
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  TRIXPCStatusRequestHandler *v20;
  id v21;
  id v22;
  id v23;
  unsigned __int8 v24;
  _QWORD v25[5];

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke;
  v25[3] = &unk_1E9330738;
  v25[4] = self;
  v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v25);
  v11[2](v11, 0);
  v16 = v10;
  v17 = 3221225472;
  v18 = __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_66;
  v19 = &unk_1E93367A0;
  v22 = v9;
  v23 = v11;
  v20 = self;
  v21 = v8;
  v24 = a4;
  v12 = v8;
  v13 = v11;
  v14 = v9;
  v15 = (void *)MEMORY[0x1D8232C48](&v16);
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](self->_promise, "addBlockToExecuteAfterPromiseFullfillment:", v15, v16, v17, v18, v19, v20);

}

void __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke(uint64_t a1, uint64_t a2)
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
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
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

- (TRIXPCStatusRequestHandler)initWithPromise:(id)a3 auditToken:(id *)a4
{
  id v8;
  TRIXPCStatusRequestHandler *v9;
  TRIXPCStatusRequestHandler *v10;
  __int128 v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIXPCStatusService.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("promise"));

  }
  v14.receiver = self;
  v14.super_class = (Class)TRIXPCStatusRequestHandler;
  v9 = -[TRIXPCStatusRequestHandler init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_promise, a3);
    v11 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)v10->_auditToken.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&v10->_auditToken.val[4] = v11;
  }

  return v10;
}

void __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD, _QWORD, _QWORD);
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  char v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  int v43;
  int v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  int v49;
  uint64_t v50;
  void *contexta;
  void *context;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  int v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  char v62;
  _QWORD v63[4];
  id v64;
  uint64_t v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  _BYTE buf[32];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_2;
  v68[3] = &unk_1E9330760;
  v69 = *(id *)(a1 + 48);
  v8 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v68);
  if (v5 && v6)
  {
    v66[0] = v7;
    v66[1] = 3221225472;
    v66[2] = __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_38;
    v66[3] = &unk_1E93307D8;
    v67 = *(id *)(a1 + 56);
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D8232C48](v66);
    v10 = *MEMORY[0x1E0DC0E38];
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_OWORD *)(v11 + 32);
    *(_OWORD *)buf = *(_OWORD *)(v11 + 16);
    *(_OWORD *)&buf[16] = v12;
    objc_msgSend(MEMORY[0x1E0DC0A18], "objectForEntitlement:withAuditToken:", v10, buf);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      TRILogCategory_Server();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v43 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v43;
        *(_WORD *)&buf[8] = 2114;
        *(_QWORD *)&buf[10] = v10;
        _os_log_error_impl(&dword_1D207F000, v36, OS_LOG_TYPE_ERROR, "experimentHistoryRecordsWithLimit: the calling process (pid %d) is missing entitlement \"%{public}@\".", buf, 0x12u);
      }

      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The calling process is missing entitlement \"%@\"."), v10);
      ((void (**)(_QWORD, uint64_t, void *))v9)[2](v9, 3, v14);
      goto LABEL_38;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      TRILogCategory_Server();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v44 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v44;
        *(_WORD *)&buf[8] = 2114;
        *(_QWORD *)&buf[10] = v10;
        _os_log_error_impl(&dword_1D207F000, v37, OS_LOG_TYPE_ERROR, "experimentHistoryRecordsWithLimit: the calling process (pid %d) has ill-typed value for entitlement \"%{public}@\" (expected array).", buf, 0x12u);
      }

      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The calling process has a value for entitlement \"%@\" which is not array-valued."), v10);
      ((void (**)(_QWORD, uint64_t, void *))v9)[2](v9, 3, v14);
      goto LABEL_38;
    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v13);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 72));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "containsObject:", v15);

    if ((v16 & 1) == 0)
    {
      TRILogCategory_Server();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v58 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
        TRIDeploymentEnvironment_EnumDescriptor();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "textFormatNameForValue:", *(unsigned int *)(a1 + 72));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v58;
        *(_WORD *)&buf[8] = 2114;
        *(_QWORD *)&buf[10] = v46;
        _os_log_error_impl(&dword_1D207F000, v38, OS_LOG_TYPE_ERROR, "experimentHistoryRecordsWithLimit: the calling process (pid %d) is not entitled for access to %{public}@.", buf, 0x12u);

      }
      v39 = objc_alloc(MEMORY[0x1E0CB3940]);
      TRIDeploymentEnvironment_EnumDescriptor();
      v56 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "textFormatNameForValue:", *(unsigned int *)(a1 + 72));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend(v39, "initWithFormat:", CFSTR("The calling process is not entitled for access to %@."), v40);
      ((void (**)(_QWORD, uint64_t, void *))v9)[2](v9, 3, v41);

      goto LABEL_37;
    }
    if (!*(_QWORD *)(a1 + 40))
    {
      ((void (**)(_QWORD, uint64_t, const __CFString *))v9)[2](v9, 2, CFSTR("The 'date' parameter must be non-nil."));
LABEL_38:

      v34 = v67;
      goto LABEL_39;
    }
    if (!*(_QWORD *)(a1 + 64))
    {
      v42 = *(_QWORD *)(a1 + 56);
      if (v42)
      {
        v57 = (void *)objc_opt_new();
        (*(void (**)(uint64_t, void *, _QWORD, void *, _QWORD))(v42 + 16))(v42, &unk_1E9363FF0, MEMORY[0x1E0C9AA60], v57, 0);

      }
      goto LABEL_38;
    }
    v55 = (void *)objc_opt_new();
    objc_msgSend(v5, "experimentHistoryDatabase");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = *(_QWORD *)(a1 + 40);
    contexta = (void *)MEMORY[0x1D8232A5C]();
    v17 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 72));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithObjects:", v18, 0);

    objc_autoreleasePoolPop(contexta);
    v63[0] = v7;
    v63[1] = 3221225472;
    v63[2] = __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_55;
    v63[3] = &unk_1E9336728;
    v20 = v55;
    v21 = *(_QWORD *)(a1 + 64);
    v56 = v20;
    v64 = v20;
    v65 = v21;
    LOBYTE(v18) = objc_msgSend(v53, "enumerateRecordsNewerThanDate:matchingDeploymentEnvironments:block:", v50, v19, v63);

    if ((v18 & 1) == 0)
    {
      ((void (**)(_QWORD, uint64_t, const __CFString *))v9)[2](v9, 12, CFSTR("The database query failed."));
      goto LABEL_36;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v56, "count"));
    context = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_opt_new();
    if ((int)objc_msgSend(context, "intValue") >= 1)
    {
      objc_msgSend(v56, "lastObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "eventDate");
      v23 = objc_claimAutoreleasedReturnValue();

      v54 = (void *)v23;
    }
    v24 = *(_BYTE *)(a1 + 76);
    if (v24)
    {
      v61[0] = v7;
      v61[1] = 3221225472;
      v61[2] = __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_2_60;
      v61[3] = &__block_descriptor_33_e25_B24__0_8__NSDictionary_16l;
      v62 = v24;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v61);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "filterUsingPredicate:", v25);

    }
    if (!*(_DWORD *)(a1 + 72))
    {
      v26 = *MEMORY[0x1E0DC0E40];
      v27 = *(_QWORD *)(a1 + 32);
      v28 = *(_OWORD *)(v27 + 32);
      *(_OWORD *)buf = *(_OWORD *)(v27 + 16);
      *(_OWORD *)&buf[16] = v28;
      objc_msgSend(MEMORY[0x1E0DC0A18], "objectForEntitlement:withAuditToken:", v26, buf);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          TRILogCategory_Server();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            v49 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = v49;
            *(_WORD *)&buf[8] = 2112;
            *(_QWORD *)&buf[10] = v26;
            _os_log_error_impl(&dword_1D207F000, v47, OS_LOG_TYPE_ERROR, "experimentHistoryRecordsWithLimit: the calling process (pid %d) has ill-typed value for entitlement \"%@\" (expected array).", buf, 0x12u);
          }

          v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The calling process has a value for entitlement \"%@\" which is not array-valued."), v26);
          ((void (**)(_QWORD, uint64_t, void *))v9)[2](v9, 3, v48);

          goto LABEL_20;
        }
        v30 = (void *)MEMORY[0x1E0CB3880];
        v59[0] = v7;
        v59[1] = 3221225472;
        v59[2] = __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_64;
        v59[3] = &unk_1E9336750;
        v60 = v29;
        objc_msgSend(v30, "predicateWithBlock:", v59);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "filterUsingPredicate:", v31);

      }
    }
    v32 = *(_QWORD *)(a1 + 56);
    if (v32)
      (*(void (**)(uint64_t, void *, id, void *, _QWORD))(v32 + 16))(v32, context, v56, v54, 0);
LABEL_20:

LABEL_36:
    v40 = v64;
LABEL_37:

    goto LABEL_38;
  }
  v33 = *(_QWORD *)(a1 + 56);
  if (!v33)
    goto LABEL_40;
  v34 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD, void *, void *))(v33 + 16))(v33, &unk_1E9363FF0, MEMORY[0x1E0C9AA60], v34, v35);

LABEL_39:
LABEL_40:
  if (v8)
    v8[2](v8);

}

uint64_t __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_38(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = (objc_class *)MEMORY[0x1E0CB35C8];
    v6 = a3;
    v7 = [v5 alloc];
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), a2, v8);

    v10 = *(_QWORD *)(a1 + 32);
    v11 = (void *)objc_opt_new();
    (*(void (**)(uint64_t, void *, _QWORD, void *, void *))(v10 + 16))(v10, &unk_1E9363FF0, 0, v11, v9);

  }
}

unint64_t __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_55(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  unint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result >= *(_QWORD *)(a1 + 40))
    *a3 = 1;
  return result;
}

uint64_t __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_2_60(uint64_t a1, void *a2)
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

uint64_t __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_64(uint64_t a1, void *a2)
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
        v8 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v8) = objc_msgSend(v8, "containsObject:", v9);

        if ((v8 & 1) != 0)
        {
          v10 = 1;
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
  v10 = 0;
LABEL_11:

  return v10;
}

void __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_66(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  char v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  int v38;
  NSObject *v39;
  void *v40;
  int v41;
  uint64_t v42;
  int v43;
  int v44;
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  char v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _BYTE buf[32];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_2;
    v55[3] = &unk_1E9330760;
    v56 = *(id *)(a1 + 56);
    v45 = (id)MEMORY[0x1D8232C48](v55);
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_3;
    v53[3] = &unk_1E93307D8;
    v54 = *(id *)(a1 + 48);
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D8232C48](v53);
    v9 = *MEMORY[0x1E0DC0E38];
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_OWORD *)(v10 + 32);
    *(_OWORD *)buf = *(_OWORD *)(v10 + 16);
    *(_OWORD *)&buf[16] = v11;
    objc_msgSend(MEMORY[0x1E0DC0A18], "objectForEntitlement:withAuditToken:", v9, buf);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(_OWORD *)(v13 + 32);
    *(_OWORD *)buf = *(_OWORD *)(v13 + 16);
    *(_OWORD *)&buf[16] = v14;
    objc_msgSend(MEMORY[0x1E0DC0A18], "objectForEntitlement:withAuditToken:", CFSTR("com.apple.triald.internal"), buf);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 == 0;

    if (v16)
    {
      if (!v12)
      {
        TRILogCategory_Server();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v41 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v41;
          *(_WORD *)&buf[8] = 2114;
          *(_QWORD *)&buf[10] = v9;
          _os_log_error_impl(&dword_1D207F000, v35, OS_LOG_TYPE_ERROR, "experimentRecordsWithDeploymentEnvironments: the calling process (pid %d) is missing entitlement \"%{public}@\".", buf, 0x12u);
        }

        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The calling process is missing entitlement \"%@\"."), v9);
        ((void (**)(_QWORD, uint64_t, void *))v8)[2](v8, 3, v12);
        goto LABEL_35;
      }
    }
    else
    {

      v12 = &unk_1E9363918;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      TRILogCategory_Server();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v38 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v38;
        *(_WORD *)&buf[8] = 2114;
        *(_QWORD *)&buf[10] = v9;
        _os_log_error_impl(&dword_1D207F000, v34, OS_LOG_TYPE_ERROR, "experimentRecordsWithDeploymentEnvironments: the calling process (pid %d) has ill-typed value for entitlement \"%{public}@\" (expected array).", buf, 0x12u);
      }

      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The calling process has a value for entitlement \"%@\" which is not array-valued."), v9);
      ((void (**)(_QWORD, uint64_t, void *))v8)[2](v8, 3, v19);
      goto LABEL_34;
    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v12);
    v20 = *(void **)(a1 + 40);
    if (!v20)
    {
      ((void (**)(_QWORD, uint64_t, const __CFString *))v8)[2](v8, 2, CFSTR("Parameter 'environments' must be non-nil."));
LABEL_34:

LABEL_35:
      v37 = v45;
      if (v45)
      {
        (*((void (**)(void))v45 + 2))();
        v37 = v45;
      }

      goto LABEL_38;
    }
    if ((objc_msgSend(v20, "isSubsetOfSet:", v19) & 1) == 0)
    {
      TRILogCategory_Server();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v42 = *(_QWORD *)(a1 + 40);
        v43 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v43;
        *(_WORD *)&buf[8] = 2114;
        *(_QWORD *)&buf[10] = v42;
        _os_log_error_impl(&dword_1D207F000, v36, OS_LOG_TYPE_ERROR, "experimentRecordsWithDeploymentEnvironments: the calling process (pid %d) is not entitled for access to deployment environments %{public}@.", buf, 0x12u);
      }

      v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The calling process is not entitled for access to deployment environments %@."), *(_QWORD *)(a1 + 40));
      ((void (**)(_QWORD, uint64_t, id))v8)[2](v8, 3, v23);
      goto LABEL_33;
    }
    v21 = (void *)objc_opt_new();
    objc_msgSend(v5, "experimentDatabase");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_74;
    v50[3] = &unk_1E9330B50;
    v51 = *(id *)(a1 + 40);
    v23 = v21;
    v52 = v23;
    v24 = objc_msgSend(v22, "enumerateExperimentRecordsWithBlock:", v50);

    if ((v24 & 1) != 0)
    {
      v25 = *(_BYTE *)(a1 + 64);
      if (v25)
      {
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_2_77;
        v48[3] = &__block_descriptor_33_e25_B24__0_8__NSDictionary_16l;
        v49 = v25;
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v48);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "filterUsingPredicate:", v26);

      }
      if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", &unk_1E9364008))
      {
        v27 = *MEMORY[0x1E0DC0E40];
        v28 = *(_QWORD *)(a1 + 32);
        v29 = *(_OWORD *)(v28 + 32);
        *(_OWORD *)buf = *(_OWORD *)(v28 + 16);
        *(_OWORD *)&buf[16] = v29;
        objc_msgSend(MEMORY[0x1E0DC0A18], "objectForEntitlement:withAuditToken:", v27, buf);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            TRILogCategory_Server();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              v44 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = v44;
              *(_WORD *)&buf[8] = 2112;
              *(_QWORD *)&buf[10] = v27;
              _os_log_error_impl(&dword_1D207F000, v39, OS_LOG_TYPE_ERROR, "experimentRecordsWithDeploymentEnvironments: the calling process (pid %d) has ill-typed value for entitlement \"%@\" (expected array).", buf, 0x12u);
            }

            v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The calling process has a value for entitlement \"%@\" which is not array-valued."), v27);
            ((void (**)(_QWORD, uint64_t, void *))v8)[2](v8, 3, v40);

            goto LABEL_32;
          }
          v31 = (void *)MEMORY[0x1E0CB3880];
          v46[0] = MEMORY[0x1E0C809B0];
          v46[1] = 3221225472;
          v46[2] = __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_78;
          v46[3] = &unk_1E9336750;
          v47 = v30;
          objc_msgSend(v31, "predicateWithBlock:", v46);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "filterUsingPredicate:", v32);

        }
      }
      v33 = *(_QWORD *)(a1 + 48);
      if (v33)
        (*(void (**)(uint64_t, id, _QWORD))(v33 + 16))(v33, v23, 0);
    }
    else
    {
      ((void (**)(_QWORD, uint64_t, const __CFString *))v8)[2](v8, 12, CFSTR("The database query failed."));
    }
LABEL_32:

LABEL_33:
    goto LABEL_34;
  }
  v17 = *(_QWORD *)(a1 + 48);
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, MEMORY[0x1E0C9AA60], v18);

  }
LABEL_38:

}

uint64_t __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
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

void __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_74(uint64_t a1, void *a2)
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

uint64_t __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_2_77(uint64_t a1, void *a2)
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

uint64_t __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_78(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "deploymentEnvironment"))
  {
    v4 = 1;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v3, "namespaces", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "name");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v10) = objc_msgSend(v10, "containsObject:", v11);

          if ((v10 & 1) != 0)
          {
            v4 = 1;
            goto LABEL_13;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }
    v4 = 0;
LABEL_13:

  }
  return v4;
}

- (void)activeEvaluationsForMLRuntimeWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  void (**v7)(_QWORD, _QWORD);
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  TRIXPCStatusRequestHandler *v14;
  id v15;
  id v16;
  _QWORD v17[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke;
  v17[3] = &unk_1E9330738;
  v17[4] = self;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v17);
  v6[2](v6, 0);
  v10 = v5;
  v11 = 3221225472;
  v12 = __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke_79;
  v13 = &unk_1E9330CF8;
  v15 = v4;
  v16 = v6;
  v14 = self;
  v7 = v6;
  v8 = v4;
  v9 = (void *)MEMORY[0x1D8232C48](&v10);
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](self->_promise, "addBlockToExecuteAfterPromiseFullfillment:", v9, v10, v11, v12, v13, v14);

}

void __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
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
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
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
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s activeEvaluationsForMLRuntimeWithCompletion:", (uint8_t *)v11, 0x26u);

  }
}

void __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke_79(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  void *v16;
  void *v17;
  id v18;
  char v19;
  void *v20;
  id v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _OWORD v30[2];
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke_2;
    v33[3] = &unk_1E9330760;
    v34 = *(id *)(a1 + 48);
    v9 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v33);
    v31[0] = v8;
    v31[1] = 3221225472;
    v31[2] = __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke_3;
    v31[3] = &unk_1E93307D8;
    v32 = *(id *)(a1 + 40);
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D8232C48](v31);
    v11 = (void *)MEMORY[0x1E0D815A8];
    v12 = *(_QWORD *)(a1 + 32);
    TRILogCategory_Server();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0DC0E68];
    v15 = *(_OWORD *)(v12 + 32);
    v30[0] = *(_OWORD *)(v12 + 16);
    v30[1] = v15;
    LOBYTE(v11) = objc_msgSend(v11, "taskWithAuditToken:hasTrueBooleanEntitlement:logHandle:", v30, v14, v13);

    if ((v11 & 1) != 0)
    {
      v16 = (void *)objc_opt_new();
      objc_msgSend(v5, "rolloutDatabase");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v8;
      v28[1] = 3221225472;
      v28[2] = __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke_4;
      v28[3] = &unk_1E93304F8;
      v18 = v16;
      v29 = v18;
      v19 = objc_msgSend(v17, "enumerateActiveRecordsWithVisibility:usingTransaction:block:", 2, 0, v28);

      if ((v19 & 1) != 0)
      {
        objc_msgSend(v5, "experimentDatabase");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v8;
        v26[1] = 3221225472;
        v26[2] = __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke_88;
        v26[3] = &unk_1E9330520;
        v21 = v18;
        v27 = v21;
        v22 = objc_msgSend(v20, "enumerateActiveExperimentRecordsWithVisibility:block:", 2, v26);

        if ((v22 & 1) != 0)
        {
          v23 = *(_QWORD *)(a1 + 40);
          if (v23)
            (*(void (**)(uint64_t, id, _QWORD))(v23 + 16))(v23, v21, 0);
        }
        else
        {
          ((void (**)(_QWORD, uint64_t, const __CFString *))v10)[2](v10, 12, CFSTR("The experiment database query failed."));
        }

      }
      else
      {
        ((void (**)(_QWORD, uint64_t, const __CFString *))v10)[2](v10, 12, CFSTR("The rollout database query failed."));
      }

    }
    else
    {
      v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The calling process is missing true-valued entitlement \"%@\"."), v14);
      ((void (**)(_QWORD, uint64_t, id))v10)[2](v10, 3, v18);
    }

    if (v9)
      v9[2](v9);

  }
  else
  {
    v24 = *(_QWORD *)(a1 + 40);
    if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v24 + 16))(v24, 0, v25);

    }
  }

}

uint64_t __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
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

void __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "artifact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rollout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasShadowEvaluation");

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v3, "artifact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rollout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shadowEvaluation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "typeOneOfCase");

    if (v10 == 1)
    {
      v11 = objc_alloc(MEMORY[0x1E0DC0B68]);
      objc_msgSend(v3, "deployment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithDeployment:", v12);

      v14 = *(void **)(a1 + 32);
      v15 = objc_alloc(MEMORY[0x1E0DC0AC0]);
      objc_msgSend(v3, "artifact");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "rollout");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "shadowEvaluation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "mlRuntime");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v15, "initWithEval:factorsState:", v19, v13);
      objc_msgSend(v14, "addObject:", v20);

    }
  }
  else
  {
    TRILogCategory_Server();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "deployment");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "shortDesc");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = v23;
      _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "Rollout deployment %@ is marked as shadow but has no shadowEvaluation.", (uint8_t *)&v24, 0xCu);

    }
  }

}

void __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke_88(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "artifact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experiment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || (objc_msgSend(v5, "hasShadowEvaluation") & 1) == 0)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "experimentDeployment");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "shortDesc");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v21;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Experiment deployment %{public}@ is marked as shadow but has no shadowEvaluation.", (uint8_t *)&v22, 0xCu);

    }
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v5, "shadowEvaluation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "typeOneOfCase");

  if (v7 == 1)
  {
    objc_msgSend(v5, "shadowEvaluation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasClientBackgroundMlTask");

    if (!v9)
    {
      v11 = objc_alloc(MEMORY[0x1E0DC0A38]);
      objc_msgSend(v3, "experimentDeployment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "treatmentId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v11, "initWithDeployment:treatmentId:", v12, v13);

      v15 = *(void **)(a1 + 32);
      v16 = objc_alloc(MEMORY[0x1E0DC0AC0]);
      objc_msgSend(v5, "shadowEvaluation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "mlRuntime");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithEval:factorsState:", v18, v14);
      objc_msgSend(v15, "addObject:", v19);

      goto LABEL_10;
    }
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, "Experiment is a BMLT and will not be included in MLRuntime Shadow Evaluation", (uint8_t *)&v22, 2u);
    }
    goto LABEL_9;
  }
LABEL_10:

}

- (void)evaluationHistoryRecordsForMLRuntimeWithLimit:(unint64_t)a3 newerThanDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD);
  id v12;
  void (**v13)(_QWORD, _QWORD);
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  TRIXPCStatusRequestHandler *v20;
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  _QWORD v25[5];

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __101__TRIXPCStatusRequestHandler_evaluationHistoryRecordsForMLRuntimeWithLimit_newerThanDate_completion___block_invoke;
  v25[3] = &unk_1E9330738;
  v25[4] = self;
  v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v25);
  v11[2](v11, 0);
  v16 = v10;
  v17 = 3221225472;
  v18 = __101__TRIXPCStatusRequestHandler_evaluationHistoryRecordsForMLRuntimeWithLimit_newerThanDate_completion___block_invoke_92;
  v19 = &unk_1E93367F0;
  v22 = v9;
  v23 = v11;
  v20 = self;
  v21 = v8;
  v24 = a3;
  v12 = v8;
  v13 = v11;
  v14 = v9;
  v15 = (void *)MEMORY[0x1D8232C48](&v16);
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](self->_promise, "addBlockToExecuteAfterPromiseFullfillment:", v15, v16, v17, v18, v19, v20);

}

void __101__TRIXPCStatusRequestHandler_evaluationHistoryRecordsForMLRuntimeWithLimit_newerThanDate_completion___block_invoke(uint64_t a1, uint64_t a2)
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
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
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
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s evaluationHistoryRecordsForMLRuntimeWithLimit:", (uint8_t *)v11, 0x26u);

  }
}

void __101__TRIXPCStatusRequestHandler_evaluationHistoryRecordsForMLRuntimeWithLimit_newerThanDate_completion___block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  _OWORD v28[2];
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __101__TRIXPCStatusRequestHandler_evaluationHistoryRecordsForMLRuntimeWithLimit_newerThanDate_completion___block_invoke_2;
    v31[3] = &unk_1E9330760;
    v32 = *(id *)(a1 + 56);
    v9 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v31);
    v29[0] = v8;
    v29[1] = 3221225472;
    v29[2] = __101__TRIXPCStatusRequestHandler_evaluationHistoryRecordsForMLRuntimeWithLimit_newerThanDate_completion___block_invoke_3;
    v29[3] = &unk_1E93307D8;
    v30 = *(id *)(a1 + 48);
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D8232C48](v29);
    v11 = (void *)MEMORY[0x1E0D815A8];
    v12 = *(_QWORD *)(a1 + 32);
    TRILogCategory_Server();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0DC0E68];
    v15 = *(_OWORD *)(v12 + 32);
    v28[0] = *(_OWORD *)(v12 + 16);
    v28[1] = v15;
    LOBYTE(v11) = objc_msgSend(v11, "taskWithAuditToken:hasTrueBooleanEntitlement:logHandle:", v28, v14, v13);

    if ((v11 & 1) != 0)
    {
      if (!*(_QWORD *)(a1 + 40))
      {
        ((void (**)(_QWORD, uint64_t, const __CFString *))v10)[2](v10, 2, CFSTR("The 'date' parameter must be non-nil."));
LABEL_18:

        if (v9)
          v9[2](v9);

        goto LABEL_21;
      }
      if (!*(_QWORD *)(a1 + 64))
      {
        v24 = *(_QWORD *)(a1 + 48);
        if (v24)
          (*(void (**)(uint64_t, _QWORD, _QWORD))(v24 + 16))(v24, MEMORY[0x1E0C9AA60], 0);
        goto LABEL_18;
      }
      v16 = (void *)objc_opt_new();
      objc_msgSend(v5, "evaluationHistoryDatabase");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 40);
      v25[0] = v8;
      v25[1] = 3221225472;
      v25[2] = __101__TRIXPCStatusRequestHandler_evaluationHistoryRecordsForMLRuntimeWithLimit_newerThanDate_completion___block_invoke_4;
      v25[3] = &unk_1E93367C8;
      v19 = v16;
      v20 = *(_QWORD *)(a1 + 64);
      v26 = v19;
      v27 = v20;
      LOBYTE(v18) = objc_msgSend(v17, "enumerateRecordsNewerThanDate:block:", v18, v25);

      if ((v18 & 1) != 0)
      {
        v21 = *(_QWORD *)(a1 + 48);
        if (v21)
          (*(void (**)(uint64_t, id, _QWORD))(v21 + 16))(v21, v19, 0);
      }
      else
      {
        ((void (**)(_QWORD, uint64_t, const __CFString *))v10)[2](v10, 12, CFSTR("The database query failed."));
      }

    }
    else
    {
      v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The calling process is missing true-valued entitlement \"%@\"."), v14);
      ((void (**)(_QWORD, uint64_t, id))v10)[2](v10, 3, v19);
    }

    goto LABEL_18;
  }
  v22 = *(_QWORD *)(a1 + 48);
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v22 + 16))(v22, 0, v23);

  }
LABEL_21:

}

uint64_t __101__TRIXPCStatusRequestHandler_evaluationHistoryRecordsForMLRuntimeWithLimit_newerThanDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __101__TRIXPCStatusRequestHandler_evaluationHistoryRecordsForMLRuntimeWithLimit_newerThanDate_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
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

unint64_t __101__TRIXPCStatusRequestHandler_evaluationHistoryRecordsForMLRuntimeWithLimit_newerThanDate_completion___block_invoke_4(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  unint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result >= *(_QWORD *)(a1 + 40))
    *a3 = 1;
  return result;
}

- (void)activeEvaluationsForBMLTWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  void (**v7)(_QWORD, _QWORD);
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  TRIXPCStatusRequestHandler *v14;
  id v15;
  id v16;
  _QWORD v17[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke;
  v17[3] = &unk_1E9330738;
  v17[4] = self;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v17);
  v6[2](v6, 0);
  v10 = v5;
  v11 = 3221225472;
  v12 = __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke_94;
  v13 = &unk_1E9330CF8;
  v15 = v4;
  v16 = v6;
  v14 = self;
  v7 = v6;
  v8 = v4;
  v9 = (void *)MEMORY[0x1D8232C48](&v10);
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](self->_promise, "addBlockToExecuteAfterPromiseFullfillment:", v9, v10, v11, v12, v13, v14);

}

void __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
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
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
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
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s activeEvaluationsForBMLTWithCompletion:", (uint8_t *)v11, 0x26u);

  }
}

void __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke_94(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  void *v15;
  void *v16;
  id v17;
  char v18;
  void *v19;
  id v20;
  char v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  void *v45;
  uint8_t buf[40];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke_2;
    v43[3] = &unk_1E9330760;
    v44 = *(id *)(a1 + 48);
    v36 = (id)MEMORY[0x1D8232C48](v43);
    v41[0] = v8;
    v41[1] = 3221225472;
    v41[2] = __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke_3;
    v41[3] = &unk_1E93307D8;
    v42 = *(id *)(a1 + 40);
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D8232C48](v41);
    v10 = (void *)MEMORY[0x1E0D815A8];
    v11 = *(_QWORD *)(a1 + 32);
    TRILogCategory_Server();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0DC0E68];
    v14 = *(_OWORD *)(v11 + 32);
    *(_OWORD *)buf = *(_OWORD *)(v11 + 16);
    *(_OWORD *)&buf[16] = v14;
    LOBYTE(v10) = objc_msgSend(v10, "taskWithAuditToken:hasTrueBooleanEntitlement:logHandle:", buf, v13, v12);

    if ((v10 & 1) != 0)
    {
      v15 = (void *)objc_opt_new();
      objc_msgSend(v5, "experimentDatabase");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v8;
      v39[1] = 3221225472;
      v39[2] = __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke_4;
      v39[3] = &unk_1E9330520;
      v17 = v15;
      v40 = v17;
      v18 = objc_msgSend(v16, "enumerateActiveExperimentRecordsWithVisibility:block:", 2, v39);

      if ((v18 & 1) != 0)
      {
        objc_msgSend(v5, "bmltDatabase");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v8;
        v37[1] = 3221225472;
        v37[2] = __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke_98;
        v37[3] = &unk_1E9336818;
        v20 = v17;
        v38 = v20;
        v21 = objc_msgSend(v19, "enumerateActiveTasksWithBlock:", v37);

        if ((v21 & 1) != 0)
        {
          TRILogCategory_Server();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = (objc_class *)objc_opt_class();
            NSStringFromClass(v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v24;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v25;
            *(_WORD *)&buf[22] = 2114;
            *(_QWORD *)&buf[24] = v20;
            _os_log_impl(&dword_1D207F000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ %p: activeEvaluationsForBMLTWithCompletion: -> %{public}@", buf, 0x20u);

          }
          objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:integerValue:", CFSTR("bmlt_enumerated"), objc_msgSend(v20, "count"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "client");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "logger");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "client");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "trackingId");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v34;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "logWithTrackingId:metrics:dimensions:trialSystemTelemetry:", v28, v29, 0, 0);

          v30 = *(_QWORD *)(a1 + 40);
          if (v30)
            (*(void (**)(uint64_t, id, _QWORD))(v30 + 16))(v30, v20, 0);

        }
        else
        {
          ((void (**)(_QWORD, uint64_t, const __CFString *))v9)[2](v9, 12, CFSTR("The BMLT database query for active BMLTs failed."));
        }

      }
      else
      {
        ((void (**)(_QWORD, uint64_t, const __CFString *))v9)[2](v9, 12, CFSTR("The experiment database query for BMLT failed."));
      }

    }
    else
    {
      v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The calling process is missing true-valued entitlement \"%@\"."), v13);
      ((void (**)(_QWORD, uint64_t, id))v9)[2](v9, 3, v17);
    }

    v33 = v36;
    if (v36)
    {
      (*((void (**)(void))v36 + 2))();
      v33 = v36;
    }

  }
  else
  {
    v31 = *(_QWORD *)(a1 + 40);
    if (v31)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v31 + 16))(v31, 0, v32);

    }
  }

}

uint64_t __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
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

void __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "artifact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experiment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || (objc_msgSend(v5, "hasShadowEvaluation") & 1) == 0)
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    objc_msgSend(v3, "experimentDeployment");
    v22 = objc_claimAutoreleasedReturnValue();
    -[NSObject shortDesc](v22, "shortDesc");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = 138543362;
    v25 = v23;
    _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "Experiment deployment %{public}@ is marked as shadow but has no shadowEvaluation.", (uint8_t *)&v24, 0xCu);
    goto LABEL_12;
  }
  objc_msgSend(v5, "shadowEvaluation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasClientBackgroundMlTask");

  if ((v7 & 1) == 0)
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    objc_msgSend(v3, "experimentDeployment");
    v22 = objc_claimAutoreleasedReturnValue();
    -[NSObject shortDesc](v22, "shortDesc");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = 138543362;
    v25 = v23;
    _os_log_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEFAULT, "Experiment deployment %{public}@ is marked as shadow but it does not have ClientBackgroundMLTask.", (uint8_t *)&v24, 0xCu);
LABEL_12:

LABEL_13:
    goto LABEL_8;
  }
  objc_msgSend(v5, "shadowEvaluation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientBackgroundMlTask");
  v9 = objc_claimAutoreleasedReturnValue();

  if (-[NSObject hasEndDate](v9, "hasEndDate"))
  {
    -[NSObject endDate](v9, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_new();
    v13 = objc_msgSend(v11, "compare:", v12);

    if (v13 == -1)
    {
      TRILogCategory_Server();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 138543362;
        v25 = v9;
        _os_log_impl(&dword_1D207F000, v22, OS_LOG_TYPE_DEFAULT, "Hybrid-BMLT %{public}@ ended and will not be exposed to MLRuntime", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_13;
    }
  }
  v14 = objc_alloc(MEMORY[0x1E0DC0A38]);
  objc_msgSend(v3, "experimentDeployment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "treatmentId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithDeployment:treatmentId:", v15, v16);

  v18 = objc_alloc(MEMORY[0x1E0DC09A0]);
  objc_msgSend(v5, "shadowEvaluation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "clientBackgroundMlTask");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithBmlt:factorsState:", v20, v17);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v21);
LABEL_8:

}

void __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke_98(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isExpired"))
  {
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "bmltDeployment");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "endDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v5;
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "BMLT deployment %{public}@ ended %{public}@ and will not be exposed to MLRuntime", (uint8_t *)&v13, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v3, "artifact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundTask");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc(MEMORY[0x1E0DC09B0]);
    objc_msgSend(v3, "bmltDeployment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithDeployment:", v10);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC09A0]), "initWithBmlt:factorsState:", v8, v11);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);

  }
}

- (void)bmltRecordsWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  void (**v7)(_QWORD, _QWORD);
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  TRIXPCStatusRequestHandler *v14;
  id v15;
  id v16;
  _QWORD v17[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __56__TRIXPCStatusRequestHandler_bmltRecordsWithCompletion___block_invoke;
  v17[3] = &unk_1E9330738;
  v17[4] = self;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v17);
  v6[2](v6, 0);
  v10 = v5;
  v11 = 3221225472;
  v12 = __56__TRIXPCStatusRequestHandler_bmltRecordsWithCompletion___block_invoke_104;
  v13 = &unk_1E9330CF8;
  v15 = v4;
  v16 = v6;
  v14 = self;
  v7 = v6;
  v8 = v4;
  v9 = (void *)MEMORY[0x1D8232C48](&v10);
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](self->_promise, "addBlockToExecuteAfterPromiseFullfillment:", v9, v10, v11, v12, v13, v14);

}

void __56__TRIXPCStatusRequestHandler_bmltRecordsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
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
    v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
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
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s bmltRecordsWithCompletion:", (uint8_t *)v11, 0x26u);

  }
}

void __56__TRIXPCStatusRequestHandler_bmltRecordsWithCompletion___block_invoke_104(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD, _QWORD, _QWORD);
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int v28;
  int v29;
  int v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _BYTE buf[32];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __56__TRIXPCStatusRequestHandler_bmltRecordsWithCompletion___block_invoke_2;
    v35[3] = &unk_1E9330760;
    v36 = *(id *)(a1 + 48);
    v9 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v35);
    v33[0] = v8;
    v33[1] = 3221225472;
    v33[2] = __56__TRIXPCStatusRequestHandler_bmltRecordsWithCompletion___block_invoke_3;
    v33[3] = &unk_1E93307D8;
    v34 = *(id *)(a1 + 40);
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D8232C48](v33);
    v11 = *MEMORY[0x1E0DC0E38];
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_OWORD *)(v12 + 32);
    *(_OWORD *)buf = *(_OWORD *)(v12 + 16);
    *(_OWORD *)&buf[16] = v13;
    objc_msgSend(MEMORY[0x1E0DC0A18], "objectForEntitlement:withAuditToken:", v11, buf);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v14);
        if ((objc_msgSend(v15, "containsObject:", &unk_1E9364008) & 1) != 0)
        {
          v16 = (void *)objc_opt_new();
          objc_msgSend(v5, "bmltDatabase");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = v8;
          v31[1] = 3221225472;
          v31[2] = __56__TRIXPCStatusRequestHandler_bmltRecordsWithCompletion___block_invoke_105;
          v31[3] = &unk_1E9336818;
          v18 = v16;
          v32 = v18;
          v19 = objc_msgSend(v17, "enumerateTaskRecordsWithBlock:", v31);

          if ((v19 & 1) != 0)
          {
            v20 = *(_QWORD *)(a1 + 40);
            if (v20)
              (*(void (**)(uint64_t, id, _QWORD))(v20 + 16))(v20, v18, 0);
          }
          else
          {
            ((void (**)(_QWORD, uint64_t, const __CFString *))v10)[2](v10, 12, CFSTR("The database query failed."));
          }
          v27 = v32;
        }
        else
        {
          TRIDeploymentEnvironment_EnumDescriptor();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "textFormatNameForValue:", 0);
          v18 = (id)objc_claimAutoreleasedReturnValue();

          TRILogCategory_Server();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v30 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = v30;
            *(_WORD *)&buf[8] = 2112;
            *(_QWORD *)&buf[10] = v18;
            _os_log_error_impl(&dword_1D207F000, v26, OS_LOG_TYPE_ERROR, "bmltRecordsWithCompletion: the calling process (pid %d) is not entitled for access to deployment environment %@.", buf, 0x12u);
          }

          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The calling process is not entitled for access to deployment environments %@."), v18);
          ((void (**)(_QWORD, uint64_t, void *))v10)[2](v10, 3, v27);
        }

      }
      else
      {
        TRILogCategory_Server();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v29 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v29;
          *(_WORD *)&buf[8] = 2114;
          *(_QWORD *)&buf[10] = v11;
          _os_log_error_impl(&dword_1D207F000, v24, OS_LOG_TYPE_ERROR, "bmltRecordsWithCompletion: the calling process (pid %d) has ill-typed value for entitlement \"%{public}@\" (expected array).", buf, 0x12u);
        }

        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The calling process has a value for entitlement \"%@\" which is not array-valued."), v11);
        ((void (**)(_QWORD, uint64_t, void *))v10)[2](v10, 3, v15);
      }
    }
    else
    {
      TRILogCategory_Server();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v28 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v28;
        *(_WORD *)&buf[8] = 2114;
        *(_QWORD *)&buf[10] = v11;
        _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, "bmltRecordsWithCompletion: the calling process (pid %d) is missing entitlement \"%{public}@\".", buf, 0x12u);
      }

      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The calling process is missing entitlement \"%@\"."), v11);
      ((void (**)(_QWORD, uint64_t, void *))v10)[2](v10, 3, v15);
    }

    if (v9)
      v9[2](v9);

  }
  else
  {
    v21 = *(_QWORD *)(a1 + 40);
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v21 + 16))(v21, 0, v22);

    }
  }

}

uint64_t __56__TRIXPCStatusRequestHandler_bmltRecordsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__TRIXPCStatusRequestHandler_bmltRecordsWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
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

void __56__TRIXPCStatusRequestHandler_bmltRecordsWithCompletion___block_invoke_105(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v20;

  v20 = a2;
  objc_msgSend(v20, "artifact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedNamespace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v20, "artifact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundTask");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectedNamespace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  v9 = objc_alloc(MEMORY[0x1E0DC0B28]);
  objc_msgSend(v20, "bmltDeployment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "pluginId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activeFactorPackSetId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activeTargetingRuleIndex");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "targetedFactorPackSetId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "targetedTargetingRuleIndex");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v20, "status");
  objc_msgSend(v20, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v9, "initWithBmltDeployment:pluginId:activeFactorPackSetId:activeTargetingRuleIndex:targetedFactorPackSetId:targetedTargetingRuleIndex:status:endDate:namespace:", v10, v11, v12, v13, v14, v15, v16, v17, v8);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v18);
}

void __59__TRIXPCStatusRequestHandler_rolloutRecordsWithCompletion___block_invoke_107(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD, _QWORD, _QWORD);
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int v28;
  int v29;
  int v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _BYTE buf[32];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __59__TRIXPCStatusRequestHandler_rolloutRecordsWithCompletion___block_invoke_2;
    v35[3] = &unk_1E9330760;
    v36 = *(id *)(a1 + 48);
    v9 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v35);
    v33[0] = v8;
    v33[1] = 3221225472;
    v33[2] = __59__TRIXPCStatusRequestHandler_rolloutRecordsWithCompletion___block_invoke_3;
    v33[3] = &unk_1E93307D8;
    v34 = *(id *)(a1 + 40);
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D8232C48](v33);
    v11 = *MEMORY[0x1E0DC0E38];
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_OWORD *)(v12 + 32);
    *(_OWORD *)buf = *(_OWORD *)(v12 + 16);
    *(_OWORD *)&buf[16] = v13;
    objc_msgSend(MEMORY[0x1E0DC0A18], "objectForEntitlement:withAuditToken:", v11, buf);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v14);
        if ((objc_msgSend(v15, "containsObject:", &unk_1E9364008) & 1) != 0)
        {
          v16 = (void *)objc_opt_new();
          objc_msgSend(v5, "rolloutDatabase");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = v8;
          v31[1] = 3221225472;
          v31[2] = __59__TRIXPCStatusRequestHandler_rolloutRecordsWithCompletion___block_invoke_108;
          v31[3] = &unk_1E93304F8;
          v18 = v16;
          v32 = v18;
          v19 = objc_msgSend(v17, "enumerateRecordsUsingTransaction:block:", 0, v31);

          if ((v19 & 1) != 0)
          {
            v20 = *(_QWORD *)(a1 + 40);
            if (v20)
              (*(void (**)(uint64_t, id, _QWORD))(v20 + 16))(v20, v18, 0);
          }
          else
          {
            ((void (**)(_QWORD, uint64_t, const __CFString *))v10)[2](v10, 12, CFSTR("The database query failed."));
          }
          v27 = v32;
        }
        else
        {
          TRIDeploymentEnvironment_EnumDescriptor();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "textFormatNameForValue:", 0);
          v18 = (id)objc_claimAutoreleasedReturnValue();

          TRILogCategory_Server();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v30 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = v30;
            *(_WORD *)&buf[8] = 2112;
            *(_QWORD *)&buf[10] = v18;
            _os_log_error_impl(&dword_1D207F000, v26, OS_LOG_TYPE_ERROR, "rolloutRecordsWithCompletion: the calling process (pid %d) is not entitled for access to deployment environment %@.", buf, 0x12u);
          }

          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The calling process is not entitled for access to deployment environments %@."), v18);
          ((void (**)(_QWORD, uint64_t, void *))v10)[2](v10, 3, v27);
        }

      }
      else
      {
        TRILogCategory_Server();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v29 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v29;
          *(_WORD *)&buf[8] = 2114;
          *(_QWORD *)&buf[10] = v11;
          _os_log_error_impl(&dword_1D207F000, v24, OS_LOG_TYPE_ERROR, "rolloutRecordsWithCompletion: the calling process (pid %d) has ill-typed value for entitlement \"%{public}@\" (expected array).", buf, 0x12u);
        }

        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The calling process has a value for entitlement \"%@\" which is not array-valued."), v11);
        ((void (**)(_QWORD, uint64_t, void *))v10)[2](v10, 3, v15);
      }
    }
    else
    {
      TRILogCategory_Server();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v28 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v28;
        *(_WORD *)&buf[8] = 2114;
        *(_QWORD *)&buf[10] = v11;
        _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, "rolloutRecordsWithCompletion: the calling process (pid %d) is missing entitlement \"%{public}@\".", buf, 0x12u);
      }

      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The calling process is missing entitlement \"%@\"."), v11);
      ((void (**)(_QWORD, uint64_t, void *))v10)[2](v10, 3, v15);
    }

    if (v9)
      v9[2](v9);

  }
  else
  {
    v21 = *(_QWORD *)(a1 + 40);
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v21 + 16))(v21, 0, v22);

    }
  }

}

uint64_t __59__TRIXPCStatusRequestHandler_rolloutRecordsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__TRIXPCStatusRequestHandler_rolloutRecordsWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
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

void __59__TRIXPCStatusRequestHandler_rolloutRecordsWithCompletion___block_invoke_108(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC0B38], "partialRecordWithFullRecord:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __88__TRIXPCStatusRequestHandler_rolloutAllocationStatusWithPrivacyFilterPolicy_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id obj;
  id v35;
  void *v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a3)
  {
    v6 = objc_alloc(MEMORY[0x1E0DC09F8]);
    objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithPaths:factorsState:", v7, 0);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v30 = v5;
    obj = v5;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (!v9)
      goto LABEL_23;
    v10 = v9;
    v11 = *(_QWORD *)v43;
    v31 = *(_QWORD *)v43;
    while (1)
    {
      v12 = 0;
      v32 = v10;
      do
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v12);
        objc_msgSend(v13, "activeFactorPackSetId", v30);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v37 = v12;
          v15 = (void *)objc_opt_new();
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v36 = v13;
          objc_msgSend(v13, "namespaces");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v39;
            v20 = 1;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v39 != v19)
                  objc_enumerationMutation(v16);
                v22 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
                v20 &= objc_msgSend(MEMORY[0x1E0DC0AF0], "shouldPrivacyFilterNamespace:policy:", v22, *(unsigned __int8 *)(a1 + 40)) ^ 1;
                objc_msgSend(v8, "factorPackIdForRolloutWithNamespaceName:", v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, v22);

              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
            }
            while (v18);

            v11 = v31;
            v10 = v32;
            if ((v20 & 1) == 0)
              goto LABEL_20;
          }
          else
          {

          }
          v35 = objc_alloc(MEMORY[0x1E0DC0B58]);
          objc_msgSend(v36, "deployment");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "rolloutId");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "deployment");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "deploymentId");
          objc_msgSend(v36, "rampId");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v35, "initWithRolloutId:deploymentId:rampId:factorPackIds:", v25, v27, v28, v15);
          objc_msgSend(v33, "addObject:", v29);

LABEL_20:
          v12 = v37;
        }
        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (!v10)
      {
LABEL_23:

        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        v5 = v30;
        goto LABEL_24;
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_24:

}

@end
