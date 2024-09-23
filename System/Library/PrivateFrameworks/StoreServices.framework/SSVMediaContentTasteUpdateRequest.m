@implementation SSVMediaContentTasteUpdateRequest

- (void)startWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__SSVMediaContentTasteUpdateRequest_startWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E47BD7F8;
  v7 = v4;
  v5 = v4;
  -[SSVMediaContentTasteUpdateRequest startWithResponseBlock:](self, "startWithResponseBlock:", v6);

}

uint64_t __62__SSVMediaContentTasteUpdateRequest_startWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (SSVMediaContentTasteUpdateRequest)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSVMediaContentTasteUpdateRequest *v6;
  void *v8;
  _QWORD applier[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  objc_super v16;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v16.receiver = self;
    v16.super_class = (Class)SSVMediaContentTasteUpdateRequest;
    v6 = -[SSRequest init](&v16, sel_init);
    if (v6)
    {
      v10 = 0;
      v11 = &v10;
      v12 = 0x3032000000;
      v13 = __Block_byref_object_copy__40;
      v14 = __Block_byref_object_dispose__40;
      v15 = 0;
      xpc_dictionary_get_value(v5, "0");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (MEMORY[0x1A85863E4]() == MEMORY[0x1E0C812C8])
      {
        applier[0] = MEMORY[0x1E0C809B0];
        applier[1] = 3221225472;
        applier[2] = __57__SSVMediaContentTasteUpdateRequest_initWithXPCEncoding___block_invoke;
        applier[3] = &unk_1E47BD820;
        applier[4] = &v10;
        xpc_array_apply(v8, applier);
      }
      objc_storeStrong((id *)&v6->_contentTasteItemUpdates, (id)v11[5]);
      v6->_shouldInvalidateLocalCache = xpc_dictionary_get_BOOL(v5, "1");

      _Block_object_dispose(&v10, 8);
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

uint64_t __57__SSVMediaContentTasteUpdateRequest_initWithXPCEncoding___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  SSVMediaContentTasteItemUpdate *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = -[SSVMediaContentTasteItemUpdate initWithXPCEncoding:]([SSVMediaContentTasteItemUpdate alloc], "initWithXPCEncoding:", v4);

  if (v5)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v6, "addObject:", v5);
  }

  return 1;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  xpc_object_t v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = xpc_array_create(0, 0);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_contentTasteItemUpdates;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "copyXPCEncoding", (_QWORD)v12);
        if (v10)
          xpc_array_append_value(v4, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  xpc_dictionary_set_value(v3, "0", v4);
  xpc_dictionary_set_BOOL(v3, "1", self->_shouldInvalidateLocalCache);

  return v3;
}

- (void)startWithResponseBlock:(id)a3
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
      v22 = "-[SSVMediaContentTasteUpdateRequest startWithResponseBlock:]";
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
  v19[2] = __60__SSVMediaContentTasteUpdateRequest_startWithResponseBlock___block_invoke;
  v19[3] = &unk_1E47B8630;
  v19[4] = self;
  v20 = v4;
  v17 = v4;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 163, v19);

}

void __60__SSVMediaContentTasteUpdateRequest_startWithResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  SSVMediaContentTasteUpdateResponse *v5;
  void *v6;
  SSVMediaContentTasteUpdateResponse *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  SSVMediaContentTasteUpdateResponse *v14;
  _QWORD block[4];
  SSVMediaContentTasteUpdateResponse *v16;
  id v17;
  id v18;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E0C81258])
    {
      SSError((uint64_t)CFSTR("SSErrorDomain"), 121, 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
    }
    else
    {
      v5 = [SSVMediaContentTasteUpdateResponse alloc];
      xpc_dictionary_get_value(v4, "1");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[SSVMediaContentTasteUpdateResponse initWithXPCEncoding:](v5, "initWithXPCEncoding:", v6);

      v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
      xpc_dictionary_get_value(v4, "2");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithXPCEncoding:", v9);

    }
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__SSVMediaContentTasteUpdateRequest_startWithResponseBlock___block_invoke_2;
    block[3] = &unk_1E47B8608;
    v12 = *(id *)(a1 + 40);
    v17 = v10;
    v18 = v12;
    v16 = v7;
    v13 = v10;
    v14 = v7;
    dispatch_async(v11, block);

  }
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest");

}

uint64_t __60__SSVMediaContentTasteUpdateRequest_startWithResponseBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (NSArray)contentTasteItemUpdates
{
  return self->_contentTasteItemUpdates;
}

- (void)setContentTasteItemUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)shouldInvalidateLocalCache
{
  return self->_shouldInvalidateLocalCache;
}

- (void)setShouldInvalidateLocalCache:(BOOL)a3
{
  self->_shouldInvalidateLocalCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentTasteItemUpdates, 0);
}

@end
