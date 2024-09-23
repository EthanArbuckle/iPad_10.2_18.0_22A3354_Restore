@implementation WFWalletTransactionProvider

- (WFWalletTransactionProvider)init
{
  WFWalletTransactionProvider *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  NSMutableDictionary *requests;
  uint64_t v9;
  NSMutableDictionary *timers;
  WFWalletTransactionProvider *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WFWalletTransactionProvider;
  v2 = -[WFWalletTransactionProvider init](&v13, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.shortcuts.queue.WFWalletTransactionProvider", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = objc_opt_new();
    requests = v2->_requests;
    v2->_requests = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    timers = v2->_timers;
    v2->_timers = (NSMutableDictionary *)v9;

    v11 = v2;
  }

  return v2;
}

- (PKPaymentService)paymentService
{
  PKPaymentService *paymentService;
  void *v4;
  objc_class *v5;
  PKPaymentService *v6;
  PKPaymentService *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  paymentService = self->_paymentService;
  if (!paymentService)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getPKPaymentServiceClass_softClass;
    v13 = getPKPaymentServiceClass_softClass;
    if (!getPKPaymentServiceClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getPKPaymentServiceClass_block_invoke;
      v9[3] = &unk_1E7AA8030;
      v9[4] = &v10;
      __getPKPaymentServiceClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (PKPaymentService *)objc_msgSend([v5 alloc], "initWithDelegate:", self);
    v7 = self->_paymentService;
    self->_paymentService = v6;

    paymentService = self->_paymentService;
  }
  return paymentService;
}

- (NPKCompanionAgentConnection)remotePaymentServiceConnection
{
  NPKCompanionAgentConnection *remotePaymentServiceConnection;
  void *v4;
  objc_class *v5;
  NPKCompanionAgentConnection *v6;
  NPKCompanionAgentConnection *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  remotePaymentServiceConnection = self->_remotePaymentServiceConnection;
  if (!remotePaymentServiceConnection)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getNPKCompanionAgentConnectionClass_softClass;
    v13 = getNPKCompanionAgentConnectionClass_softClass;
    if (!getNPKCompanionAgentConnectionClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getNPKCompanionAgentConnectionClass_block_invoke;
      v9[3] = &unk_1E7AA8030;
      v9[4] = &v10;
      __getNPKCompanionAgentConnectionClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (NPKCompanionAgentConnection *)objc_alloc_init(v5);
    v7 = self->_remotePaymentServiceConnection;
    self->_remotePaymentServiceConnection = v6;

    -[NPKCompanionAgentConnection setDelegate:](self->_remotePaymentServiceConnection, "setDelegate:", self);
    remotePaymentServiceConnection = self->_remotePaymentServiceConnection;
  }
  return remotePaymentServiceConnection;
}

- (void)fetchLocalTransactionWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[WFWalletTransactionProvider queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__WFWalletTransactionProvider_fetchLocalTransactionWithIdentifier_completion___block_invoke;
  block[3] = &unk_1E7AA8110;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)fetchRemoteTransactionWithIdentifier:(id)a3 passUniqueID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFWalletTransactionProvider queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __92__WFWalletTransactionProvider_fetchRemoteTransactionWithIdentifier_passUniqueID_completion___block_invoke;
  v15[3] = &unk_1E7AA7558;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)observeForUpdatesWithInitialTransactionIfNeeded:(id)a3 transactionIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFWalletTransactionProvider queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __112__WFWalletTransactionProvider_observeForUpdatesWithInitialTransactionIfNeeded_transactionIdentifier_completion___block_invoke;
  v15[3] = &unk_1E7AA7558;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)queue_takeTransactionIfNeeded
{
  NSObject *v3;
  void *v4;
  id v5;

  -[WFWalletTransactionProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[WFWalletTransactionProvider transaction](self, "transaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (id)os_transaction_create();
    -[WFWalletTransactionProvider setTransaction:](self, "setTransaction:", v5);

  }
}

- (void)queue_endTransactionIfNeeded
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[WFWalletTransactionProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[WFWalletTransactionProvider transaction](self, "transaction");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[WFWalletTransactionProvider requests](self, "requests");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (!v7)
    {
      -[WFWalletTransactionProvider transaction](self, "transaction");

    }
  }
}

- (void)queue_finishWithPaymentTransaction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[WFWalletTransactionProvider queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[WFWalletTransactionProvider timers](self, "timers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "cancel");
  -[WFWalletTransactionProvider timers](self, "timers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v9);

  -[WFWalletTransactionProvider requests](self, "requests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  -[WFWalletTransactionProvider requests](self, "requests");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObjectForKey:", v14);

  ((void (**)(_QWORD, id, _QWORD))v12)[2](v12, v4, 0);
  -[WFWalletTransactionProvider queue_endTransactionIfNeeded](self, "queue_endTransactionIfNeeded");

}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[WFWalletTransactionProvider queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__WFWalletTransactionProvider_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
  v8[3] = &unk_1E7AA8138;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithCredentials:(id)a4 completion:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (BOOL)transactionIsValid:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "merchant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "merchantProvidedTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "length") != 0;

  }
  return v6;
}

- (void)setPaymentService:(id)a3
{
  objc_storeStrong((id *)&self->_paymentService, a3);
}

- (void)setRemotePaymentServiceConnection:(id)a3
{
  objc_storeStrong((id *)&self->_remotePaymentServiceConnection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
  objc_storeStrong((id *)&self->_requests, a3);
}

- (NSMutableDictionary)timers
{
  return self->_timers;
}

- (void)setTimers:(id)a3
{
  objc_storeStrong((id *)&self->_timers, a3);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_timers, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_remotePaymentServiceConnection, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
}

void __81__WFWalletTransactionProvider_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "requests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "transactionIsValid:", *(_QWORD *)(a1 + 40));
    getWFTriggersLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 40);
        v9 = 136315394;
        v10 = "-[WFWalletTransactionProvider transactionSourceIdentifier:didReceiveTransaction:]_block_invoke";
        v11 = 2112;
        v12 = v8;
        _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_DEFAULT, "%s Found valid payment transaction (%@) finishing.", (uint8_t *)&v9, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "queue_finishWithPaymentTransaction:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v9 = 136315138;
        v10 = "-[WFWalletTransactionProvider transactionSourceIdentifier:didReceiveTransaction:]_block_invoke";
        _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_ERROR, "%s Found valid transaction but it was incomplete, waiting.", (uint8_t *)&v9, 0xCu);
      }

    }
  }
}

void __112__WFWalletTransactionProvider_observeForUpdatesWithInitialTransactionIfNeeded_transactionIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "transactionIsValid:", *(_QWORD *)(a1 + 40)))
  {
    getWFTriggersLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v20 = "-[WFWalletTransactionProvider observeForUpdatesWithInitialTransactionIfNeeded:transactionIdentifier:completi"
            "on:]_block_invoke";
      v21 = 2112;
      v22 = v3;
      _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_DEFAULT, "%s Found valid payment transaction (%@) returning", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "queue_endTransactionIfNeeded");
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 56), "copy");
    v5 = _Block_copy(v4);
    objc_msgSend(*(id *)(a1 + 32), "requests");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 48));

    v7 = objc_alloc(MEMORY[0x1E0CBDD00]);
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __112__WFWalletTransactionProvider_observeForUpdatesWithInitialTransactionIfNeeded_transactionIdentifier_completion___block_invoke_146;
    v15[3] = &unk_1E7AA82B0;
    v9 = *(id *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v16 = v9;
    v17 = v10;
    v18 = v11;
    v12 = (void *)objc_msgSend(v7, "initWithTimeoutInterval:onQueue:timeoutHandler:", v8, v15, 60.0);

    objc_msgSend(v12, "start");
    objc_msgSend(*(id *)(a1 + 32), "timers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v12, *(_QWORD *)(a1 + 48));

    getWFTriggersLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[WFWalletTransactionProvider observeForUpdatesWithInitialTransactionIfNeeded:transactionIdentifier:completi"
            "on:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_DEFAULT, "%s Did not find valid payment transaction waiting...", buf, 0xCu);
    }

  }
}

uint64_t __112__WFWalletTransactionProvider_observeForUpdatesWithInitialTransactionIfNeeded_transactionIdentifier_completion___block_invoke_146(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  getWFTriggersLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[WFWalletTransactionProvider observeForUpdatesWithInitialTransactionIfNeeded:transactionIdentifier:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_ERROR, "%s Hit timeout waiting for transaction with identifier: %@, finishing.", (uint8_t *)&v5, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 40), "queue_finishWithPaymentTransaction:", *(_QWORD *)(a1 + 48));
}

void __92__WFWalletTransactionProvider_fetchRemoteTransactionWithIdentifier_passUniqueID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "queue_takeTransactionIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "remotePaymentServiceConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __92__WFWalletTransactionProvider_fetchRemoteTransactionWithIdentifier_passUniqueID_completion___block_invoke_2;
  v4[3] = &unk_1E7AA5C18;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v7 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "paymentPassWithUniqueID:synchronous:reply:", v5, 0, v4);

}

void __92__WFWalletTransactionProvider_fetchRemoteTransactionWithIdentifier_passUniqueID_completion___block_invoke_2(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  if (!v3)
  {
    objc_msgSend(a1[4], "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __92__WFWalletTransactionProvider_fetchRemoteTransactionWithIdentifier_passUniqueID_completion___block_invoke_3;
    block[3] = &unk_1E7AA8110;
    v6 = a1[5];
    v7 = a1[4];
    v18 = v6;
    v19 = v7;
    v20 = a1[7];
    dispatch_async(v5, block);

  }
  objc_msgSend(v3, "deviceTransactionSourceIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1800.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "remotePaymentServiceConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __92__WFWalletTransactionProvider_fetchRemoteTransactionWithIdentifier_passUniqueID_completion___block_invoke_140;
  v12[3] = &unk_1E7AA5BF0;
  objc_copyWeak(&v15, &location);
  v13 = a1[6];
  v14 = a1[7];
  objc_msgSend(v10, "transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:orderedByDate:limit:completion:", v8, 0, 0, v9, v11, 1, 10, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

uint64_t __92__WFWalletTransactionProvider_fetchRemoteTransactionWithIdentifier_passUniqueID_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  getWFTriggersLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[WFWalletTransactionProvider fetchRemoteTransactionWithIdentifier:passUniqueID:completion:]_block_invoke_3";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_ERROR, "%s Failed to get pass with id: %@", (uint8_t *)&v5, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "queue_endTransactionIfNeeded");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __92__WFWalletTransactionProvider_fetchRemoteTransactionWithIdentifier_passUniqueID_completion___block_invoke_140(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__WFWalletTransactionProvider_fetchRemoteTransactionWithIdentifier_passUniqueID_completion___block_invoke_2_141;
  v8[3] = &unk_1E7AA5BC8;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v6, "if_firstObjectPassingTest:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "observeForUpdatesWithInitialTransactionIfNeeded:transactionIdentifier:completion:", v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __92__WFWalletTransactionProvider_fetchRemoteTransactionWithIdentifier_passUniqueID_completion___block_invoke_2_141(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5 = v3;
  v6 = v5;
  if (v4 == v5)
  {
    v8 = 1;
  }
  else
  {
    if (v4)
      v7 = v5 == 0;
    else
      v7 = 1;
    if (v7)
      v8 = 0;
    else
      v8 = objc_msgSend(v4, "isEqualToString:", v5);
  }

  return v8;
}

void __78__WFWalletTransactionProvider_fetchLocalTransactionWithIdentifier_completion___block_invoke(id *a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id location;

  objc_msgSend(a1[4], "queue_takeTransactionIfNeeded");
  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "paymentService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__WFWalletTransactionProvider_fetchLocalTransactionWithIdentifier_completion___block_invoke_2;
  v4[3] = &unk_1E7AA5BA0;
  objc_copyWeak(&v7, &location);
  v5 = a1[5];
  v6 = a1[6];
  objc_msgSend(v2, "transactionWithTransactionIdentifier:completion:", v3, v4);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __78__WFWalletTransactionProvider_fetchLocalTransactionWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "observeForUpdatesWithInitialTransactionIfNeeded:transactionIdentifier:completion:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

+ (id)sharedProvider
{
  if (sharedProvider_onceToken != -1)
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_178);
  return (id)sharedProvider_provider;
}

void __45__WFWalletTransactionProvider_sharedProvider__block_invoke()
{
  WFWalletTransactionProvider *v0;
  void *v1;

  v0 = objc_alloc_init(WFWalletTransactionProvider);
  v1 = (void *)sharedProvider_provider;
  sharedProvider_provider = (uint64_t)v0;

}

@end
