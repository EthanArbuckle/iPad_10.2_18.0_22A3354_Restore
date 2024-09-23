@implementation SSAskPermissionActionRequest

- (SSAskPermissionActionRequest)initWithURL:(id)a3
{
  SSAskPermissionActionRequest *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSAskPermissionActionRequest;
  result = -[SSRequest init](&v5, sel_init);
  if (result)
    result->_url = (NSURL *)a3;
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
      v22 = "-[SSAskPermissionActionRequest startWithCompletionBlock:]";
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
  v20[2] = __57__SSAskPermissionActionRequest_startWithCompletionBlock___block_invoke;
  v20[3] = &unk_1E47B8EE0;
  v20[4] = self;
  v20[5] = a3;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 140, v20, v18);
}

uint64_t __57__SSAskPermissionActionRequest_startWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD v8[6];

  if (*(_QWORD *)(a1 + 40))
  {
    if (a2 == (void *)MEMORY[0x1E0C81258])
      v3 = (id)SSError((uint64_t)CFSTR("SSErrorDomain"), 121, 0, 0);
    else
      v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
    v4 = v3;
    global_queue = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__SSAskPermissionActionRequest_startWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E47B8EB8;
    v6 = *(_QWORD *)(a1 + 40);
    v8[4] = v4;
    v8[5] = v6;
    dispatch_async(global_queue, v8);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest");
}

uint64_t __57__SSAskPermissionActionRequest_startWithCompletionBlock___block_invoke_2(uint64_t a1)
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
  v6[2] = __47__SSAskPermissionActionRequest_copyXPCEncoding__block_invoke;
  v6[3] = &unk_1E47B8BB8;
  v6[4] = v3;
  v6[5] = self;
  dispatch_sync(dispatchQueue, v6);
  return v3;
}

void __47__SSAskPermissionActionRequest_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "1", (__CFString *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "absoluteString"));
}

- (SSAskPermissionActionRequest)initWithXPCEncoding:(id)a3
{
  SSAskPermissionActionRequest *v5;
  CFArrayRef v7;
  objc_super v8;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v8.receiver = self;
    v8.super_class = (Class)SSAskPermissionActionRequest;
    v5 = -[SSRequest init](&v8, sel_init);
    if (v5)
    {
      objc_opt_class();
      v7 = SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
      v5->_url = (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);

    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (NSURL)URL
{
  return self->_url;
}

@end
