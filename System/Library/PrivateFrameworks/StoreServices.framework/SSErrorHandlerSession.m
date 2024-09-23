@implementation SSErrorHandlerSession

- (SSErrorHandlerSession)init
{
  SSErrorHandlerSession *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSErrorHandlerSession;
  v2 = -[SSErrorHandlerSession init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.StoreServices.SSErrorHandlerSession.%p"), v2);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);

  }
  return v2;
}

- (void)dealloc
{
  NSObject *dispatchQueue;
  objc_super v4;

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);

  v4.receiver = self;
  v4.super_class = (Class)SSErrorHandlerSession;
  -[SSErrorHandlerSession dealloc](&v4, sel_dealloc);
}

- (void)performDefaultHandling
{
  id v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *dispatchQueue;
  uint64_t v17;
  _QWORD block[5];
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v3 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v3)
      v3 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_FAULT))
      v6 = v5;
    else
      v6 = v5 & 2;
    if (v6)
    {
      v19 = 136446210;
      v20 = "-[SSErrorHandlerSession performDefaultHandling]";
      LODWORD(v17) = 12;
      v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v19, v17);
        free(v8);
        SSFileLog(v3, CFSTR("%@"), v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SSErrorHandlerSession_performDefaultHandling__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __47__SSErrorHandlerSession_performDefaultHandling__block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = SSXPCCreateMessageDictionary(97);
  xpc_dictionary_set_int64(v2, "1", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  xpc_dictionary_set_int64(v2, "2", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sendMessage:", v2);
  xpc_release(v2);
}

- (void)redirectToURL:(id)a3
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
  NSObject *dispatchQueue;
  uint64_t v19;
  _QWORD block[6];
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
      v22 = "-[SSErrorHandlerSession redirectToURL:]";
      LODWORD(v19) = 12;
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
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SSErrorHandlerSession_redirectToURL___block_invoke;
  block[3] = &unk_1E47B8BB8;
  block[4] = self;
  block[5] = a3;
  dispatch_async(dispatchQueue, block);
}

void __39__SSErrorHandlerSession_redirectToURL___block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = SSXPCCreateMessageDictionary(97);
  xpc_dictionary_set_int64(v2, "1", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  xpc_dictionary_set_int64(v2, "2", 1);
  SSXPCDictionarySetCFObject(v2, "3", *(__CFString **)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sendMessage:", v2);
  xpc_release(v2);
}

- (void)retry
{
  id v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *dispatchQueue;
  uint64_t v17;
  _QWORD block[5];
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v3 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v3)
      v3 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_FAULT))
      v6 = v5;
    else
      v6 = v5 & 2;
    if (v6)
    {
      v19 = 136446210;
      v20 = "-[SSErrorHandlerSession retry]";
      LODWORD(v17) = 12;
      v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v19, v17);
        free(v8);
        SSFileLog(v3, CFSTR("%@"), v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__SSErrorHandlerSession_retry__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __30__SSErrorHandlerSession_retry__block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = SSXPCCreateMessageDictionary(97);
  xpc_dictionary_set_int64(v2, "1", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  xpc_dictionary_set_int64(v2, "2", 2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sendMessage:", v2);
  xpc_release(v2);
}

- (id)valueForProperty:(id)a3
{
  NSObject *dispatchQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__54;
  v11 = __Block_byref_object_dispose__54;
  v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SSErrorHandlerSession_valueForProperty___block_invoke;
  block[3] = &unk_1E47BA7E8;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __42__SSErrorHandlerSession_valueForProperty___block_invoke(_QWORD *a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

- (void)_setControlConnection:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SSErrorHandlerSession__setControlConnection___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

_QWORD *__47__SSErrorHandlerSession__setControlConnection___block_invoke(_QWORD *result)
{
  void *v1;
  _QWORD *v2;

  v1 = *(void **)(result[4] + 8);
  if (v1 != (void *)result[5])
  {
    v2 = result;

    result = (id)v2[5];
    *(_QWORD *)(v2[4] + 8) = result;
  }
  return result;
}

- (void)_setErrorProperties:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__SSErrorHandlerSession__setErrorProperties___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __45__SSErrorHandlerSession__setErrorProperties___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(result + 32) + 24);
  if (v1 != *(void **)(result + 40))
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 40), "copy");
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 24) = result;
  }
  return result;
}

- (void)_setSessionID:(int64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__SSErrorHandlerSession__setSessionID___block_invoke;
  v4[3] = &unk_1E47B9CA0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __39__SSErrorHandlerSession__setSessionID___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 32) = *(_QWORD *)(result + 40);
  return result;
}

@end
