@implementation SSPurchaseIntentActionRequest

- (void)startWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v21 = 136446210;
      v22 = "-[SSPurchaseIntentActionRequest startWithCompletionBlock:]";
      LODWORD(v18) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v21, v18);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __58__SSPurchaseIntentActionRequest_startWithCompletionBlock___block_invoke;
  v19[3] = &unk_1E47B8630;
  v19[4] = self;
  v20 = v4;
  v17 = v4;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 198, v19);

}

void __58__SSPurchaseIntentActionRequest_startWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E0C81258])
    {
      SSError((uint64_t)CFSTR("SSErrorDomain"), 121, 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
      xpc_dictionary_get_value(v4, "1");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "initWithXPCEncoding:", v6);

    }
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __58__SSPurchaseIntentActionRequest_startWithCompletionBlock___block_invoke_2;
    v14 = &unk_1E47B8A98;
    v9 = *(id *)(a1 + 40);
    v15 = v7;
    v16 = v9;
    v10 = v7;
    dispatch_async(v8, &v11);

  }
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest", v11, v12, v13, v14);

}

uint64_t __58__SSPurchaseIntentActionRequest_startWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  NSObject *dispatchQueue;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  SSPurchaseIntentActionRequest *v10;

  v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->super._dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__SSPurchaseIntentActionRequest_copyXPCEncoding__block_invoke;
  v8[3] = &unk_1E47B8768;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_sync(dispatchQueue, v8);
  v6 = v5;

  return v6;
}

void __48__SSPurchaseIntentActionRequest_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "appBundleId", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "action", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104));
}

- (SSPurchaseIntentActionRequest)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSPurchaseIntentActionRequest *v6;
  uint64_t v8;
  uint64_t v9;
  NSString *appBundleId;
  objc_super v11;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v11.receiver = self;
    v11.super_class = (Class)SSPurchaseIntentActionRequest;
    v6 = -[SSRequest init](&v11, sel_init);
    if (v6)
    {
      v8 = objc_opt_class();
      v9 = SSXPCDictionaryCopyObjectWithClass(v5, "appBundleId", v8);
      appBundleId = v6->_appBundleId;
      v6->_appBundleId = (NSString *)v9;

      v6->_action = xpc_dictionary_get_int64(v5, "action");
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

@end
