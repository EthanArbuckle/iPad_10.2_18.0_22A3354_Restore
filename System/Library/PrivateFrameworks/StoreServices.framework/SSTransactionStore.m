@implementation SSTransactionStore

- (SSTransactionStore)init
{
  SSTransactionStore *v2;
  uint64_t v3;
  NSCountedSet *transactionCount;
  uint64_t v5;
  NSMutableDictionary *transactionStore;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *dispatchQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SSTransactionStore;
  v2 = -[SSTransactionStore init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    transactionCount = v2->_transactionCount;
    v2->_transactionCount = (NSCountedSet *)v3;

    v5 = objc_opt_new();
    transactionStore = v2->_transactionStore;
    v2->_transactionStore = (NSMutableDictionary *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.storeservices.TransactionStore", v7);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v8;

  }
  return v2;
}

+ (id)defaultStore
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SSTransactionStore_defaultStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultStore_onceToken != -1)
    dispatch_once(&defaultStore_onceToken, block);
  return (id)defaultStore_transactionStore;
}

void __34__SSTransactionStore_defaultStore__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)defaultStore_transactionStore;
  defaultStore_transactionStore = (uint64_t)v0;

}

- (void)takeKeepAliveWithTransactionID:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__SSTransactionStore_takeKeepAliveWithTransactionID___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __53__SSTransactionStore_takeKeepAliveWithTransactionID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "countForObject:", *(_QWORD *)(a1 + 40));
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2 != 1)
  {
    if (!v3)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17 = objc_msgSend(v4, "shouldLog");
    if (objc_msgSend(v4, "shouldLogToDisk"))
      v18 = v17 | 2;
    else
      v18 = v17;
    objc_msgSend(v4, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      v20 = v18;
    else
      v20 = v18 & 2;
    if (v20)
    {
      v21 = *(_QWORD *)(a1 + 40);
      v30 = 138543362;
      v31 = v21;
      LODWORD(v29) = 12;
      v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
        goto LABEL_27;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v22, 4, &v30, v29);
      v19 = objc_claimAutoreleasedReturnValue();
      free(v22);
      SSFileLog(v4, CFSTR("%@"), v23, v24, v25, v26, v27, v28, (uint64_t)v19);
    }

    goto LABEL_27;
  }
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    v8 = v6;
  else
    v8 = v6 & 2;
  if (!v8)
    goto LABEL_13;
  v9 = *(_QWORD *)(a1 + 40);
  v30 = 138543362;
  v31 = v9;
  LODWORD(v29) = 12;
  v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v30, v29);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v10);
    SSFileLog(v4, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v7);
LABEL_13:

  }
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
  v4 = (void *)os_transaction_create();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 40));
LABEL_27:

}

- (void)releaseKeepAliveWithTransactionID:(id)a3
{
  id v4;
  dispatch_time_t v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = dispatch_time(0, 15000000000);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__SSTransactionStore_releaseKeepAliveWithTransactionID___block_invoke;
  v8[3] = &unk_1E47B8768;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_after(v5, dispatchQueue, v8);

}

void __56__SSTransactionStore_releaseKeepAliveWithTransactionID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "countForObject:", *(_QWORD *)(a1 + 40));
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2)
  {
    if (!v3)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = objc_msgSend(v4, "shouldLog");
    if (objc_msgSend(v4, "shouldLogToDisk"))
      v6 = v5 | 2;
    else
      v6 = v5;
    objc_msgSend(v4, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      v8 = v6;
    else
      v8 = v6 & 2;
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 40);
      v30 = 138543362;
      v31 = v9;
      LODWORD(v29) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_14:

        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v30, v29);
      v7 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v4, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v7);
    }

    goto LABEL_14;
  }
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v18 = v17 | 2;
  else
    v18 = v17;
  objc_msgSend(v4, "OSLogObject");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    v20 = v18;
  else
    v20 = v18 & 2;
  if (!v20)
    goto LABEL_26;
  v21 = *(_QWORD *)(a1 + 40);
  v30 = 138543362;
  v31 = v21;
  LODWORD(v29) = 12;
  v22 = (void *)_os_log_send_and_compose_impl();

  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v22, 4, &v30, v29);
    v19 = objc_claimAutoreleasedReturnValue();
    free(v22);
    SSFileLog(v4, CFSTR("%@"), v23, v24, v25, v26, v27, v28, (uint64_t)v19);
LABEL_26:

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_transactionStore, 0);
  objc_storeStrong((id *)&self->_transactionCount, 0);
}

@end
