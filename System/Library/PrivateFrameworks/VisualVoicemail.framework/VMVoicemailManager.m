@implementation VMVoicemailManager

- (void)_checkFirstUnlock
{
  OUTLINED_FUNCTION_6(&dword_2116D5000, a2, a3, "MKBDeviceUnlockedSinceBoot (1) failed with %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];

  vm_framework_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2116D5000, v2, OS_LOG_TYPE_DEFAULT, "Requesting initial VVM accounts - replied", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setAccounts:", *(_QWORD *)(a1 + 40));
  v3 = *(NSObject **)(a1 + 48);
  if (v3)
    dispatch_group_leave(v3);
}

- (void)call_capabilitiesDidChange
{
  void *v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;

  -[VMVoicemailManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();
  v5 = MEMORY[0x24BDAC760];
  if ((v4 & 1) != 0)
  {
    -[VMVoicemailManager delegate_queue](self, "delegate_queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __48__VMVoicemailManager_call_capabilitiesDidChange__block_invoke;
    block[3] = &unk_24CC5ACC8;
    v10 = v3;
    dispatch_async(v6, block);

  }
  -[VMVoicemailManager completionQueue](self, "completionQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __48__VMVoicemailManager_call_capabilitiesDidChange__block_invoke_2;
  v8[3] = &unk_24CC5ACC8;
  v8[4] = self;
  dispatch_async(v7, v8);

}

- (void)call_voicemailsDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[3];
  _QWORD v28[5];

  v28[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  if (v4)
  {
    -[VMVoicemailManager voicemails](self, "voicemails");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayBySubtractingOrderedSet:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayBySubtractingOrderedSet:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByIntersectingWithOrderedSet:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v5;
    v25[1] = 3221225472;
    v25[2] = __47__VMVoicemailManager_call_voicemailsDidChange___block_invoke;
    v25[3] = &unk_24CC5AE80;
    v26 = v4;
    objc_msgSend(v9, "indexesOfObjectsPassingTest:", v25);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectsAtIndexes:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v7, "count") && !objc_msgSend(v8, "count") && !objc_msgSend(v11, "count"))
    {

      v16 = 0;
      goto LABEL_10;
    }
    v27[0] = CFSTR("VMVoicemailVoicemailsAddedKey");
    v27[1] = CFSTR("VMVoicemailVoicemailsDeletedKey");
    v28[0] = v7;
    v28[1] = v8;
    v27[2] = CFSTR("VMVoicemailVoicemailFlagsChangedKey");
    v28[2] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
    v11 = 0;
    v8 = 0;
    v7 = 0;
  }
  -[VMVoicemailManager delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[VMVoicemailManager delegate_queue](self, "delegate_queue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __47__VMVoicemailManager_call_voicemailsDidChange___block_invoke_2;
    block[3] = &unk_24CC5AEC0;
    v20 = v13;
    v21 = v4;
    v22 = v7;
    v23 = v8;
    v24 = v11;
    dispatch_async(v14, block);

  }
  -[VMVoicemailManager completionQueue](self, "completionQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __47__VMVoicemailManager_call_voicemailsDidChange___block_invoke_3;
  v17[3] = &unk_24CC5AEF0;
  v17[4] = self;
  v16 = v12;
  v18 = v16;
  dispatch_async(v15, v17);

LABEL_10:
}

- (VMVoicemailManager)init
{
  VMClientWrapper *v3;
  VMVoicemailManager *v4;

  v3 = objc_alloc_init(VMClientWrapper);
  v4 = -[VMVoicemailManager initWithClient:synchronously:queryState:fetchMail:session:delegate:delegateQueue:](self, "initWithClient:synchronously:queryState:fetchMail:session:delegate:delegateQueue:", v3, 1, 1, 1, 0, 0, 0);

  return v4;
}

- (VMVoicemailManager)initWithClient:(id)a3 synchronously:(BOOL)a4 queryState:(BOOL)a5 fetchMail:(BOOL)a6 session:(id)a7 delegate:(id)a8 delegateQueue:(id)a9
{
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL8 v13;
  id v16;
  id v17;
  id v18;
  id v19;
  VMVoicemailManager *v20;
  VMVoicemailManager *v21;
  NSObject *v22;
  const char *v23;
  const char *v24;
  NSObject *v25;
  dispatch_queue_t v26;
  OS_dispatch_queue *internalClientQueue;
  dispatch_queue_t v28;
  OS_dispatch_queue *delegate_queue;
  NSOrderedSet *voicemails;
  const char *v31;
  NSObject *v32;
  _QWORD v34[4];
  VMVoicemailManager *v35;
  id v36;
  objc_super v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  const char *v41;
  uint64_t v42;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v42 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v37.receiver = self;
  v37.super_class = (Class)VMVoicemailManager;
  v20 = -[VMVoicemailManager init](&v37, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_accessorLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v20->_client, a3);
    -[VMClientWrapper setManager:](v21->_client, "setManager:", v21);
    v21->fMailSyncExpected = v11;
    v21->fSyncStateExpected = v12 || v11;
    *(_WORD *)&v21->fMailLoadingInProgress = 0;
    vm_framework_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = "NO";
      if (v12)
        v24 = "YES";
      else
        v24 = "NO";
      if (v11)
        v23 = "YES";
      *(_DWORD *)buf = 136315394;
      v39 = v24;
      v40 = 2080;
      v41 = v23;
      _os_log_impl(&dword_2116D5000, v22, OS_LOG_TYPE_DEFAULT, "starting with statesync: %s, mailsync: %s", buf, 0x16u);
    }

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = dispatch_queue_create("com.apple.voicemail.VMVoicemailManager.serialQueue", v25);
    internalClientQueue = v21->_internalClientQueue;
    v21->_internalClientQueue = (OS_dispatch_queue *)v26;

    dispatch_queue_set_specific((dispatch_queue_t)v21->_internalClientQueue, (const void *)VMVoicemailManagerSerialQueueContextKey, v21, 0);
    if (v19)
      v28 = (dispatch_queue_t)v19;
    else
      v28 = dispatch_queue_create("com.apple.voicemail.VMVoicemailManager.delegate", v25);
    delegate_queue = v21->_delegate_queue;
    v21->_delegate_queue = (OS_dispatch_queue *)v28;

    objc_storeWeak((id *)&v21->_delegate, v18);
    voicemails = v21->_voicemails;
    v21->_voicemails = 0;

    -[VMVoicemailManager _checkFirstUnlock](v21, "_checkFirstUnlock");
    -[VMVoicemailManager _fetchInitialStateIfNecessaryWithForce:waitStates:waitMails:waitAccounts:session:](v21, "_fetchInitialStateIfNecessaryWithForce:waitStates:waitMails:waitAccounts:session:", 0, v13, v13, v13, v17);
    objc_initWeak((id *)buf, v21);
    v31 = (const char *)objc_msgSend(CFSTR("com.apple.voicemail.VMXPCConnectionAvailable"), "UTF8String");
    v32 = v21->_internalClientQueue;
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __103__VMVoicemailManager_initWithClient_synchronously_queryState_fetchMail_session_delegate_delegateQueue___block_invoke;
    v34[3] = &unk_24CC5AC10;
    objc_copyWeak(&v36, (id *)buf);
    v35 = v21;
    notify_register_dispatch(v31, &v21->_token, v32, v34);

    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);

  }
  return v21;
}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;

  v3 = a2;
  vm_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_20_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
    *((_BYTE *)WeakRetained + 10) = 0;
  v7 = *(NSObject **)(a1 + 32);
  if (v7)
    dispatch_group_leave(v7);

}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;

  v3 = a2;
  vm_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_15_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
    *((_BYTE *)WeakRetained + 10) = 0;
  v7 = *(NSObject **)(a1 + 32);
  if (v7)
    dispatch_group_leave(v7);

}

- (id)serverConnection:(BOOL)a3 withErrorHandler:(id)a4
{
  if (a3)
    -[VMVoicemailManager synchronousServerConnectionWithErrorHandler:](self, "synchronousServerConnectionWithErrorHandler:", a4);
  else
    -[VMVoicemailManager asynchronousServerConnectionWithErrorHandler:](self, "asynchronousServerConnectionWithErrorHandler:", a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)synchronousServerConnectionWithErrorHandler:(id)a3
{
  _BOOL4 fHasDeviceBeenUnlockedSinceBoot;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];

  fHasDeviceBeenUnlockedSinceBoot = self->fHasDeviceBeenUnlockedSinceBoot;
  v5 = a3;
  if (fHasDeviceBeenUnlockedSinceBoot)
  {
    -[VMVoicemailManager client](self, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    vm_framework_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_2116D5000, v10, OS_LOG_TYPE_DEFAULT, "rejected, synchronousServerConnectionWithErrorHandler", v12, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 35, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v5 + 2))(v5, v11);

    return 0;
  }
}

- (VMClientWrapper)client
{
  return self->_client;
}

- (void)call_transcribingStatusDidChange
{
  void *v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;

  -[VMVoicemailManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();
  v5 = MEMORY[0x24BDAC760];
  if ((v4 & 1) != 0)
  {
    -[VMVoicemailManager delegate_queue](self, "delegate_queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __54__VMVoicemailManager_call_transcribingStatusDidChange__block_invoke;
    block[3] = &unk_24CC5ACC8;
    v10 = v3;
    dispatch_async(v6, block);

  }
  -[VMVoicemailManager completionQueue](self, "completionQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __54__VMVoicemailManager_call_transcribingStatusDidChange__block_invoke_2;
  v8[3] = &unk_24CC5ACC8;
  v8[4] = self;
  dispatch_async(v7, v8);

}

- (void)call_syncInProgresDidChange
{
  void *v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;

  -[VMVoicemailManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();
  v5 = MEMORY[0x24BDAC760];
  if ((v4 & 1) != 0)
  {
    -[VMVoicemailManager delegate_queue](self, "delegate_queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __49__VMVoicemailManager_call_syncInProgresDidChange__block_invoke;
    block[3] = &unk_24CC5ACC8;
    v10 = v3;
    dispatch_async(v6, block);

  }
  -[VMVoicemailManager completionQueue](self, "completionQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __49__VMVoicemailManager_call_syncInProgresDidChange__block_invoke_2;
  v8[3] = &unk_24CC5ACC8;
  v8[4] = self;
  dispatch_async(v7, v8);

}

- (void)call_subscriptionStateStatusDidChange
{
  void *v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;

  -[VMVoicemailManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();
  v5 = MEMORY[0x24BDAC760];
  if ((v4 & 1) != 0)
  {
    -[VMVoicemailManager delegate_queue](self, "delegate_queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __59__VMVoicemailManager_call_subscriptionStateStatusDidChange__block_invoke;
    block[3] = &unk_24CC5ACC8;
    v10 = v3;
    dispatch_async(v6, block);

  }
  -[VMVoicemailManager completionQueue](self, "completionQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __59__VMVoicemailManager_call_subscriptionStateStatusDidChange__block_invoke_2;
  v8[3] = &unk_24CC5ACC8;
  v8[4] = self;
  dispatch_async(v7, v8);

}

- (void)call_onlineStatusDidChange
{
  void *v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;

  -[VMVoicemailManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();
  v5 = MEMORY[0x24BDAC760];
  if ((v4 & 1) != 0)
  {
    -[VMVoicemailManager delegate_queue](self, "delegate_queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __48__VMVoicemailManager_call_onlineStatusDidChange__block_invoke;
    block[3] = &unk_24CC5ACC8;
    v10 = v3;
    dispatch_async(v6, block);

  }
  -[VMVoicemailManager completionQueue](self, "completionQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __48__VMVoicemailManager_call_onlineStatusDidChange__block_invoke_2;
  v8[3] = &unk_24CC5ACC8;
  v8[4] = self;
  dispatch_async(v7, v8);

}

- (VMVoicemailManagedDelegate)delegate
{
  return (VMVoicemailManagedDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)completionQueue
{
  OS_dispatch_queue *completionQueue;
  OS_dispatch_queue **p_completionQueue;

  p_completionQueue = &self->_completionQueue;
  completionQueue = self->_completionQueue;
  if (!completionQueue)
  {
    objc_storeStrong((id *)p_completionQueue, MEMORY[0x24BDAC9B8]);
    completionQueue = *p_completionQueue;
  }
  return completionQueue;
}

- (void)_fetchInitialStateIfNecessaryWithForce:(BOOL)a3 waitStates:(BOOL)a4 waitMails:(BOOL)a5 waitAccounts:(BOOL)a6 session:(id)a7
{
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[5];
  NSObject *v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;

  v12 = a7;
  v13 = v12;
  if (v12)
    dispatch_group_enter(v12);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke;
  v15[3] = &unk_24CC5AE58;
  v15[4] = self;
  v16 = v13;
  v17 = a3;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v14 = v13;
  -[VMVoicemailManager performSynchronousBlock:](self, "performSynchronousBlock:", v15);

}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_3;
  v3[3] = &unk_24CC5AD18;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "performSynchronousBlock:", v3);

}

- (BOOL)isSubscribed
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__VMVoicemailManager_isSubscribed__block_invoke;
  v4[3] = &unk_24CC5ABC0;
  v4[4] = self;
  v4[5] = &v5;
  -[VMVoicemailManager performSynchronousBlock:](self, "performSynchronousBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)performSynchronousBlock:(id)a3
{
  id v5;
  void (*v6)(void);
  NSObject *v7;

  if (dispatch_get_specific((const void *)VMVoicemailManagerSerialQueueContextKey) == self)
  {
    v6 = (void (*)(void))*((_QWORD *)a3 + 2);
    v7 = a3;
    v6();
  }
  else
  {
    v5 = a3;
    -[VMVoicemailManager internalClientQueue](self, "internalClientQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v7, v5);

  }
}

- (void)setAccounts:(id)a3
{
  id v4;
  unint64_t v5;
  char v6;
  NSArray *v7;
  NSArray *accounts;
  unint64_t v9;

  v4 = a3;
  os_unfair_lock_lock(&self->_accessorLock);
  v5 = self->_accounts;
  v9 = (unint64_t)v4;
  if (v9 | v5)
  {
    if (v9)
    {
      v6 = objc_msgSend((id)v5, "isEqual:", v9);

      if ((v6 & 1) != 0)
        goto LABEL_7;
    }
    else
    {

    }
    v7 = (NSArray *)objc_msgSend((id)v9, "copy");
    accounts = self->_accounts;
    self->_accounts = v7;

    -[VMVoicemailManager call_accountsDidChange](self, "call_accountsDidChange");
  }
LABEL_7:
  os_unfair_lock_unlock(&self->_accessorLock);

}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  id v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  char v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  char v23;
  _QWORD v24[4];
  id v25;
  id v26;
  char v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[9] && !v2[8])
  {
    vm_framework_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = (id)objc_opt_class();
      v11 = v29;
      _os_log_impl(&dword_2116D5000, v3, OS_LOG_TYPE_DEFAULT, "%@ client initialized without expecting mail or states sync", buf, 0xCu);

    }
    goto LABEL_17;
  }
  if (v2[10])
  {
    vm_framework_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = (id)objc_opt_class();
      v4 = v29;
      _os_log_impl(&dword_2116D5000, v3, OS_LOG_TYPE_DEFAULT, "%@ mail loading is already in progress", buf, 0xCu);

    }
LABEL_17:

    v13 = *(NSObject **)(a1 + 40);
    if (v13)
      dispatch_group_leave(v13);
    return;
  }
  if (v2[11] && !*(_BYTE *)(a1 + 48))
  {
    vm_framework_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = (id)objc_opt_class();
      v12 = v29;
      _os_log_impl(&dword_2116D5000, v3, OS_LOG_TYPE_DEFAULT, "%@ mail already loaded - bailing out", buf, 0xCu);

    }
    goto LABEL_17;
  }
  if (v2[9])
  {
    v2[11] = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 1;
    v2 = *(_BYTE **)(a1 + 32);
  }
  objc_initWeak((id *)buf, v2);
  v5 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_14;
  v24[3] = &unk_24CC5AD68;
  v27 = *(_BYTE *)(a1 + 49);
  objc_copyWeak(&v26, (id *)buf);
  v25 = *(id *)(a1 + 40);
  v6 = (void *)objc_msgSend(v24, "copy");
  v19[0] = v5;
  v19[1] = 3221225472;
  v19[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_19;
  v19[3] = &unk_24CC5ADE0;
  v23 = *(_BYTE *)(a1 + 50);
  objc_copyWeak(&v22, (id *)buf);
  v20 = *(id *)(a1 + 40);
  v7 = v6;
  v21 = v7;
  v8 = (void *)objc_msgSend(v19, "copy");
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_24;
  v14[3] = &unk_24CC5ADE0;
  v18 = *(_BYTE *)(a1 + 51);
  objc_copyWeak(&v17, (id *)buf);
  v15 = *(id *)(a1 + 40);
  v9 = v8;
  v16 = v9;
  v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x212BE01CC](v14);
  v10[2](v10, *(_QWORD *)(a1 + 32));

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;

  v3 = a2;
  vm_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_20_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
    *((_BYTE *)WeakRetained + 10) = 0;
  v7 = *(NSObject **)(a1 + 32);
  if (v7)
    dispatch_group_leave(v7);

}

- (void)call_accountsDidChange
{
  void *v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;

  -[VMVoicemailManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();
  v5 = MEMORY[0x24BDAC760];
  if ((v4 & 1) != 0)
  {
    -[VMVoicemailManager delegate_queue](self, "delegate_queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __44__VMVoicemailManager_call_accountsDidChange__block_invoke;
    block[3] = &unk_24CC5ACC8;
    v10 = v3;
    dispatch_async(v6, block);

  }
  -[VMVoicemailManager completionQueue](self, "completionQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __44__VMVoicemailManager_call_accountsDidChange__block_invoke_2;
  v8[3] = &unk_24CC5ACC8;
  v8[4] = self;
  dispatch_async(v7, v8);

}

uint64_t __34__VMVoicemailManager_isSubscribed__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 15);
  return result;
}

void __47__VMVoicemailManager_call_voicemailsDidChange___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("VMVoicemailVoicemailsChangedNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __49__VMVoicemailManager_call_syncInProgresDidChange__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("VMVoicemailSyncInProgressChangedNotification"), *(_QWORD *)(a1 + 32));

}

void __48__VMVoicemailManager_call_onlineStatusDidChange__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("VMVoicemailOnlineStatusChangedNotification"), *(_QWORD *)(a1 + 32));

}

void __54__VMVoicemailManager_call_transcribingStatusDidChange__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("VMVoicemailTranscriptionInProgressChangedNotification"), *(_QWORD *)(a1 + 32));

}

void __44__VMVoicemailManager_call_accountsDidChange__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("VMVoicemailManagerAccountsDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

void __59__VMVoicemailManager_call_subscriptionStateStatusDidChange__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("VMVoicemailSubscriptionStateStatusChangedNotification"), *(_QWORD *)(a1 + 32));

}

void __48__VMVoicemailManager_call_capabilitiesDidChange__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("VMVoicemailCapabilitiesChangedNotification"), *(_QWORD *)(a1 + 32));

}

uint64_t __30__VMVoicemailManager_isOnline__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 14);
  return result;
}

- (NSProgress)transcriptionProgress
{
  return self->_transcriptionProgress;
}

- (unint64_t)storageUsage
{
  return self->_storageUsage;
}

- (BOOL)isOnline
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __30__VMVoicemailManager_isOnline__block_invoke;
  v4[3] = &unk_24CC5ABC0;
  v4[4] = self;
  v4[5] = &v5;
  -[VMVoicemailManager performSynchronousBlock:](self, "performSynchronousBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (NSArray)accounts
{
  os_unfair_lock_s *p_accessorLock;
  NSArray *accounts;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  accounts = self->_accounts;
  if (!accounts)
  {
    -[VMVoicemailManager fetchAccounts](self, "fetchAccounts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSArray *)objc_msgSend(v5, "copy");
    v7 = self->_accounts;
    self->_accounts = v6;

    accounts = self->_accounts;
  }
  v8 = accounts;
  os_unfair_lock_unlock(p_accessorLock);
  return v8;
}

- (VMVoicemailManager)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6;
  id v7;
  VMClientWrapper *v8;
  VMVoicemailManager *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(VMClientWrapper);
  v9 = -[VMVoicemailManager initWithClient:synchronously:queryState:fetchMail:session:delegate:delegateQueue:](self, "initWithClient:synchronously:queryState:fetchMail:session:delegate:delegateQueue:", v8, 1, 1, 1, 0, v7, v6);

  return v9;
}

- (id)initAsync:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  VMClientWrapper *v11;
  VMVoicemailManager *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(VMClientWrapper);
  v12 = -[VMVoicemailManager initWithClient:synchronously:queryState:fetchMail:session:delegate:delegateQueue:](self, "initWithClient:synchronously:queryState:fetchMail:session:delegate:delegateQueue:", v11, 0, 1, 1, v10, v9, v8);

  return v12;
}

void __103__VMVoicemailManager_initWithClient_synchronously_queryState_fetchMail_session_delegate_delegateQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    vm_framework_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = (id)objc_opt_class();
      v3 = v5;
      _os_log_impl(&dword_2116D5000, v2, OS_LOG_TYPE_DEFAULT, "%@ is handling VMXPCConnectionAvailable.", (uint8_t *)&v4, 0xCu);

    }
    objc_msgSend(WeakRetained, "_fetchInitialStateIfNecessaryWithForce:waitStates:waitMails:waitAccounts:session:", 1, 0, 0, 0, 0);
  }

}

- (VMVoicemailManager)initWithoutMailSync
{
  return (VMVoicemailManager *)-[VMVoicemailManager initAsyncWithStateSync:mailSync:session:delegate:delegateQueue:](self, "initAsyncWithStateSync:mailSync:session:delegate:delegateQueue:", 0, 0, 0, 0, 0);
}

- (VMVoicemailManager)initWithStateSync:(BOOL)a3 mailSync:(BOOL)a4 delegate:(id)a5 delegateQueue:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  VMClientWrapper *v12;
  VMVoicemailManager *v13;

  v7 = a4;
  v8 = a3;
  v10 = a6;
  v11 = a5;
  v12 = objc_alloc_init(VMClientWrapper);
  v13 = -[VMVoicemailManager initWithClient:synchronously:queryState:fetchMail:session:delegate:delegateQueue:](self, "initWithClient:synchronously:queryState:fetchMail:session:delegate:delegateQueue:", v12, 1, v8, v7, 0, v11, v10);

  return v13;
}

- (id)initAsyncWithStateSync:(BOOL)a3 mailSync:(BOOL)a4 session:(id)a5 delegate:(id)a6 delegateQueue:(id)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  VMClientWrapper *v15;
  VMVoicemailManager *v16;

  v9 = a4;
  v10 = a3;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = objc_alloc_init(VMClientWrapper);
  v16 = -[VMVoicemailManager initWithClient:synchronously:queryState:fetchMail:session:delegate:delegateQueue:](self, "initWithClient:synchronously:queryState:fetchMail:session:delegate:delegateQueue:", v15, 0, v10, v9, v14, v13, v12);

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(-[VMVoicemailManager token](self, "token"));
  v3.receiver = self;
  v3.super_class = (Class)VMVoicemailManager;
  -[VMVoicemailManager dealloc](&v3, sel_dealloc);
}

void __39__VMVoicemailManager__checkFirstUnlock__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  id v5;
  uint8_t v6[16];

  vm_framework_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2116D5000, v2, OS_LOG_TYPE_DEFAULT, "Device became unlocked after boot", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    *((_BYTE *)WeakRetained + 12) = 1;
  notify_cancel(*(_DWORD *)(a1 + 40));
  v5 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v5, "_fetchInitialStateIfNecessaryWithForce:waitStates:waitMails:waitAccounts:session:", 0, 0, 0, 0, 0);

}

- (id)asynchronousServerConnectionWithErrorHandler:(id)a3
{
  _BOOL4 fHasDeviceBeenUnlockedSinceBoot;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];

  fHasDeviceBeenUnlockedSinceBoot = self->fHasDeviceBeenUnlockedSinceBoot;
  v5 = a3;
  if (fHasDeviceBeenUnlockedSinceBoot)
  {
    -[VMVoicemailManager client](self, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    vm_framework_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_2116D5000, v10, OS_LOG_TYPE_DEFAULT, "rejected asynchronousServerConnectionWithErrorHandler", v12, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 35, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v5 + 2))(v5, v11);

    return 0;
  }
}

- (VMServerXPCProtocol)serverConnection
{
  return (VMServerXPCProtocol *)-[VMVoicemailManager asynchronousServerConnectionWithErrorHandler:](self, "asynchronousServerConnectionWithErrorHandler:", &__block_literal_global_2);
}

void __38__VMVoicemailManager_serverConnection__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  vm_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __38__VMVoicemailManager_serverConnection__block_invoke_cold_1();

}

- (void)requestInitialStateIfNecessaryAndSendNotifications:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  vm_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2116D5000, v4, OS_LOG_TYPE_DEFAULT, "Client woke up, asking to recheck. Pinging daemon.", buf, 2u);
  }

  if (self->fHasDeviceBeenUnlockedSinceBoot)
  {
    -[VMVoicemailManager client](self, "client");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPingRetry:", 1);
    -[VMVoicemailManager asynchronousServerConnectionWithErrorHandler:](self, "asynchronousServerConnectionWithErrorHandler:", &__block_literal_global_10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __73__VMVoicemailManager_requestInitialStateIfNecessaryAndSendNotifications___block_invoke_11;
    v8[3] = &unk_24CC5ACA0;
    v9 = v5;
    v7 = v5;
    objc_msgSend(v6, "ping:", v8);

  }
  else
  {
    vm_framework_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2116D5000, v7, OS_LOG_TYPE_DEFAULT, "Cannot ping when device is locked.", buf, 2u);
    }
  }

}

void __73__VMVoicemailManager_requestInitialStateIfNecessaryAndSendNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  vm_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __73__VMVoicemailManager_requestInitialStateIfNecessaryAndSendNotifications___block_invoke_cold_1();

}

void __73__VMVoicemailManager_requestInitialStateIfNecessaryAndSendNotifications___block_invoke_11(uint64_t a1, int a2)
{
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setPingRetry:", 0);
  vm_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "NO";
    if (a2)
      v4 = "YES";
    v5 = 136315138;
    v6 = v4;
    _os_log_impl(&dword_2116D5000, v3, OS_LOG_TYPE_DEFAULT, "VMD server replied with %s", (uint8_t *)&v5, 0xCu);
  }

}

- (void)startMailSyncing
{
  NSObject *v3;
  _QWORD block[5];

  -[VMVoicemailManager internalClientQueue](self, "internalClientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__VMVoicemailManager_startMailSyncing__block_invoke;
  block[3] = &unk_24CC5ACC8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __38__VMVoicemailManager_startMailSyncing__block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 9);
  vm_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2116D5000, v3, OS_LOG_TYPE_DEFAULT, "requested startMailSyncing while it was already active - skipping", v5, 2u);
    }

  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2116D5000, v3, OS_LOG_TYPE_DEFAULT, "requested startMailSyncing - starting sync", buf, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_fetchInitialStateIfNecessaryWithForce:waitStates:waitMails:waitAccounts:session:", 0, 0, 0, 0, 0);
  }
}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  char v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[16];

  v3 = a2;
  vm_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2116D5000, v4, OS_LOG_TYPE_DEFAULT, "Requesting initial VVM accounts", buf, 2u);
  }

  v5 = *(unsigned __int8 *)(a1 + 48);
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_15;
  v12[3] = &unk_24CC5ACF0;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v3, "serverConnection:withErrorHandler:", v5, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_16;
  v8[3] = &unk_24CC5AD40;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v9 = *(id *)(a1 + 32);
  v11 = v5;
  objc_msgSend(v7, "accounts:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v14);

}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
    if (v3)
      v6 = v3;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_2;
    v11[3] = &unk_24CC5AD18;
    v11[4] = WeakRetained;
    v3 = v6;
    v12 = v3;
    v13 = *(id *)(a1 + 32);
    v7 = MEMORY[0x212BE01CC](v11);
    v8 = (void *)v7;
    if (*(_BYTE *)(a1 + 48))
    {
      (*(void (**)(uint64_t))(v7 + 16))(v7);
    }
    else
    {
      objc_msgSend(v5, "internalClientQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v10, v8);

    }
  }
  else
  {
    v9 = *(NSObject **)(a1 + 32);
    if (v9)
      dispatch_group_leave(v9);
  }

}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_19(uint64_t a1, void *a2)
{
  unsigned __int8 *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  char v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[16];

  v3 = a2;
  v4 = v3[9];
  vm_framework_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2116D5000, v5, OS_LOG_TYPE_DEFAULT, "Requesting initial VVM voicemails", buf, 2u);
    }

    v7 = *(unsigned __int8 *)(a1 + 56);
    v8 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_20;
    v15[3] = &unk_24CC5ACF0;
    objc_copyWeak(&v17, (id *)(a1 + 48));
    v16 = *(id *)(a1 + 32);
    objc_msgSend(v3, "serverConnection:withErrorHandler:", v7, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_21;
    v10[3] = &unk_24CC5ADB8;
    objc_copyWeak(&v13, (id *)(a1 + 48));
    v12 = *(id *)(a1 + 40);
    v14 = v7;
    v11 = *(id *)(a1 + 32);
    objc_msgSend(v9, "allVoicemails:", v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v17);
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2116D5000, v5, OS_LOG_TYPE_DEFAULT, "mail fetch is not requested - skipping to accounts", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_2_22;
    v10[3] = &unk_24CC5AD90;
    v10[4] = WeakRetained;
    v11 = v3;
    v12 = *(id *)(a1 + 40);
    v6 = MEMORY[0x212BE01CC](v10);
    v7 = (void *)v6;
    if (*(_BYTE *)(a1 + 56))
    {
      (*(void (**)(uint64_t))(v6 + 16))(v6);
    }
    else
    {
      objc_msgSend(v5, "internalClientQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v9, v7);

    }
  }
  else
  {
    v8 = *(NSObject **)(a1 + 32);
    if (v8)
      dispatch_group_leave(v8);
  }

}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_2_22(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint8_t v8[16];

  vm_framework_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2116D5000, v2, OS_LOG_TYPE_DEFAULT, "Requesting initial VVM voicemails - replied", v8, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  v5 = *(id *)(a1 + 40);
  v6 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v5;
  v7 = v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 11) = 1;
  objc_msgSend(*(id *)(a1 + 32), "call_voicemailsDidChange:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  char v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[16];

  v3 = a2;
  vm_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2116D5000, v4, OS_LOG_TYPE_DEFAULT, "Requesting initial VVM states", buf, 2u);
  }

  v5 = *(unsigned __int8 *)(a1 + 56);
  v6 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_25;
  v13[3] = &unk_24CC5ACF0;
  objc_copyWeak(&v15, (id *)(a1 + 48));
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v3, "serverConnection:withErrorHandler:", v5, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_26;
  v8[3] = &unk_24CC5AE30;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  v10 = *(id *)(a1 + 40);
  v12 = v5;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v7, "requestInitialState:", v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v15);

}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_26(uint64_t a1, void *a2, char a3, char a4, char a5, char a6)
{
  id v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id v24;
  char v25;
  char v26;
  char v27;
  char v28;

  v11 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_2_27;
    v21 = &unk_24CC5AE08;
    v22 = WeakRetained;
    v23 = v11;
    v25 = a3;
    v26 = a4;
    v27 = a5;
    v28 = a6;
    v24 = *(id *)(a1 + 40);
    v14 = MEMORY[0x212BE01CC](&v18);
    v15 = (void *)v14;
    if (*(_BYTE *)(a1 + 56))
    {
      (*(void (**)(uint64_t))(v14 + 16))(v14);
    }
    else
    {
      objc_msgSend(v13, "internalClientQueue", v18, v19, v20, v21, v22, v23);
      v17 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v17, v15);

    }
  }
  else
  {
    v16 = *(NSObject **)(a1 + 32);
    if (v16)
      dispatch_group_leave(v16);
  }

}

uint64_t __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_2_27(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  vm_framework_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2116D5000, v2, OS_LOG_TYPE_DEFAULT, "Requesting initial VVM states - replied", v4, 2u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 15) = *(_BYTE *)(a1 + 56);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 14) = *(_BYTE *)(a1 + 57);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = *(_BYTE *)(a1 + 58);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = *(_BYTE *)(a1 + 59);
  objc_msgSend(*(id *)(a1 + 32), "call_capabilitiesDidChange");
  objc_msgSend(*(id *)(a1 + 32), "call_subscriptionStateStatusDidChange");
  objc_msgSend(*(id *)(a1 + 32), "call_onlineStatusDidChange");
  objc_msgSend(*(id *)(a1 + 32), "call_syncInProgresDidChange");
  objc_msgSend(*(id *)(a1 + 32), "call_transcribingStatusDidChange");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __47__VMVoicemailManager_call_voicemailsDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "hasSameContent:", v3))
      v5 = objc_msgSend(v6, "hasSameFlags:", v3) ^ 1;
    else
      v5 = 1;

  }
  return v5;
}

uint64_t __47__VMVoicemailManager_call_voicemailsDidChange___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)a1[4];
  v3 = a1[5];
  if (objc_msgSend((id)a1[6], "count"))
    v4 = a1[6];
  else
    v4 = 0;
  if (objc_msgSend((id)a1[7], "count"))
    v5 = a1[7];
  else
    v5 = 0;
  if (objc_msgSend((id)a1[8], "count"))
    v6 = a1[8];
  else
    v6 = 0;
  return objc_msgSend(v2, "voicemailsDidChangeInitial:added:deleted:updated:", v3 == 0, v4, v5, v6);
}

uint64_t __48__VMVoicemailManager_call_onlineStatusDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onlineStatusDidChange");
}

uint64_t __48__VMVoicemailManager_call_capabilitiesDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "capabilitiesDidChange");
}

uint64_t __59__VMVoicemailManager_call_subscriptionStateStatusDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "subscriptionStateStatusDidChange");
}

uint64_t __49__VMVoicemailManager_call_syncInProgresDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncInProgresDidChange");
}

- (void)call_managerStorageUsageDidChange
{
  void *v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;

  -[VMVoicemailManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();
  v5 = MEMORY[0x24BDAC760];
  if ((v4 & 1) != 0)
  {
    -[VMVoicemailManager delegate_queue](self, "delegate_queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __55__VMVoicemailManager_call_managerStorageUsageDidChange__block_invoke;
    block[3] = &unk_24CC5ACC8;
    v10 = v3;
    dispatch_async(v6, block);

  }
  -[VMVoicemailManager completionQueue](self, "completionQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __55__VMVoicemailManager_call_managerStorageUsageDidChange__block_invoke_2;
  v8[3] = &unk_24CC5ACC8;
  v8[4] = self;
  dispatch_async(v7, v8);

}

uint64_t __55__VMVoicemailManager_call_managerStorageUsageDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "managerStorageUsageDidChange");
}

void __55__VMVoicemailManager_call_managerStorageUsageDidChange__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("VMVoicemailManagerStorageUsageChangedNotification"), *(_QWORD *)(a1 + 32));

}

uint64_t __54__VMVoicemailManager_call_transcribingStatusDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "transcribingStatusDidChange");
}

uint64_t __44__VMVoicemailManager_call_accountsDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accountsDidChange");
}

- (void)call_greetingDidChangeByCarrier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  -[VMVoicemailManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[VMVoicemailManager delegate_queue](self, "delegate_queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __54__VMVoicemailManager_call_greetingDidChangeByCarrier___block_invoke;
    v7[3] = &unk_24CC5AEF0;
    v8 = v5;
    v9 = v4;
    dispatch_async(v6, v7);

  }
}

uint64_t __54__VMVoicemailManager_call_greetingDidChangeByCarrier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "greetingDidChangeByCarrier:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isSyncInProgress
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__VMVoicemailManager_isSyncInProgress__block_invoke;
  v4[3] = &unk_24CC5ABC0;
  v4[4] = self;
  v4[5] = &v5;
  -[VMVoicemailManager performSynchronousBlock:](self, "performSynchronousBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __38__VMVoicemailManager_isSyncInProgress__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (BOOL)isTranscribing
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__VMVoicemailManager_isTranscribing__block_invoke;
  v4[3] = &unk_24CC5ABC0;
  v4[4] = self;
  v4[5] = &v5;
  -[VMVoicemailManager performSynchronousBlock:](self, "performSynchronousBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __36__VMVoicemailManager_isTranscribing__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 17);
  return result;
}

- (BOOL)isMessageWaiting
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__VMVoicemailManager_isMessageWaiting__block_invoke;
  v4[3] = &unk_24CC5ABC0;
  v4[4] = self;
  v4[5] = &v5;
  -[VMVoicemailManager performSynchronousBlock:](self, "performSynchronousBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __38__VMVoicemailManager_isMessageWaiting__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 13);
  return result;
}

- (void)synchronize
{
  id v2;

  -[VMVoicemailManager serverConnection](self, "serverConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronize");

}

- (void)retrieveDataForVoicemail:(id)a3
{
  id v4;
  BOOL v5;
  char v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;
  char v12;

  v4 = a3;
  v5 = -[VMVoicemailManager isOnline](self, "isOnline");
  if (-[VMVoicemailManager isSyncInProgress](self, "isSyncInProgress"))
    v6 = 0;
  else
    v6 = objc_msgSend(v4, "isDownloading") ^ 1;
  -[VMVoicemailManager internalClientQueue](self, "internalClientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__VMVoicemailManager_retrieveDataForVoicemail___block_invoke;
  block[3] = &unk_24CC5AF50;
  v11 = v5;
  v12 = v6;
  block[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, block);

}

void __47__VMVoicemailManager_retrieveDataForVoicemail___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(a1 + 48))
  {
    if (*(_BYTE *)(a1 + 49))
    {
      objc_msgSend(*(id *)(a1 + 32), "serverConnection");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "retrieveDataForIdentifier:", objc_msgSend(*(id *)(a1 + 40), "identifier"));

    }
  }
}

- (NSArray)allVoicemails
{
  id v2;
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
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__VMVoicemailManager_allVoicemails__block_invoke;
  v4[3] = &unk_24CC5ABC0;
  v4[4] = self;
  v4[5] = &v5;
  -[VMVoicemailManager performSynchronousBlock:](self, "performSynchronousBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __35__VMVoicemailManager_allVoicemails__block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "voicemails");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "voicemails");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBD1A8];
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  if (v4)
  {

  }
}

- (int64_t)unreadCount
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __33__VMVoicemailManager_unreadCount__block_invoke;
  v4[3] = &unk_24CC5ABC0;
  v4[4] = self;
  v4[5] = &v5;
  -[VMVoicemailManager performSynchronousBlock:](self, "performSynchronousBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __33__VMVoicemailManager_unreadCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "countOfVoicemailsPassingTest:", &__block_literal_global_51);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __33__VMVoicemailManager_unreadCount__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isRead") & 1) != 0
    || (objc_msgSend(v2, "isDeleted") & 1) != 0
    || (objc_msgSend(v2, "isTrashed") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_msgSend(v2, "isBlocked") ^ 1;
  }

  return v3;
}

- (id)voicemailWithIdentifier:(unint64_t)a3
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

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  -[VMVoicemailManager allVoicemails](self, "allVoicemails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__VMVoicemailManager_voicemailWithIdentifier___block_invoke;
  v7[3] = &unk_24CC5AFB8;
  v7[4] = &v8;
  v7[5] = a3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __46__VMVoicemailManager_voicemailWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "identifier") == *(_QWORD *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)dataForVoicemailWithIdentifier:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[VMVoicemailManager voicemailWithIdentifier:](self, "voicemailWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)voicemailsPassingTest:(id)a3
{
  unsigned int (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (unsigned int (**)(id, _QWORD))a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[VMVoicemailManager allVoicemails](self, "allVoicemails", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (v4[2](v4, v11))
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  v12 = (void *)objc_msgSend(v5, "copy");

  return v12;
}

- (unint64_t)countOfVoicemailsPassingTest:(id)a3
{
  void *v3;
  unint64_t v4;

  -[VMVoicemailManager voicemailsPassingTest:](self, "voicemailsPassingTest:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)uniqueIdentifierForVoiceMail:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  objc_msgSend(v4, "senderDestinationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  objc_msgSend(v6, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "isDeleted"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = objc_msgSend(v4, "isTrashed");

  objc_msgSend(v10, "numberWithBool:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@-%@-%@"), v5, v8, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)remapAccount:(id)a3 toAccount:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  VMVoicemailManager *v14;

  v6 = a3;
  v7 = a4;
  -[VMVoicemailManager internalClientQueue](self, "internalClientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__VMVoicemailManager_remapAccount_toAccount___block_invoke;
  block[3] = &unk_24CC5AD18;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __45__VMVoicemailManager_remapAccount_toAccount___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  vm_framework_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_2116D5000, v2, OS_LOG_TYPE_DEFAULT, "remap account %@ to %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remapAccount:toAccount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)resetNetworkSettings
{
  NSObject *v3;
  _QWORD block[5];

  -[VMVoicemailManager internalClientQueue](self, "internalClientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__VMVoicemailManager_resetNetworkSettings__block_invoke;
  block[3] = &unk_24CC5ACC8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __42__VMVoicemailManager_resetNetworkSettings__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  vm_framework_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2116D5000, v2, OS_LOG_TYPE_DEFAULT, "resetNetworkSettings", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetNetworkSettings");

}

- (id)deleteVoicemail:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[VMVoicemailManager deleteVoicemails:](self, "deleteVoicemails:", v6, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)deleteVoicemails:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD block[5];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  vm_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v3;
    _os_log_impl(&dword_2116D5000, v4, OS_LOG_TYPE_DEFAULT, "Perform delete for voicemails %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isDeleted") & 1) == 0)
        {
          v13 = (void *)objc_msgSend(v12, "mutableCopy");
          objc_msgSend(v13, "setDeleted:", 1);
          v14 = (void *)objc_msgSend(v13, "copy");
          objc_msgSend(v5, "addObject:", v14);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v12, "identifier"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v15);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
  {
    -[VMVoicemailManager internalClientQueue](self, "internalClientQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__VMVoicemailManager_deleteVoicemails___block_invoke;
    block[3] = &unk_24CC5AEF0;
    block[4] = self;
    v21 = v6;
    dispatch_async(v16, block);

  }
  v17 = (void *)objc_msgSend(v5, "copy");

  return v17;
}

void __39__VMVoicemailManager_deleteVoicemails___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "serverConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v3, "setDeletedForIdentifiers:", v2);

}

- (id)markVoicemailAsRead:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[VMVoicemailManager markVoicemailsAsRead:](self, "markVoicemailsAsRead:", v6, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)markVoicemailsAsRead:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  VMVoicemailManager *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  vm_framework_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v4;
    _os_log_impl(&dword_2116D5000, v5, OS_LOG_TYPE_DEFAULT, "Perform mark as read for voicemails %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isRead") & 1) == 0)
        {
          v13 = (void *)objc_msgSend(v12, "mutableCopy");
          objc_msgSend(v13, "setRead:", 1);
          v14 = (void *)objc_msgSend(v13, "copy");
          objc_msgSend(v6, "addObject:", v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_msgSend(v6, "copy");
  if (objc_msgSend(v15, "count"))
  {
    -[VMVoicemailManager internalClientQueue](self, "internalClientQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __43__VMVoicemailManager_markVoicemailsAsRead___block_invoke;
    v18[3] = &unk_24CC5AEF0;
    v19 = v15;
    v20 = self;
    dispatch_async(v16, v18);

  }
  return v15;
}

void __43__VMVoicemailManager_markVoicemailsAsRead___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "identifier", (_QWORD)v11));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 40), "serverConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(v9, "setReadForIdentifiers:", v10);

}

- (id)trashVoicemail:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[VMVoicemailManager trashVoicemails:](self, "trashVoicemails:", v6, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)trashVoicemails:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v20[5];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  vm_framework_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v4;
    _os_log_impl(&dword_2116D5000, v5, OS_LOG_TYPE_DEFAULT, "Perform trashed for voicemails %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isTrashed") & 1) == 0)
        {
          v14 = (void *)objc_msgSend(v13, "mutableCopy");
          objc_msgSend(v14, "setTrashed:", 1);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v14, "identifier"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

          v16 = (void *)objc_msgSend(v14, "copy");
          objc_msgSend(v6, "addObject:", v16);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  v17 = (void *)objc_msgSend(v6, "copy");
  if (objc_msgSend(v7, "count"))
  {
    -[VMVoicemailManager internalClientQueue](self, "internalClientQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __38__VMVoicemailManager_trashVoicemails___block_invoke;
    v20[3] = &unk_24CC5AEF0;
    v20[4] = self;
    v21 = v7;
    dispatch_async(v18, v20);

  }
  return v17;
}

void __38__VMVoicemailManager_trashVoicemails___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "serverConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTrashedForIdentifiers:", *(_QWORD *)(a1 + 40));

}

- (id)removeVoicemailFromTrash:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[VMVoicemailManager removeVoicemailsFromTrash:](self, "removeVoicemailsFromTrash:", v6, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)removeVoicemailsFromTrash:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  VMVoicemailManager *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  vm_framework_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v4;
    _os_log_impl(&dword_2116D5000, v5, OS_LOG_TYPE_DEFAULT, "Remove voicemails %@ from trash", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v12, "isTrashed"))
        {
          v13 = (void *)objc_msgSend(v12, "mutableCopy");
          objc_msgSend(v13, "setTrashed:", 0);
          v14 = (void *)objc_msgSend(v13, "copy");
          objc_msgSend(v6, "addObject:", v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_msgSend(v6, "copy");
  if (objc_msgSend(v15, "count"))
  {
    -[VMVoicemailManager internalClientQueue](self, "internalClientQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __48__VMVoicemailManager_removeVoicemailsFromTrash___block_invoke;
    v18[3] = &unk_24CC5AEF0;
    v19 = v15;
    v20 = self;
    dispatch_async(v16, v18);

  }
  return v15;
}

void __48__VMVoicemailManager_removeVoicemailsFromTrash___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "serverConnection", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeVoicemailFromTrashWithIdentifier:", objc_msgSend(v7, "identifier"));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)voicemailsUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[VMVoicemailManager internalClientQueue](self, "internalClientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__VMVoicemailManager_voicemailsUpdated___block_invoke;
  v7[3] = &unk_24CC5AEF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __40__VMVoicemailManager_voicemailsUpdated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "voicemails");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setVoicemails:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "call_voicemailsDidChange:", v2);

}

- (void)setOnline:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[VMVoicemailManager internalClientQueue](self, "internalClientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __32__VMVoicemailManager_setOnline___block_invoke;
  v6[3] = &unk_24CC5AFE0;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

uint64_t __32__VMVoicemailManager_setOnline___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v2 + 14) != v3)
    *(_BYTE *)(v2 + 14) = v3;
  vm_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 14))
      v5 = CFSTR("ONLINE");
    else
      v5 = CFSTR("OFFLINE");
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_2116D5000, v4, OS_LOG_TYPE_DEFAULT, "Client received online state change message from vmd. vmd is %@", (uint8_t *)&v7, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "call_onlineStatusDidChange");
}

- (void)setTranscribing:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[VMVoicemailManager internalClientQueue](self, "internalClientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__VMVoicemailManager_setTranscribing___block_invoke;
  v6[3] = &unk_24CC5AFE0;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

uint64_t __38__VMVoicemailManager_setTranscribing___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 17) != v2)
  {
    v3 = result;
    *(_BYTE *)(v1 + 17) = v2;
    v4 = *(unsigned __int8 *)(result + 40);
    v5 = *(_QWORD **)(result + 32);
    if (v4)
    {
      objc_msgSend(v5, "asynchronousServerConnectionWithErrorHandler:", &__block_literal_global_62);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "requestTranscriptionProgress:", &__block_literal_global_64);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(v3 + 32);
      v9 = *(void **)(v8 + 56);
      *(_QWORD *)(v8 + 56) = v7;

      vm_framework_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(*(_QWORD *)(v3 + 32) + 56);
        v15 = 138412290;
        v16 = v11;
        _os_log_impl(&dword_2116D5000, v10, OS_LOG_TYPE_DEFAULT, "Received progress from server: %@", (uint8_t *)&v15, 0xCu);
      }

    }
    else
    {
      v12 = (void *)v5[7];
      v5[7] = 0;

    }
    vm_framework_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(unsigned __int8 *)(v3 + 40);
      v15 = 67109120;
      LODWORD(v16) = v14;
      _os_log_impl(&dword_2116D5000, v13, OS_LOG_TYPE_DEFAULT, "Client received transcribing: %d state change", (uint8_t *)&v15, 8u);
    }

    return objc_msgSend(*(id *)(v3 + 32), "call_transcribingStatusDidChange");
  }
  return result;
}

void __38__VMVoicemailManager_setTranscribing___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  vm_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __38__VMVoicemailManager_setTranscribing___block_invoke_2_cold_1();

}

void __38__VMVoicemailManager_setTranscribing___block_invoke_63(uint64_t a1, char a2)
{
  NSObject *v2;

  if ((a2 & 1) == 0)
  {
    vm_framework_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __38__VMVoicemailManager_setTranscribing___block_invoke_63_cold_1(v2);

  }
}

- (void)setSubscribed:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[VMVoicemailManager internalClientQueue](self, "internalClientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__VMVoicemailManager_setSubscribed___block_invoke;
  v6[3] = &unk_24CC5AFE0;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

uint64_t __36__VMVoicemailManager_setSubscribed___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v2 + 15) != v3)
    *(_BYTE *)(v2 + 15) = v3;
  vm_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 15))
      v5 = CFSTR("SUBSCRIBED");
    else
      v5 = CFSTR("UNSUBSCRIBED");
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_2116D5000, v4, OS_LOG_TYPE_DEFAULT, "Client received subscription state change message from vmd. vmd is %@", (uint8_t *)&v7, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "call_subscriptionStateStatusDidChange");
}

- (void)setMessageWaiting:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[VMVoicemailManager internalClientQueue](self, "internalClientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__VMVoicemailManager_setMessageWaiting___block_invoke;
  v6[3] = &unk_24CC5AFE0;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __40__VMVoicemailManager_setMessageWaiting___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 13) != v2)
  {
    *(_BYTE *)(v1 + 13) = v2;
    vm_framework_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(a1 + 40))
        v5 = CFSTR("MESSAGE WAITING");
      else
        v5 = CFSTR("NO MESSAGE WAITING");
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_2116D5000, v4, OS_LOG_TYPE_DEFAULT, "Client received message waiting change message from vmd. vmd has %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)setCapabilities:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[VMVoicemailManager internalClientQueue](self, "internalClientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__VMVoicemailManager_setCapabilities___block_invoke;
  v7[3] = &unk_24CC5AEF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __38__VMVoicemailManager_setCapabilities___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(void **)(v2 + 104);
  v4 = (id *)(v2 + 104);
  if (v5 != v3)
  {
    objc_storeStrong(v4, v3);
    vm_framework_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "debugDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_2116D5000, v6, OS_LOG_TYPE_DEFAULT, "Client received new capabilities from vmd. vmd capabilities are %@", (uint8_t *)&v8, 0xCu);

    }
  }
}

- (void)setSyncInProgress:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[VMVoicemailManager internalClientQueue](self, "internalClientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__VMVoicemailManager_setSyncInProgress___block_invoke;
  v6[3] = &unk_24CC5AFE0;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

uint64_t __40__VMVoicemailManager_setSyncInProgress___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 16) != v2)
  {
    v3 = result;
    *(_BYTE *)(v1 + 16) = v2;
    vm_framework_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(v3 + 40))
        v5 = CFSTR("SYNCHRONIZING");
      else
        v5 = CFSTR("NOT SYNCHRONIZING");
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_2116D5000, v4, OS_LOG_TYPE_DEFAULT, "Client received sync in progress change message from vmd. vmd is %@", (uint8_t *)&v6, 0xCu);
    }

    return objc_msgSend(*(id *)(v3 + 32), "call_syncInProgresDidChange");
  }
  return result;
}

- (void)setStorageUsage:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  vm_framework_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = a3;
    _os_log_impl(&dword_2116D5000, v5, OS_LOG_TYPE_DEFAULT, "Client received new storage usage from vmd. Current storage level is %lu%%", buf, 0xCu);
  }

  -[VMVoicemailManager internalClientQueue](self, "internalClientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__VMVoicemailManager_setStorageUsage___block_invoke;
  v7[3] = &unk_24CC5ABE8;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(v6, v7);

}

uint64_t __38__VMVoicemailManager_setStorageUsage___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(v1 + 48) != v2)
  {
    v3 = result;
    *(_QWORD *)(v1 + 48) = v2;
    vm_framework_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(v3 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_2116D5000, v4, OS_LOG_TYPE_DEFAULT, "Client received storage usage changed message from vmd. storage usage is %@", (uint8_t *)&v6, 0xCu);

    }
    return objc_msgSend(*(id *)(v3 + 32), "call_managerStorageUsageDidChange");
  }
  return result;
}

- (void)obliterate
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  vm_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2116D5000, v3, OS_LOG_TYPE_DEFAULT, "Initiating VVM reset (obliterate)...", v5, 2u);
  }

  -[VMVoicemailManager asynchronousServerConnectionWithErrorHandler:](self, "asynchronousServerConnectionWithErrorHandler:", &__block_literal_global_77);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "obliterate");

}

void __32__VMVoicemailManager_obliterate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  vm_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __32__VMVoicemailManager_obliterate__block_invoke_cold_1();

}

- (void)insertVoicemail:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[VMVoicemailManager internalClientQueue](self, "internalClientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__VMVoicemailManager_insertVoicemail___block_invoke;
  v7[3] = &unk_24CC5AEF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __38__VMVoicemailManager_insertVoicemail___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "serverConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertVoicemail:", *(_QWORD *)(a1 + 40));

}

- (void)performAtomicAccessorBlock:(id)a3
{
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  if (v6)
  {
    os_unfair_lock_lock_with_options();
    v6[2]();
    os_unfair_lock_unlock(&self->_accessorLock);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VMVoicemailManager.m"), 1011, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
}

- (id)fetchAccounts
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[VMVoicemailManager synchronousServerConnectionWithErrorHandler:](self, "synchronousServerConnectionWithErrorHandler:", &__block_literal_global_85);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__VMVoicemailManager_fetchAccounts__block_invoke_86;
  v6[3] = &unk_24CC5B088;
  v6[4] = &v7;
  objc_msgSend(v2, "accounts:", v6);

  v3 = (void *)v8[5];
  if (!v3)
  {
    v8[5] = MEMORY[0x24BDBD1A8];

    v3 = (void *)v8[5];
  }
  v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __35__VMVoicemailManager_fetchAccounts__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  vm_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_15_cold_1();

}

void __35__VMVoicemailManager_fetchAccounts__block_invoke_86(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)isAccountSubscribed:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __42__VMVoicemailManager_isAccountSubscribed___block_invoke;
  v10[3] = &unk_24CC5B0B0;
  v6 = v4;
  v11 = v6;
  -[VMVoicemailManager synchronousServerConnectionWithErrorHandler:](self, "synchronousServerConnectionWithErrorHandler:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __42__VMVoicemailManager_isAccountSubscribed___block_invoke_87;
  v9[3] = &unk_24CC5B0D8;
  v9[4] = &v12;
  objc_msgSend(v7, "isAccountSubscribed:reply:", v6, v9);

  LOBYTE(v7) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v7;
}

void __42__VMVoicemailManager_isAccountSubscribed___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  vm_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __42__VMVoicemailManager_isAccountSubscribed___block_invoke_cold_1();

}

uint64_t __42__VMVoicemailManager_isAccountSubscribed___block_invoke_87(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isAccountOnline:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __38__VMVoicemailManager_isAccountOnline___block_invoke;
  v10[3] = &unk_24CC5B0B0;
  v6 = v4;
  v11 = v6;
  -[VMVoicemailManager synchronousServerConnectionWithErrorHandler:](self, "synchronousServerConnectionWithErrorHandler:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __38__VMVoicemailManager_isAccountOnline___block_invoke_88;
  v9[3] = &unk_24CC5B0D8;
  v9[4] = &v12;
  objc_msgSend(v7, "isAccountOnline:reply:", v6, v9);

  LOBYTE(v7) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v7;
}

void __38__VMVoicemailManager_isAccountOnline___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  vm_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __38__VMVoicemailManager_isAccountOnline___block_invoke_cold_1();

}

uint64_t __38__VMVoicemailManager_isAccountOnline___block_invoke_88(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isCallVoicemailSupportedForAccountUUID:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__VMVoicemailManager_isCallVoicemailSupportedForAccountUUID___block_invoke;
  v10[3] = &unk_24CC5B0B0;
  v6 = v4;
  v11 = v6;
  -[VMVoicemailManager synchronousServerConnectionWithErrorHandler:](self, "synchronousServerConnectionWithErrorHandler:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __61__VMVoicemailManager_isCallVoicemailSupportedForAccountUUID___block_invoke_89;
  v9[3] = &unk_24CC5B0D8;
  v9[4] = &v12;
  objc_msgSend(v7, "isCallVoicemailSupportedForAccountUUID:reply:", v6, v9);

  LOBYTE(v7) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v7;
}

void __61__VMVoicemailManager_isCallVoicemailSupportedForAccountUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  vm_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __61__VMVoicemailManager_isCallVoicemailSupportedForAccountUUID___block_invoke_cold_1();

}

uint64_t __61__VMVoicemailManager_isCallVoicemailSupportedForAccountUUID___block_invoke_89(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isPasscodeChangeSupportedForAccountUUID:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__VMVoicemailManager_isPasscodeChangeSupportedForAccountUUID___block_invoke;
  v10[3] = &unk_24CC5B0B0;
  v6 = v4;
  v11 = v6;
  -[VMVoicemailManager synchronousServerConnectionWithErrorHandler:](self, "synchronousServerConnectionWithErrorHandler:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __62__VMVoicemailManager_isPasscodeChangeSupportedForAccountUUID___block_invoke_90;
  v9[3] = &unk_24CC5B0D8;
  v9[4] = &v12;
  objc_msgSend(v7, "isPasscodeChangeSupportedForAccountUUID:reply:", v6, v9);

  LOBYTE(v7) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v7;
}

void __62__VMVoicemailManager_isPasscodeChangeSupportedForAccountUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  vm_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __62__VMVoicemailManager_isPasscodeChangeSupportedForAccountUUID___block_invoke_cold_1();

}

uint64_t __62__VMVoicemailManager_isPasscodeChangeSupportedForAccountUUID___block_invoke_90(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int64_t)minimumPasscodeLengthForAccountUUID:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  int64_t v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__VMVoicemailManager_minimumPasscodeLengthForAccountUUID___block_invoke;
  v11[3] = &unk_24CC5B0B0;
  v6 = v4;
  v12 = v6;
  -[VMVoicemailManager synchronousServerConnectionWithErrorHandler:](self, "synchronousServerConnectionWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __58__VMVoicemailManager_minimumPasscodeLengthForAccountUUID___block_invoke_91;
  v10[3] = &unk_24CC5B100;
  v10[4] = &v13;
  objc_msgSend(v7, "minimumPasscodeLengthForAccountUUID:reply:", v6, v10);

  v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __58__VMVoicemailManager_minimumPasscodeLengthForAccountUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  vm_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __58__VMVoicemailManager_minimumPasscodeLengthForAccountUUID___block_invoke_cold_1();

}

uint64_t __58__VMVoicemailManager_minimumPasscodeLengthForAccountUUID___block_invoke_91(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int64_t)maximumPasscodeLengthForAccountUUID:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  int64_t v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__VMVoicemailManager_maximumPasscodeLengthForAccountUUID___block_invoke;
  v11[3] = &unk_24CC5B0B0;
  v6 = v4;
  v12 = v6;
  -[VMVoicemailManager synchronousServerConnectionWithErrorHandler:](self, "synchronousServerConnectionWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __58__VMVoicemailManager_maximumPasscodeLengthForAccountUUID___block_invoke_93;
  v10[3] = &unk_24CC5B100;
  v10[4] = &v13;
  objc_msgSend(v7, "maximumPasscodeLengthForAccountUUID:reply:", v6, v10);

  v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __58__VMVoicemailManager_maximumPasscodeLengthForAccountUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  vm_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __58__VMVoicemailManager_maximumPasscodeLengthForAccountUUID___block_invoke_cold_1();

}

uint64_t __58__VMVoicemailManager_maximumPasscodeLengthForAccountUUID___block_invoke_93(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setPasscode:(id)a3 forAccountUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __60__VMVoicemailManager_setPasscode_forAccountUUID_completion___block_invoke;
  v20[3] = &unk_24CC5B128;
  v11 = v8;
  v21 = v11;
  v12 = v9;
  v22 = v12;
  v13 = a3;
  -[VMVoicemailManager asynchronousServerConnectionWithErrorHandler:](self, "asynchronousServerConnectionWithErrorHandler:", v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __60__VMVoicemailManager_setPasscode_forAccountUUID_completion___block_invoke_94;
  v17[3] = &unk_24CC5B150;
  v18 = v11;
  v19 = v12;
  v15 = v12;
  v16 = v11;
  objc_msgSend(v14, "setPasscode:forAccountUUID:reply:", v13, v16, v17);

}

void __60__VMVoicemailManager_setPasscode_forAccountUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  vm_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__VMVoicemailManager_setPasscode_forAccountUUID_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __60__VMVoicemailManager_setPasscode_forAccountUUID_completion___block_invoke_94(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  vm_framework_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_2116D5000, v5, OS_LOG_TYPE_DEFAULT, "Received reply for accountUUID: %@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)updateAccounts:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  vm_framework_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_2116D5000, v5, OS_LOG_TYPE_DEFAULT, "Updating accounts: %@", (uint8_t *)&v6, 0xCu);
  }

  -[VMVoicemailManager setAccounts:](self, "setAccounts:", v4);
}

- (BOOL)isGreetingChangeSupportedForAccountUUID:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__VMVoicemailManager_isGreetingChangeSupportedForAccountUUID___block_invoke;
  v10[3] = &unk_24CC5B0B0;
  v6 = v4;
  v11 = v6;
  -[VMVoicemailManager synchronousServerConnectionWithErrorHandler:](self, "synchronousServerConnectionWithErrorHandler:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __62__VMVoicemailManager_isGreetingChangeSupportedForAccountUUID___block_invoke_96;
  v9[3] = &unk_24CC5B0D8;
  v9[4] = &v12;
  objc_msgSend(v7, "isGreetingChangeSupportedForAccountUUID:reply:", v6, v9);

  LOBYTE(v7) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v7;
}

void __62__VMVoicemailManager_isGreetingChangeSupportedForAccountUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  vm_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __62__VMVoicemailManager_isGreetingChangeSupportedForAccountUUID___block_invoke_cold_1();

}

uint64_t __62__VMVoicemailManager_isGreetingChangeSupportedForAccountUUID___block_invoke_96(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (double)maximumGreetingDurationForAccountUUID:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  double v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0;
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__VMVoicemailManager_maximumGreetingDurationForAccountUUID___block_invoke;
  v11[3] = &unk_24CC5B0B0;
  v6 = v4;
  v12 = v6;
  -[VMVoicemailManager synchronousServerConnectionWithErrorHandler:](self, "synchronousServerConnectionWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __60__VMVoicemailManager_maximumGreetingDurationForAccountUUID___block_invoke_97;
  v10[3] = &unk_24CC5B178;
  v10[4] = &v13;
  objc_msgSend(v7, "maximumGreetingDurationForAccountUUID:reply:", v6, v10);

  v8 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __60__VMVoicemailManager_maximumGreetingDurationForAccountUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  vm_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __60__VMVoicemailManager_maximumGreetingDurationForAccountUUID___block_invoke_cold_1();

}

uint64_t __60__VMVoicemailManager_maximumGreetingDurationForAccountUUID___block_invoke_97(uint64_t result, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)greetingForAccountUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __56__VMVoicemailManager_greetingForAccountUUID_completion___block_invoke;
  v15[3] = &unk_24CC5B128;
  v16 = v6;
  v9 = v7;
  v17 = v9;
  v10 = v6;
  -[VMVoicemailManager asynchronousServerConnectionWithErrorHandler:](self, "asynchronousServerConnectionWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __56__VMVoicemailManager_greetingForAccountUUID_completion___block_invoke_99;
  v13[3] = &unk_24CC5B1A0;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "greetingForAccountUUID:reply:", v10, v13);

}

void __56__VMVoicemailManager_greetingForAccountUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  vm_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__VMVoicemailManager_greetingForAccountUUID_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __56__VMVoicemailManager_greetingForAccountUUID_completion___block_invoke_99(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setGreeting:(id)a3 forAccountUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __60__VMVoicemailManager_setGreeting_forAccountUUID_completion___block_invoke;
  v18[3] = &unk_24CC5B128;
  v19 = v8;
  v11 = v9;
  v20 = v11;
  v12 = v8;
  v13 = a3;
  -[VMVoicemailManager asynchronousServerConnectionWithErrorHandler:](self, "asynchronousServerConnectionWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __60__VMVoicemailManager_setGreeting_forAccountUUID_completion___block_invoke_101;
  v16[3] = &unk_24CC5B1C8;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "setGreeting:forAccountUUID:reply:", v13, v12, v16);

}

void __60__VMVoicemailManager_setGreeting_forAccountUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  vm_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__VMVoicemailManager_setPasscode_forAccountUUID_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __60__VMVoicemailManager_setGreeting_forAccountUUID_completion___block_invoke_101(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)greetingChangedByCarrier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  vm_framework_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_2116D5000, v5, OS_LOG_TYPE_DEFAULT, "greetingChangedByCarrier: %@", buf, 0xCu);
  }

  -[VMVoicemailManager internalClientQueue](self, "internalClientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__VMVoicemailManager_greetingChangedByCarrier___block_invoke;
  v8[3] = &unk_24CC5AEF0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

uint64_t __47__VMVoicemailManager_greetingChangedByCarrier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "call_greetingDidChangeByCarrier:", *(_QWORD *)(a1 + 40));
}

- (int64_t)messageCountForMailboxType:(int64_t)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  int64_t v9;
  _QWORD v11[5];
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
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __55__VMVoicemailManager_messageCountForMailboxType_error___block_invoke;
  v12[3] = &unk_24CC5B1F0;
  v12[4] = &v19;
  v12[5] = &v13;
  -[VMVoicemailManager synchronousServerConnectionWithErrorHandler:](self, "synchronousServerConnectionWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __55__VMVoicemailManager_messageCountForMailboxType_error___block_invoke_102;
  v11[3] = &unk_24CC5B100;
  v11[4] = &v19;
  objc_msgSend(v7, "messageCountForMailboxType:reply:", a3, v11);

  if (a4)
  {
    v8 = (void *)v14[5];
    if (v8)
      *a4 = objc_retainAutorelease(v8);
  }
  v9 = v20[3];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __55__VMVoicemailManager_messageCountForMailboxType_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  vm_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__VMVoicemailManager_messageCountForMailboxType_error___block_invoke_cold_1();

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

uint64_t __55__VMVoicemailManager_messageCountForMailboxType_error___block_invoke_102(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)messageCountForMailboxType:(int64_t)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__VMVoicemailManager_messageCountForMailboxType_completion___block_invoke;
  v13[3] = &unk_24CC5AAF0;
  v8 = v6;
  v14 = v8;
  -[VMVoicemailManager asynchronousServerConnectionWithErrorHandler:](self, "asynchronousServerConnectionWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __60__VMVoicemailManager_messageCountForMailboxType_completion___block_invoke_103;
  v11[3] = &unk_24CC5B218;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "messageCountForMailboxType:reply:", a3, v11);

}

void __60__VMVoicemailManager_messageCountForMailboxType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  vm_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__VMVoicemailManager_messageCountForMailboxType_error___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__VMVoicemailManager_messageCountForMailboxType_completion___block_invoke_103(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int64_t)messageCountForMailboxType:(int64_t)a3 read:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  uint64_t v8;
  void *v9;
  void *v10;
  int64_t v11;
  _QWORD v13[5];
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __60__VMVoicemailManager_messageCountForMailboxType_read_error___block_invoke;
  v14[3] = &unk_24CC5B1F0;
  v14[4] = &v21;
  v14[5] = &v15;
  -[VMVoicemailManager synchronousServerConnectionWithErrorHandler:](self, "synchronousServerConnectionWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __60__VMVoicemailManager_messageCountForMailboxType_read_error___block_invoke_104;
  v13[3] = &unk_24CC5B100;
  v13[4] = &v21;
  objc_msgSend(v9, "messageCountForMailboxType:read:reply:", a3, v6, v13);

  if (a5)
  {
    v10 = (void *)v16[5];
    if (v10)
      *a5 = objc_retainAutorelease(v10);
  }
  v11 = v22[3];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __60__VMVoicemailManager_messageCountForMailboxType_read_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  vm_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__VMVoicemailManager_messageCountForMailboxType_error___block_invoke_cold_1();

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

uint64_t __60__VMVoicemailManager_messageCountForMailboxType_read_error___block_invoke_104(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)messageCountForMailboxType:(int64_t)a3 read:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a4;
  v8 = a5;
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __65__VMVoicemailManager_messageCountForMailboxType_read_completion___block_invoke;
  v15[3] = &unk_24CC5AAF0;
  v10 = v8;
  v16 = v10;
  -[VMVoicemailManager asynchronousServerConnectionWithErrorHandler:](self, "asynchronousServerConnectionWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __65__VMVoicemailManager_messageCountForMailboxType_read_completion___block_invoke_105;
  v13[3] = &unk_24CC5B218;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "messageCountForMailboxType:read:reply:", a3, v5, v13);

}

void __65__VMVoicemailManager_messageCountForMailboxType_read_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  vm_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__VMVoicemailManager_messageCountForMailboxType_error___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__VMVoicemailManager_messageCountForMailboxType_read_completion___block_invoke_105(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)messagesForMailboxType:(int64_t)a3 limit:(int64_t)a4 offset:(int64_t)a5 error:(id *)a6
{
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  _QWORD v16[6];
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
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __64__VMVoicemailManager_messagesForMailboxType_limit_offset_error___block_invoke;
  v16[3] = &unk_24CC5B1F0;
  v16[4] = &v23;
  v16[5] = &v17;
  -[VMVoicemailManager synchronousServerConnectionWithErrorHandler:](self, "synchronousServerConnectionWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __64__VMVoicemailManager_messagesForMailboxType_limit_offset_error___block_invoke_106;
  v15[3] = &unk_24CC5B088;
  v15[4] = &v23;
  objc_msgSend(v11, "messagesForMailboxType:limit:offset:reply:", a3, a4, a5, v15);

  if (a6)
  {
    v12 = (void *)v18[5];
    if (v12)
      *a6 = objc_retainAutorelease(v12);
  }
  v13 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v13;
}

void __64__VMVoicemailManager_messagesForMailboxType_limit_offset_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  vm_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64__VMVoicemailManager_messagesForMailboxType_limit_offset_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __64__VMVoicemailManager_messagesForMailboxType_limit_offset_error___block_invoke_106(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)messagesForMailboxType:(int64_t)a3 read:(BOOL)a4 limit:(int64_t)a5 offset:(int64_t)a6 error:(id *)a7
{
  _BOOL8 v10;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v10 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__0;
  v29 = __Block_byref_object_dispose__0;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __69__VMVoicemailManager_messagesForMailboxType_read_limit_offset_error___block_invoke;
  v18[3] = &unk_24CC5B1F0;
  v18[4] = &v25;
  v18[5] = &v19;
  -[VMVoicemailManager synchronousServerConnectionWithErrorHandler:](self, "synchronousServerConnectionWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __69__VMVoicemailManager_messagesForMailboxType_read_limit_offset_error___block_invoke_107;
  v17[3] = &unk_24CC5B088;
  v17[4] = &v25;
  objc_msgSend(v13, "messagesForMailboxType:read:limit:offset:reply:", a3, v10, a5, a6, v17);

  if (a7)
  {
    v14 = (void *)v20[5];
    if (v14)
      *a7 = objc_retainAutorelease(v14);
  }
  v15 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __69__VMVoicemailManager_messagesForMailboxType_read_limit_offset_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  vm_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64__VMVoicemailManager_messagesForMailboxType_limit_offset_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __69__VMVoicemailManager_messagesForMailboxType_read_limit_offset_error___block_invoke_107(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)isTranscriptionEnabled
{
  VMVoicemailManager *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[VMVoicemailManager internalClientQueue](self, "internalClientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__VMVoicemailManager_isTranscriptionEnabled__block_invoke;
  v5[3] = &unk_24CC5ABC0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __44__VMVoicemailManager_isTranscriptionEnabled__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "capabilities");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isTranscriptionEnabled");

}

- (void)reportTranscriptionProblemForVoicemail:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[VMVoicemailManager serverConnection](self, "serverConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "identifier");

  objc_msgSend(v6, "reportTranscriptionProblemForIdentifier:", v5);
}

- (void)reportTranscriptionRatedAccurate:(BOOL)a3 forVoicemail:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v6 = a4;
  -[VMVoicemailManager serverConnection](self, "serverConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "identifier");

  objc_msgSend(v8, "reportTranscriptionRatedAccurate:forIdentifier:", v4, v7);
}

- (void)changePassword:(id)a3 withCompletionHandler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)saveGreeting:(id)a3 withCompletionHandler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)setCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionQueue, a3);
}

- (BOOL)canChangePassword
{
  return self->_canChangePassword;
}

- (BOOL)canChangeGreeting
{
  return self->_canChangeGreeting;
}

- (BOOL)mailboxRequiresSetup
{
  return self->_mailboxRequiresSetup;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (NSOrderedSet)voicemails
{
  return self->_voicemails;
}

- (void)setVoicemails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSMutableSet)trashedMessages
{
  return self->_trashedMessages;
}

- (void)setTrashedMessages:(id)a3
{
  objc_storeStrong((id *)&self->_trashedMessages, a3);
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (OS_dispatch_queue)delegate_queue
{
  return self->_delegate_queue;
}

- (void)setDelegate_queue:(id)a3
{
  objc_storeStrong((id *)&self->_delegate_queue, a3);
}

- (OS_dispatch_queue)internalClientQueue
{
  return self->_internalClientQueue;
}

- (VMVoicemailCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_internalClientQueue, 0);
  objc_storeStrong((id *)&self->_delegate_queue, 0);
  objc_storeStrong((id *)&self->_trashedMessages, 0);
  objc_storeStrong((id *)&self->_voicemails, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transcriptionProgress, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
}

void __38__VMVoicemailManager_serverConnection__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_2116D5000, v0, v1, "Received error while communicating with vmd: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __73__VMVoicemailManager_requestInitialStateIfNecessaryAndSendNotifications___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_2116D5000, v0, v1, "Cannot ping due to connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_15_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_2116D5000, v0, v1, "Could not retrieve accounts due to connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __103__VMVoicemailManager__fetchInitialStateIfNecessaryWithForce_waitStates_waitMails_waitAccounts_session___block_invoke_20_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_2116D5000, v0, v1, "Could not retrieve states due to connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __38__VMVoicemailManager_setTranscribing___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_2116D5000, v0, v1, "Error fetching initial state: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __38__VMVoicemailManager_setTranscribing___block_invoke_63_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2116D5000, log, OS_LOG_TYPE_ERROR, "Error fetching progress", v1, 2u);
  OUTLINED_FUNCTION_7();
}

void __32__VMVoicemailManager_obliterate__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_2116D5000, v0, v1, "Error resetting VVM: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __42__VMVoicemailManager_isAccountSubscribed___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2116D5000, v0, v1, "Could not retrieve subscribed status for account UUID %@ due to error %@");
  OUTLINED_FUNCTION_3();
}

void __38__VMVoicemailManager_isAccountOnline___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2116D5000, v0, v1, "Could not retrieve online status for account UUID %@ due to error %@");
  OUTLINED_FUNCTION_3();
}

void __61__VMVoicemailManager_isCallVoicemailSupportedForAccountUUID___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2116D5000, v0, v1, "Could not retrieve call voicemail status for account UUID %@ due to error %@");
  OUTLINED_FUNCTION_3();
}

void __62__VMVoicemailManager_isPasscodeChangeSupportedForAccountUUID___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2116D5000, v0, v1, "Could not determine whether passcode change is supported for account UUID %@ due to error %@");
  OUTLINED_FUNCTION_3();
}

void __58__VMVoicemailManager_minimumPasscodeLengthForAccountUUID___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2116D5000, v0, v1, "Could not retrieve minimum passcode length for account UUID %@ due to error %@");
  OUTLINED_FUNCTION_3();
}

void __58__VMVoicemailManager_maximumPasscodeLengthForAccountUUID___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2116D5000, v0, v1, "Could not retrieve maximum password length for account UUID %@ due to error %@");
  OUTLINED_FUNCTION_3();
}

void __60__VMVoicemailManager_setPasscode_forAccountUUID_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2116D5000, v0, v1, "Could not set passcode for account UUID %@ due to error %@");
  OUTLINED_FUNCTION_3();
}

void __62__VMVoicemailManager_isGreetingChangeSupportedForAccountUUID___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2116D5000, v0, v1, "Could not whether greeting change is supported for account UUID %@ due to error %@");
  OUTLINED_FUNCTION_3();
}

void __60__VMVoicemailManager_maximumGreetingDurationForAccountUUID___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2116D5000, v0, v1, "Could not retrieve maximum greeting duration for account UUID %@ due to error %@");
  OUTLINED_FUNCTION_3();
}

void __56__VMVoicemailManager_greetingForAccountUUID_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2116D5000, v0, v1, "Could not retrieve greeting for account UUID %@ due to error %@");
  OUTLINED_FUNCTION_3();
}

void __55__VMVoicemailManager_messageCountForMailboxType_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_2116D5000, v0, v1, "Could not retrieve message count due to error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __64__VMVoicemailManager_messagesForMailboxType_limit_offset_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_2116D5000, v0, v1, "Could not retrieve messages due to error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
