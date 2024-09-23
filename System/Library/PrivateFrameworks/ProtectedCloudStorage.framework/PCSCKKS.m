@implementation PCSCKKS

+ (BOOL)fetchWithTimeout:(unint64_t)a3 error:(id *)a4
{
  id *v4;
  void *v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  NSObject *v19;
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
  uint64_t v32;
  _QWORD v33[2];

  v4 = a4;
  v33[1] = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__4;
  v26 = __Block_byref_object_dispose__4;
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0CD5C10], "controlObject:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = dispatch_semaphore_create(0);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __34__PCSCKKS_fetchWithTimeout_error___block_invoke;
    v18 = &unk_1E553E518;
    v20 = &v28;
    v21 = &v22;
    v8 = v7;
    v19 = v8;
    objc_msgSend(v6, "rpcFetchAndProcessChangesIfNoRecentFetch:reply:", CFSTR("ProtectedCloudStorage"), &v15);
    v9 = dispatch_time(0, 1000000000 * a3);
    if (dispatch_semaphore_wait(v8, v9))
    {
      if (v4)
      {
        v10 = (void *)MEMORY[0x1E0CB35C8];
        v11 = kPCSErrorDomain;
        v32 = *MEMORY[0x1E0CB2D50];
        v33[0] = CFSTR("rpcFetchAndProcessChangesIfNoRecentFetch timed out");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1, v15, v16, v17, v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 99, v12);
        *v4 = (id)objc_claimAutoreleasedReturnValue();

        LOBYTE(v4) = 0;
      }
    }
    else
    {
      if (v4)
      {
        v13 = (void *)v23[5];
        if (v13)
          *v4 = objc_retainAutorelease(v13);
      }
      LOBYTE(v4) = *((_BYTE *)v29 + 24) != 0;
    }

  }
  else
  {
    LOBYTE(v4) = 0;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  return (char)v4;
}

void __34__PCSCKKS_fetchWithTimeout_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (PCSCKKS)initWithIdentitySet:(_PCSIdentitySetData *)a3 dsid:(id)a4
{
  id v7;
  PCSCKKS *v8;
  PCSCKKS *v9;
  objc_super v11;

  v7 = a4;
  if (PCSCurrentPersonaMatchesDSIDFromSet((uint64_t)a3))
  {
    v11.receiver = self;
    v11.super_class = (Class)PCSCKKS;
    v8 = -[PCSCKKS init](&v11, sel_init);
    if (v8)
    {
      v8->_set = (_PCSIdentitySetData *)CFRetain(a3);
      objc_storeStrong((id *)&v8->_dsid, a4);
    }
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)dealloc
{
  _PCSIdentitySetData *set;
  objc_super v4;

  set = self->_set;
  if (set)
  {
    self->_set = 0;
    CFRelease(set);
  }
  v4.receiver = self;
  v4.super_class = (Class)PCSCKKS;
  -[PCSCKKS dealloc](&v4, sel_dealloc);
}

- (id)syncViewOperation:(id)a3
{
  id v3;
  PCSCKKSSyncViewOperation *v4;

  v3 = a3;
  v4 = -[PCSCKKSSyncViewOperation initWithItemModifyContext:]([PCSCKKSSyncViewOperation alloc], "initWithItemModifyContext:", v3);

  return v4;
}

- (id)fetchCurrentOperation:(id)a3
{
  id v3;
  PCSCKKSFetchCurrentOperation *v4;

  v3 = a3;
  v4 = -[PCSCKKSFetchCurrentOperation initWithItemModifyContext:]([PCSCKKSFetchCurrentOperation alloc], "initWithItemModifyContext:", v3);

  return v4;
}

- (id)ensurePCSFieldsOperation:(id)a3
{
  id v3;
  PCSCKKSEnsurePCSFieldsOperation *v4;

  v3 = a3;
  v4 = -[PCSCKKSEnsurePCSFieldsOperation initWithItemModifyContext:]([PCSCKKSEnsurePCSFieldsOperation alloc], "initWithItemModifyContext:", v3);

  return v4;
}

- (id)createIdentityOperation:(id)a3
{
  id v3;
  PCSCKKSCreateIdentityOperation *v4;

  v3 = a3;
  v4 = -[PCSCKKSCreateIdentityOperation initWithItemModifyContext:]([PCSCKKSCreateIdentityOperation alloc], "initWithItemModifyContext:", v3);

  return v4;
}

- (void)submitRequest:(id)a3 complete:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  _QWORD block[4];
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[7];

  v36[5] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[PCSCKKS syncViewOperation:](self, "syncViewOperation:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCSCKKS fetchCurrentOperation:](self, "fetchCurrentOperation:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSuccessDependency:", v8);
  -[PCSCKKS ensurePCSFieldsOperation:](self, "ensurePCSFieldsOperation:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSuccessDependency:", v9);
  -[PCSCKKS createIdentityOperation:](self, "createIdentityOperation:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSuccessDependency:", v10);
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("CreateIdentity: %@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __34__PCSCKKS_submitRequest_complete___block_invoke;
  v25[3] = &unk_1E553EDD0;
  v25[4] = self;
  v26 = v6;
  v16 = v6;
  +[PCSCKKSOperation operation:block:](PCSCKKSOperation, "operation:block:", v14, v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSuccessDependency:", v11);
  objc_msgSend(v7, "service");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v18;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__4;
  v34 = __Block_byref_object_dispose__4;
  v35 = 0;
  if (operationQueueForService_once != -1)
    dispatch_once(&operationQueueForService_once, &__block_literal_global_319);
  v20 = operationQueueForService_queue;
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __operationQueueForService_block_invoke_2;
  block[3] = &unk_1E553DFC0;
  v28 = v19;
  v29 = &v30;
  v21 = v19;
  dispatch_sync(v20, block);
  v22 = v28;
  v23 = (id)v31[5];

  _Block_object_dispose(&v30, 8);
  v36[0] = v17;
  v36[1] = v8;
  v36[2] = v9;
  v36[3] = v10;
  v36[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addOperations:waitUntilFinished:", v24, 0);

}

void __34__PCSCKKS_submitRequest_complete___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "stripOperationErrorIfPCSError:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (BOOL)shouldRetryWithSync:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  int v19;
  BOOL v20;
  void *v21;
  int v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("CKErrorDomain"));

  if (!v5)
  {
    objc_msgSend(v3, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("securityd"));

    if (v19)
    {
      v20 = objc_msgSend(v3, "code") == -50;
      goto LABEL_21;
    }
    objc_msgSend(v3, "domain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("CKKSErrorDomain"));

    if (!v22)
    {
      v17 = 0;
      goto LABEL_31;
    }
    if (objc_msgSend(v3, "code") == 12 || objc_msgSend(v3, "code") == 13)
    {
      v17 = 1;
      goto LABEL_31;
    }
LABEL_20:
    v20 = objc_msgSend(v3, "code") == 14;
LABEL_21:
    v17 = v20;
    goto LABEL_31;
  }
  if (objc_msgSend(v3, "code") != 2)
    goto LABEL_20;
  objc_msgSend(v3, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CKPartialErrors"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), (_QWORD)v24);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "domain");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("CKErrorDomain"));

          if (!v15)
          {

LABEL_28:
            v17 = 0;
            goto LABEL_29;
          }
          v16 = objc_msgSend(v13, "code");

          if (v16 != 14)
            goto LABEL_28;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        v17 = 1;
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v17 = 1;
    }
LABEL_29:

  }
  else
  {
    v17 = 0;
  }

LABEL_31:
  return v17;
}

- (void)createNewIdentity:(id)a3 roll:(BOOL)a4 sync:(BOOL)a5 forceSync:(BOOL)a6 complete:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  id v13;
  PCSCKKSItemModifyContext *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  PCSCKKSItemModifyContext *v27;
  void *v28;
  _QWORD v29[4];
  PCSCKKSItemModifyContext *v30;
  id v31;
  id v32;
  BOOL v33;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  v12 = a3;
  v13 = a7;
  v14 = objc_alloc_init(PCSCKKSItemModifyContext);
  -[PCSCKKSItemModifyContext setService:](v14, "setService:", v12);
  -[PCSCKKSItemModifyContext setSet:](v14, "setSet:", -[PCSCKKS set](self, "set"));
  -[PCSCKKS dsid](self, "dsid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCSCKKSItemModifyContext setDsid:](v14, "setDsid:", v15);

  -[PCSCKKSItemModifyContext setLog:](v14, "setLog:", PCSCreateLogContext(CFSTR("PCSCreateNewIdentity"), 0));
  -[PCSCKKSItemModifyContext setSync:](v14, "setSync:", v9);
  -[PCSCKKSItemModifyContext setForceSync:](v14, "setForceSync:", v8);
  -[PCSCKKSItemModifyContext setRoll:](v14, "setRoll:", v10);
  if (v10 && PCSServiceItemTypeIsManatee((_BOOL8)v12))
    v16 = 5;
  else
    v16 = 1;
  -[PCSCKKSItemModifyContext setRetryLeftCount:](v14, "setRetryLeftCount:", v16);
  v17 = (void *)os_transaction_create();
  -[PCSCKKSItemModifyContext setTransaction:](v14, "setTransaction:", v17);

  +[PCSLockManager manager](PCSLockManager, "manager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.protectedcloudstorage.identity-creation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lockAssertion:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCSCKKSItemModifyContext setLockAssertion:](v14, "setLockAssertion:", v20);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s-%@"), "com.apple.protectedcloudstorage.identity-creation", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "beginActivityWithOptions:reason:", 0x100000, v21);
  v23 = objc_claimAutoreleasedReturnValue();
  -[PCSCKKSItemModifyContext setActivityAssertion:](v14, "setActivityAssertion:", v23);

  -[PCSCKKSItemModifyContext lockAssertion](v14, "lockAssertion");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v23) = objc_msgSend(v24, "holdAssertion");

  if ((v23 & 1) == 0)
  {
    PCSMigrationLog((uint64_t)-[PCSCKKSItemModifyContext log](v14, "log"), CFSTR("Failed to get an lock assertion continue w/o one"));
    -[PCSCKKSItemModifyContext setLockAssertion:](v14, "setLockAssertion:", 0);
  }
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __58__PCSCKKS_createNewIdentity_roll_sync_forceSync_complete___block_invoke;
  v29[3] = &unk_1E553EDF8;
  v30 = v14;
  v31 = v12;
  v33 = v10;
  v32 = v13;
  v25 = v13;
  v26 = v12;
  v27 = v14;
  v28 = (void *)MEMORY[0x1AF4156AC](v29);
  -[PCSCKKS createIdentity:complete:](self, "createIdentity:complete:", v27, v28);

}

void __58__PCSCKKS_createNewIdentity_roll_sync_forceSync_complete___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString **v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _QWORD v44[5];
  _QWORD v45[5];
  _BYTE v46[128];
  const __CFString *v47;
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "mtt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

  objc_msgSend(*(id *)(a1 + 32), "lockAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "lockAssertion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dropAssertion");

    objc_msgSend(*(id *)(a1 + 32), "setLockAssertion:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "setTransaction:", 0);
  objc_msgSend(*(id *)(a1 + 32), "activityAssertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "activityAssertion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endActivity:", v9);

    objc_msgSend(*(id *)(a1 + 32), "setActivityAssertion:", 0);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "roll"))
  {
    v48[0] = CFSTR("PCSEventKeyCreation");
    v48[1] = CFSTR("PCSEventIndividualKeyRoll");
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = (const __CFString **)v48;
    v12 = 2;
  }
  else
  {
    v47 = CFSTR("PCSEventKeyCreation");
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = &v47;
    v12 = 1;
  }
  objc_msgSend(v10, "arrayWithObjects:count:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PCSAnalytics logger](PCSAnalytics, "logger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "currentIdentity"))
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v40 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(v14, "logSuccessForEvent:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v17);
    }
  }
  else
  {
    v44[0] = CFSTR("roll");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "roll"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v20;
    v44[1] = CFSTR("sync");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "sync"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v21;
    v44[2] = CFSTR("retryLeftCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "retryLeftCount"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v22;
    v44[3] = CFSTR("lockassertion");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5 != 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v44[4] = CFSTR("service");
    v24 = *(_QWORD *)(a1 + 40);
    v45[3] = v23;
    v45[4] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 5);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v25 = v13;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v36 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(v14, "logUnrecoverableError:forEvent:withAttributes:", v3, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j), v15);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v27);
    }

  }
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.protectedcloudstorage.roll.%@"), *(_QWORD *)(a1 + 40));
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    notify_post((const char *)objc_msgSend(v30, "UTF8String"));

  }
  v31 = *(_QWORD *)(a1 + 48);
  v32 = objc_msgSend(*(id *)(a1 + 32), "currentIdentity");
  objc_msgSend(*(id *)(a1 + 32), "currentItemReference");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mtt");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *, void *, uint64_t, id))(v31 + 16))(v31, v32, v33, v34, objc_msgSend(*(id *)(a1 + 32), "returnedExistingIdentity"), v3);

}

- (void)createIdentity:(id)a3 complete:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  PCSCKKS *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __35__PCSCKKS_createIdentity_complete___block_invoke;
  v10[3] = &unk_1E553EE20;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[PCSCKKS submitRequest:complete:](self, "submitRequest:complete:", v9, v10);

}

void __35__PCSCKKS_createIdentity_complete___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((int)objc_msgSend(*(id *)(a1 + 32), "retryLeftCount") >= 1
    && objc_msgSend(*(id *)(a1 + 40), "shouldRetryWithSync:", v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "setRetryLeftCount:", objc_msgSend(*(id *)(a1 + 32), "retryLeftCount") - 1);
    objc_msgSend(*(id *)(a1 + 32), "resetIdentities");
    objc_msgSend(*(id *)(a1 + 32), "setSync:", 1);
    objc_msgSend(*(id *)(a1 + 32), "transaction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    os_transaction_needs_more_time();

    objc_msgSend(*(id *)(a1 + 40), "createIdentity:complete:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (id)stripOperationErrorIfPCSError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  v3 = a3;
  if (objc_msgSend(v3, "code") != 1)
    goto LABEL_4;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", PCSCKKSOperationErrorDomain);

  if (!v5
    || (objc_msgSend(v3, "userInfo"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]),
        v7 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
LABEL_4:
    v7 = v3;
  }

  return v7;
}

- (_PCSIdentitySetData)set
{
  return self->_set;
}

- (void)setSet:(_PCSIdentitySetData *)a3
{
  self->_set = a3;
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDsid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end
