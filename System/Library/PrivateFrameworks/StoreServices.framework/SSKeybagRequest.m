@implementation SSKeybagRequest

- (SSKeybagRequest)initWithAccountIdentifier:(id)a3
{
  SSKeybagRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSKeybagRequest;
  v4 = -[SSRequest init](&v6, sel_init);
  if (v4)
    v4->_accountID = (NSNumber *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSKeybagRequest;
  -[SSRequest dealloc](&v3, sel_dealloc);
}

- (id)accountIdentifier
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__45;
  v10 = __Block_byref_object_dispose__45;
  v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__SSKeybagRequest_accountIdentifier__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __36__SSKeybagRequest_accountIdentifier__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 96);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)contentIdentifier
{
  NSObject *dispatchQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__45;
  v10 = __Block_byref_object_dispose__45;
  v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__SSKeybagRequest_contentIdentifier__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__SSKeybagRequest_contentIdentifier__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (int64_t)keybagOptions
{
  NSObject *dispatchQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__SSKeybagRequest_keybagOptions__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__SSKeybagRequest_keybagOptions__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 112);
  return result;
}

- (void)setContentIdentifier:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__SSKeybagRequest_setContentIdentifier___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

void *__40__SSKeybagRequest_setContentIdentifier___block_invoke(uint64_t a1)
{
  void *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 104) != result)
  {
    result = (void *)objc_msgSend(result, "copy");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = result;
  }
  return result;
}

- (void)setKeybagOptions:(int64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__SSKeybagRequest_setKeybagOptions___block_invoke;
  v4[3] = &unk_1E47B9CA0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __36__SSKeybagRequest_setKeybagOptions___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 112) = *(_QWORD *)(result + 40);
  return result;
}

- (void)startWithCompletionBlock:(id)a3
{
  id v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  _QWORD v20[6];
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v5 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v5)
      v5 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_FAULT))
      v8 = v7;
    else
      v8 = v7 & 2;
    if (v8)
    {
      v21 = 136446210;
      v22 = "-[SSKeybagRequest startWithCompletionBlock:]";
      LODWORD(v19) = 12;
      v18 = &v21;
      v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v21, v19);
        free(v10);
        SSFileLog(v5, CFSTR("%@"), v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __44__SSKeybagRequest_startWithCompletionBlock___block_invoke;
  v20[3] = &unk_1E47B8EE0;
  v20[4] = self;
  v20[5] = a3;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 86, v20, v18);
}

uint64_t __44__SSKeybagRequest_startWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD v8[6];

  if (*(_QWORD *)(a1 + 40))
  {
    if (a2 == (void *)MEMORY[0x1E0C81258])
    {
      v4 = (id)SSError((uint64_t)CFSTR("SSErrorDomain"), 121, 0, 0);
    }
    else
    {
      v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
      if (xpc_dictionary_get_BOOL(a2, "1"))
      {
LABEL_8:
        global_queue = dispatch_get_global_queue(0, 0);
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __44__SSKeybagRequest_startWithCompletionBlock___block_invoke_2;
        v8[3] = &unk_1E47B8EB8;
        v6 = *(_QWORD *)(a1 + 40);
        v8[4] = v4;
        v8[5] = v6;
        dispatch_async(global_queue, v8);

        return objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest");
      }
    }
    if (!v4)
      v4 = (id)SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
    goto LABEL_8;
  }
  return objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest");
}

uint64_t __44__SSKeybagRequest_startWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  NSObject *dispatchQueue;
  _QWORD v6[6];

  v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->super._dispatchQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__SSKeybagRequest_copyXPCEncoding__block_invoke;
  v6[3] = &unk_1E47B8BB8;
  v6[4] = v3;
  v6[5] = self;
  dispatch_sync(dispatchQueue, v6);
  return v3;
}

void __34__SSKeybagRequest_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "50", *(__CFString **)(*(_QWORD *)(a1 + 40) + 96));
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "52", *(__CFString **)(*(_QWORD *)(a1 + 40) + 104));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "51", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112));
}

- (SSKeybagRequest)initWithXPCEncoding:(id)a3
{
  SSKeybagRequest *v5;
  objc_super v7;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSKeybagRequest;
    v5 = -[SSRequest init](&v7, sel_init);
    if (v5)
    {
      objc_opt_class();
      v5->_accountID = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass(a3, "50");
      objc_opt_class();
      v5->_contentIdentifier = SSXPCDictionaryCopyCFObjectWithClass(a3, "52");
      v5->_options = xpc_dictionary_get_int64(a3, "51");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (NSNumber)accountID
{
  return self->_accountID;
}

@end
