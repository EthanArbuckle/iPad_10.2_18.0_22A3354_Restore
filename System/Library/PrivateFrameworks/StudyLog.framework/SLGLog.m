@implementation SLGLog

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_shared;
}

void __24__SLGLog_sharedInstance__block_invoke()
{
  SLGDomainWhitelist *v0;
  SLGLog *v1;
  void *v2;
  SLGLogXPCClient *v3;

  if (SLGLogIsEnabled())
  {
    v3 = objc_alloc_init(SLGLogXPCClient);
    v0 = objc_alloc_init(SLGDomainWhitelist);
    v1 = -[SLGLog initWithClient:whitelist:enabled:]([SLGLog alloc], "initWithClient:whitelist:enabled:", v3, v0, 1);
    v2 = (void *)sharedInstance_shared;
    sharedInstance_shared = (uint64_t)v1;

  }
}

- (SLGLog)initWithClient:(id)a3 whitelist:(id)a4 enabled:(BOOL)a5
{
  id v8;
  id v9;
  SLGLog *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *observerLockQueue;
  dispatch_queue_t v14;
  OS_dispatch_queue *observerCalloutQueue;
  uint64_t v16;
  NSHashTable *observers;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SLGLog;
  v10 = -[SLGLog init](&v19, sel_init);
  if (v10)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("SLGLogObserverLock", v11);
    observerLockQueue = v10->_observerLockQueue;
    v10->_observerLockQueue = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_create("SLGLogObserverCallout", v11);
    observerCalloutQueue = v10->_observerCalloutQueue;
    v10->_observerCalloutQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v10->_whitelist, a4);
    -[SLGLog _setClient:](v10, "_setClient:", v8);
    -[SLGLog _fetchProcessInfo](v10, "_fetchProcessInfo");
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v16 = objc_claimAutoreleasedReturnValue();
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v16;

    v10->_isEnabled = a5;
  }

  return v10;
}

- (SLGLog)init
{
  return -[SLGLog initWithClient:whitelist:enabled:](self, "initWithClient:whitelist:enabled:", 0, 0, SLGLogIsEnabled());
}

- (void)beginSessionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  SLGLogClientProtocol *client;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD block[4];
  id v16;

  v4 = a3;
  v5 = v4;
  if (self->_isEnabled)
  {
    SLGCreateSessionStartMetadata();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    client = self->_client;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __37__SLGLog_beginSessionWithCompletion___block_invoke_2;
    v12[3] = &unk_1E81F3358;
    v13 = v6;
    v14 = v5;
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __37__SLGLog_beginSessionWithCompletion___block_invoke_5;
    v10[3] = &unk_1E81F3330;
    v11 = v14;
    v9 = v6;
    -[SLGLogClientProtocol queryServer:errorHandler:](client, "queryServer:errorHandler:", v12, v10);

LABEL_5:
    goto LABEL_6;
  }
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__SLGLog_beginSessionWithCompletion___block_invoke;
    block[3] = &unk_1E81F32E0;
    v16 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v9 = v16;
    goto LABEL_5;
  }
LABEL_6:

}

void __37__SLGLog_beginSessionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  SLGCreateLoggingIsDisabledError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __37__SLGLog_beginSessionWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__SLGLog_beginSessionWithCompletion___block_invoke_3;
  v4[3] = &unk_1E81F3330;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "beginSessionWithJSONMetadata:completion:", v3, v4);

}

void __37__SLGLog_beginSessionWithCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  char v9;

  v5 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__SLGLog_beginSessionWithCompletion___block_invoke_4;
    block[3] = &unk_1E81F3308;
    v8 = *(id *)(a1 + 32);
    v9 = a2;
    v7 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __37__SLGLog_beginSessionWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __37__SLGLog_beginSessionWithCompletion___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  char v9;

  v5 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__SLGLog_beginSessionWithCompletion___block_invoke_6;
    block[3] = &unk_1E81F3308;
    v8 = *(id *)(a1 + 32);
    v9 = a2;
    v7 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __37__SLGLog_beginSessionWithCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)endSessionAndRenameFileTo:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  SLGLogClientProtocol *client;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_isEnabled)
  {
    SLGCreateSessionEndMetadata();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    client = self->_client;
    v11 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke_2;
    v15[3] = &unk_1E81F3380;
    v16 = v6;
    v17 = v9;
    v18 = v8;
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke_5;
    v13[3] = &unk_1E81F3330;
    v14 = v18;
    v12 = v9;
    -[SLGLogClientProtocol queryServer:errorHandler:](client, "queryServer:errorHandler:", v15, v13);

LABEL_5:
    goto LABEL_6;
  }
  if (v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke;
    block[3] = &unk_1E81F32E0;
    v20 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v12 = v20;
    goto LABEL_5;
  }
LABEL_6:

}

void __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  SLGCreateLoggingIsDisabledError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke_3;
  v5[3] = &unk_1E81F3330;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "endSessionAndRenameFileTo:withJSONMetadata:completion:", v3, v4, v5);

}

void __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  char v9;

  v5 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke_4;
    block[3] = &unk_1E81F3308;
    v8 = *(id *)(a1 + 32);
    v9 = a2;
    v7 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  char v9;

  v5 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke_6;
    block[3] = &unk_1E81F3308;
    v8 = *(id *)(a1 + 32);
    v9 = a2;
    v7 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __51__SLGLog_endSessionAndRenameFileTo_withCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)endSessionWithCompletion:(id)a3
{
  -[SLGLog endSessionAndRenameFileTo:withCompletion:](self, "endSessionAndRenameFileTo:withCompletion:", 0, a3);
}

- (void)resetWithCompletion:(id)a3
{
  -[SLGLog reset:completion:](self, "reset:completion:", 1, a3);
}

- (void)reset:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  SLGLogClientProtocol *client;
  uint64_t v9;
  id *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14[2];
  _QWORD block[4];
  id v16;

  v6 = a4;
  v7 = v6;
  if (self->_isEnabled)
  {
    client = self->_client;
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __27__SLGLog_reset_completion___block_invoke_2;
    v13[3] = &unk_1E81F33A8;
    v14[1] = (id)a3;
    v10 = v14;
    v14[0] = v6;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __27__SLGLog_reset_completion___block_invoke_5;
    v11[3] = &unk_1E81F3330;
    v12 = v14[0];
    -[SLGLogClientProtocol queryServer:errorHandler:](client, "queryServer:errorHandler:", v13, v11);

LABEL_5:
    goto LABEL_6;
  }
  if (v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__SLGLog_reset_completion___block_invoke;
    block[3] = &unk_1E81F32E0;
    v10 = &v16;
    v16 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    goto LABEL_5;
  }
LABEL_6:

}

void __27__SLGLog_reset_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  SLGCreateLoggingIsDisabledError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __27__SLGLog_reset_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__SLGLog_reset_completion___block_invoke_3;
  v4[3] = &unk_1E81F3330;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a2, "reset:completion:", v3, v4);

}

void __27__SLGLog_reset_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  char v9;

  v5 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__SLGLog_reset_completion___block_invoke_4;
    block[3] = &unk_1E81F3308;
    v8 = *(id *)(a1 + 32);
    v9 = a2;
    v7 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __27__SLGLog_reset_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __27__SLGLog_reset_completion___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  char v9;

  v5 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__SLGLog_reset_completion___block_invoke_6;
    block[3] = &unk_1E81F3308;
    v8 = *(id *)(a1 + 32);
    v9 = a2;
    v7 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __27__SLGLog_reset_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)log:(id)a3 domain:(id)a4 tags:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  SLGDomainWhitelisting *whitelist;
  void *v16;
  id v17;
  id *v18;
  id *v19;
  SLGLogClientProtocol *client;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (self->_isEnabled)
  {
    whitelist = self->_whitelist;
    if (!whitelist || (-[SLGDomainWhitelisting isDomainWhitelisted:](whitelist, "isDomainWhitelisted:", v11) & 1) != 0)
    {
      v31 = 0;
      -[SLGLog _serializeObjectAsLogEntry:domain:tags:error:](self, "_serializeObjectAsLogEntry:domain:tags:error:", v10, v11, v12, &v31);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v31;
      if (v17)
      {
        if (!v14)
        {
LABEL_13:

          goto LABEL_14;
        }
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __37__SLGLog_log_domain_tags_completion___block_invoke_3;
        block[3] = &unk_1E81F33D0;
        v18 = &v30;
        v30 = v14;
        v19 = &v29;
        v29 = v17;
        dispatch_async(MEMORY[0x1E0C80D38], block);
      }
      else
      {
        client = self->_client;
        v21 = MEMORY[0x1E0C809B0];
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __37__SLGLog_log_domain_tags_completion___block_invoke_4;
        v24[3] = &unk_1E81F3380;
        v18 = &v25;
        v25 = v16;
        v19 = &v26;
        v26 = v11;
        v27 = v14;
        v22[0] = v21;
        v22[1] = 3221225472;
        v22[2] = __37__SLGLog_log_domain_tags_completion___block_invoke_7;
        v22[3] = &unk_1E81F3330;
        v23 = v27;
        -[SLGLogClientProtocol queryServer:errorHandler:](client, "queryServer:errorHandler:", v24, v22);

      }
      goto LABEL_13;
    }
    if (v14)
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __37__SLGLog_log_domain_tags_completion___block_invoke_2;
      v32[3] = &unk_1E81F33D0;
      v34 = v14;
      v33 = v11;
      dispatch_async(MEMORY[0x1E0C80D38], v32);

      v17 = v34;
      goto LABEL_14;
    }
  }
  else if (v13)
  {
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __37__SLGLog_log_domain_tags_completion___block_invoke;
    v35[3] = &unk_1E81F32E0;
    v36 = v13;
    dispatch_async(MEMORY[0x1E0C80D38], v35);
    v17 = v36;
LABEL_14:

  }
}

void __37__SLGLog_log_domain_tags_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  SLGCreateLoggingIsDisabledError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __37__SLGLog_log_domain_tags_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Domain %@ is not whitelisted"), *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  SLGCreateError(10, v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v2);

}

uint64_t __37__SLGLog_log_domain_tags_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __37__SLGLog_log_domain_tags_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__SLGLog_log_domain_tags_completion___block_invoke_5;
  v5[3] = &unk_1E81F3330;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "logJSONData:domain:completion:", v3, v4, v5);

}

void __37__SLGLog_log_domain_tags_completion___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  char v9;

  v5 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__SLGLog_log_domain_tags_completion___block_invoke_6;
    block[3] = &unk_1E81F3308;
    v8 = *(id *)(a1 + 32);
    v9 = a2;
    v7 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __37__SLGLog_log_domain_tags_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __37__SLGLog_log_domain_tags_completion___block_invoke_7(uint64_t a1, char a2, void *a3)
{
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  char v9;

  v5 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__SLGLog_log_domain_tags_completion___block_invoke_8;
    block[3] = &unk_1E81F3308;
    v8 = *(id *)(a1 + 32);
    v9 = a2;
    v7 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __37__SLGLog_log_domain_tags_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)log:(id)a3 completion:(id)a4
{
  -[SLGLog log:domain:tags:completion:](self, "log:domain:tags:completion:", a3, 0, 0, a4);
}

- (void)log:(id)a3 domain:(id)a4 completion:(id)a5
{
  -[SLGLog log:domain:tags:completion:](self, "log:domain:tags:completion:", a3, a4, 0, a5);
}

- (void)log:(id)a3 tags:(id)a4 completion:(id)a5
{
  -[SLGLog log:domain:tags:completion:](self, "log:domain:tags:completion:", a3, 0, a4, a5);
}

- (void)log:(id)a3 tags:(id)a4
{
  -[SLGLog log:domain:tags:completion:](self, "log:domain:tags:completion:", a3, 0, a4, 0);
}

- (void)log:(id)a3 domain:(id)a4 tags:(id)a5
{
  -[SLGLog log:domain:tags:completion:](self, "log:domain:tags:completion:", a3, a4, a5, 0);
}

- (void)log:(id)a3
{
  -[SLGLog log:domain:tags:completion:](self, "log:domain:tags:completion:", a3, 0, 0, 0);
}

- (void)log:(id)a3 domain:(id)a4
{
  -[SLGLog log:domain:tags:completion:](self, "log:domain:tags:completion:", a3, a4, 0, 0);
}

- (void)logBlock:(id)a3
{
  -[SLGLog logBlock:domain:tags:completion:](self, "logBlock:domain:tags:completion:", a3, 0, 0, 0);
}

- (void)logBlock:(id)a3 domain:(id)a4
{
  -[SLGLog logBlock:domain:tags:completion:](self, "logBlock:domain:tags:completion:", a3, a4, 0, 0);
}

- (void)logBlock:(id)a3 tags:(id)a4
{
  -[SLGLog logBlock:domain:tags:completion:](self, "logBlock:domain:tags:completion:", a3, 0, a4, 0);
}

- (void)logBlock:(id)a3 tags:(id)a4 completion:(id)a5
{
  -[SLGLog logBlock:domain:tags:completion:](self, "logBlock:domain:tags:completion:", a3, 0, a4, a5);
}

- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5
{
  -[SLGLog logBlock:domain:tags:completion:](self, "logBlock:domain:tags:completion:", a3, a4, a5, 0);
}

- (void)logBlock:(id)a3 completion:(id)a4
{
  -[SLGLog logBlock:domain:tags:completion:](self, "logBlock:domain:tags:completion:", a3, 0, 0, a4);
}

- (void)logBlock:(id)a3 domain:(id)a4 completion:(id)a5
{
  -[SLGLog logBlock:domain:tags:completion:](self, "logBlock:domain:tags:completion:", a3, 0, 0, a5);
}

- (void)logBlock:(id)a3 domain:(id)a4 tags:(id)a5 completion:(id)a6
{
  void (**v10)(_QWORD);
  id v11;
  void (**v12)(_QWORD);
  id v13;
  void *v14;
  SLGDomainWhitelisting *whitelist;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD block[4];
  id v23;

  v10 = (void (**)(_QWORD))a3;
  v11 = a4;
  v12 = (void (**)(_QWORD))a5;
  v13 = a6;
  v14 = v13;
  if (!self->_isEnabled)
  {
    if (!v13)
      goto LABEL_13;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__SLGLog_logBlock_domain_tags_completion___block_invoke;
    block[3] = &unk_1E81F32E0;
    v23 = v13;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v17 = v23;
LABEL_10:

    goto LABEL_13;
  }
  whitelist = self->_whitelist;
  if (whitelist && (-[SLGDomainWhitelisting isDomainWhitelisted:](whitelist, "isDomainWhitelisted:", v11) & 1) == 0)
  {
    if (!v14)
      goto LABEL_13;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __42__SLGLog_logBlock_domain_tags_completion___block_invoke_2;
    v19[3] = &unk_1E81F33D0;
    v21 = v14;
    v20 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], v19);

    v17 = v21;
    goto LABEL_10;
  }
  if (v12)
  {
    v12[2](v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  v10[2](v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLGLog log:domain:tags:completion:](self, "log:domain:tags:completion:", v18, v11, v16, v14);

LABEL_13:
}

void __42__SLGLog_logBlock_domain_tags_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  SLGCreateLoggingIsDisabledError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __42__SLGLog_logBlock_domain_tags_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Domain %@ is not whitelisted"), *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  SLGCreateError(10, v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v2);

}

- (void)beginSession
{
  -[SLGLog beginSessionWithCompletion:](self, "beginSessionWithCompletion:", 0);
}

- (void)endSession
{
  -[SLGLog endSessionWithCompletion:](self, "endSessionWithCompletion:", 0);
}

- (void)reset
{
  -[SLGLog resetWithCompletion:](self, "resetWithCompletion:", 0);
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *observerLockQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  observerLockQueue = self->_observerLockQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __22__SLGLog_addObserver___block_invoke;
  v7[3] = &unk_1E81F3248;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(observerLockQueue, v7);

}

uint64_t __22__SLGLog_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *observerLockQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  observerLockQueue = self->_observerLockQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __25__SLGLog_removeObserver___block_invoke;
  v7[3] = &unk_1E81F3248;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(observerLockQueue, v7);

}

uint64_t __25__SLGLog_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)allowUnspecifiedDomains
{
  return -[SLGDomainWhitelisting allowUnspecifiedDomains](self->_whitelist, "allowUnspecifiedDomains");
}

- (void)setAllowUnspecifiedDomains:(BOOL)a3
{
  -[SLGDomainWhitelisting setAllowUnspecifiedDomains:](self->_whitelist, "setAllowUnspecifiedDomains:", a3);
}

- (NSSet)whitelistedDomains
{
  return (NSSet *)-[SLGDomainWhitelisting whitelist](self->_whitelist, "whitelist");
}

- (void)addDomainToWhitelist:(id)a3
{
  -[SLGDomainWhitelisting addDomain:](self->_whitelist, "addDomain:", a3);
}

- (void)removeDomainFromWhitelist:(id)a3
{
  -[SLGDomainWhitelisting removeDomain:](self->_whitelist, "removeDomain:", a3);
}

- (void)client:(id)a3 didReceiveInitialLogMessageFromDomain:(id)a4
{
  id v5;
  NSObject *observerLockQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  observerLockQueue = self->_observerLockQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__SLGLog_client_didReceiveInitialLogMessageFromDomain___block_invoke;
  v8[3] = &unk_1E81F3248;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(observerLockQueue, v8);

}

void __55__SLGLog_client_didReceiveInitialLogMessageFromDomain___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(v3 + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__SLGLog_client_didReceiveInitialLogMessageFromDomain___block_invoke_2;
  block[3] = &unk_1E81F3420;
  v8 = v2;
  v9 = v3;
  v10 = v4;
  v6 = v2;
  dispatch_async(v5, block);

}

void __55__SLGLog_client_didReceiveInitialLogMessageFromDomain___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__SLGLog_client_didReceiveInitialLogMessageFromDomain___block_invoke_3;
  v2[3] = &unk_1E81F33F8;
  v1 = *(void **)(a1 + 32);
  v2[4] = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);

}

uint64_t __55__SLGLog_client_didReceiveInitialLogMessageFromDomain___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "log:didReceiveInitialLogMessageFromDomain:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)clientDidReceiveServerReset:(id)a3
{
  NSObject *observerLockQueue;
  _QWORD block[5];

  observerLockQueue = self->_observerLockQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SLGLog_clientDidReceiveServerReset___block_invoke;
  block[3] = &unk_1E81F3270;
  block[4] = self;
  dispatch_async(observerLockQueue, block);
}

void __38__SLGLog_clientDidReceiveServerReset___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 64);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__SLGLog_clientDidReceiveServerReset___block_invoke_2;
  v6[3] = &unk_1E81F3248;
  v7 = v2;
  v8 = v3;
  v5 = v2;
  dispatch_async(v4, v6);

}

uint64_t __38__SLGLog_clientDidReceiveServerReset___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__SLGLog_clientDidReceiveServerReset___block_invoke_3;
  v3[3] = &unk_1E81F3448;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateObjectsUsingBlock:", v3);
}

uint64_t __38__SLGLog_clientDidReceiveServerReset___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "logDidReceiveResetFromServer:", *(_QWORD *)(a1 + 32));
}

- (void)_fetchProcessInfo
{
  uint64_t v3;
  NSNumber *v4;
  NSNumber *pid;
  NSString *v6;
  NSString *processName;
  _OWORD v8[4];
  _OWORD v9[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = getpid();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  pid = self->_pid;
  self->_pid = v4;

  v10 = 0;
  memset(v9, 0, sizeof(v9));
  memset(v8, 0, sizeof(v8));
  proc_pidinfo(v3, 3, 0, v8, 136);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  processName = self->_processName;
  self->_processName = v6;

}

- (void)_setClient:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_client, a3);
  v5 = a3;
  -[SLGLogClientProtocol setDelegate:](self->_client, "setDelegate:", self);

}

- (id)_serializeObjectAsLogEntry:(id)a3 domain:(id)a4 tags:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[SLGLog _wrapObjectWithEntryMetadata:domain:tags:](self, "_wrapObjectWithEntryMetadata:domain:tags:", v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v13, 0, &v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v25;
  if (v15)
  {
    slg_general_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SLGLog _serializeObjectAsLogEntry:domain:tags:error:].cold.1((uint64_t)v10, v16, v17, v18, v19, v20, v21, v22);

    if (a6)
    {
      SLGCreateError(3, CFSTR("Error serializing object to JSON"));
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v23 = v14;

  return v23;
}

- (id)_wrapObjectWithEntryMetadata:(id)a3 domain:(id)a4 tags:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("timestamp"));

  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v12, "timeIntervalSince1970");
  objc_msgSend(v15, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("date"));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", self->_pid, CFSTR("pid"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", self->_processName, CFSTR("processName"));
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("uuid"));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, CFSTR("data"));
  if (v8)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, CFSTR("domain"));
  if (v9 && objc_msgSend(v9, "count"))
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("tags"));

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerCalloutQueue, 0);
  objc_storeStrong((id *)&self->_observerLockQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_pid, 0);
  objc_storeStrong((id *)&self->_whitelist, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)_serializeObjectAsLogEntry:(uint64_t)a3 domain:(uint64_t)a4 tags:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C890B000, a2, a3, "Error serializing object to JSON: %@", a5, a6, a7, a8, 2u);
}

@end
