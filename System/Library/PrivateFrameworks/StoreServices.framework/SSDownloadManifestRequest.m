@implementation SSDownloadManifestRequest

- (SSDownloadManifestRequest)init
{
  return -[SSDownloadManifestRequest initWithURLRequest:](self, "initWithURLRequest:", 0);
}

- (SSDownloadManifestRequest)initWithURLRequest:(id)a3
{
  SSDownloadManifestRequest *v5;
  objc_super v7;

  if (!a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSDownloadManifestRequest.m"), 25, CFSTR("Must provide a URL request"));
  v7.receiver = self;
  v7.super_class = (Class)SSDownloadManifestRequest;
  v5 = -[SSRequest init](&v7, sel_init);
  if (v5)
    v5->_urlRequest = (NSURLRequest *)objc_msgSend(a3, "copy");
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSDownloadManifestRequest;
  -[SSRequest dealloc](&v3, sel_dealloc);
}

- (void)setShouldHideUserPrompts:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__SSDownloadManifestRequest_setShouldHideUserPrompts___block_invoke;
  v4[3] = &unk_1E47B9C78;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __54__SSDownloadManifestRequest_setShouldHideUserPrompts___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 104) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)shouldHideUserPrompts
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__SSDownloadManifestRequest_shouldHideUserPrompts__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__SSDownloadManifestRequest_shouldHideUserPrompts__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 104);
  return result;
}

- (void)startWithManifestResponseBlock:(id)a3
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
      v22 = "-[SSDownloadManifestRequest startWithManifestResponseBlock:]";
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
  v20[2] = __60__SSDownloadManifestRequest_startWithManifestResponseBlock___block_invoke;
  v20[3] = &unk_1E47B8EE0;
  v20[4] = self;
  v20[5] = a3;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 56, v20, v18);
}

uint64_t __60__SSDownloadManifestRequest_startWithManifestResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  unint64_t v5;
  NSObject *global_queue;
  uint64_t v7;
  _QWORD block[7];

  if (*(_QWORD *)(a1 + 40))
  {
    if (a2 == (void *)MEMORY[0x1E0C81258])
    {
      v4 = (uint64_t)(id)SSError((uint64_t)CFSTR("SSErrorDomain"), 121, 0, 0);
      v5 = 0;
    }
    else
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
      v5 = -[SSDownloadManifestResponse initWithXPCEncoding:]([SSDownloadManifestResponse alloc], "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "1"));
    }
    if (!(v5 | v4))
      v4 = (uint64_t)(id)SSError((uint64_t)CFSTR("SSErrorDomain"), 200, 0, 0);
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__SSDownloadManifestRequest_startWithManifestResponseBlock___block_invoke_2;
    block[3] = &unk_1E47B9E60;
    v7 = *(_QWORD *)(a1 + 40);
    block[5] = v4;
    block[6] = v7;
    block[4] = v5;
    dispatch_async(global_queue, block);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest");
}

uint64_t __60__SSDownloadManifestRequest_startWithManifestResponseBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (NSURLRequest)URLRequest
{
  return self->_urlRequest;
}

- (int64_t)manifestFormat
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
  v5[2] = __43__SSDownloadManifestRequest_manifestFormat__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__SSDownloadManifestRequest_manifestFormat__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 96);
  return result;
}

- (void)setManifestFormat:(int64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SSDownloadManifestRequest_setManifestFormat___block_invoke;
  v4[3] = &unk_1E47B9CA0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __47__SSDownloadManifestRequest_setManifestFormat___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 96) = *(_QWORD *)(result + 40);
  return result;
}

- (BOOL)start
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__SSDownloadManifestRequest_start__block_invoke;
  v3[3] = &unk_1E47B9EB0;
  v3[4] = self;
  -[SSDownloadManifestRequest startWithManifestResponseBlock:](self, "startWithManifestResponseBlock:", v3);
  return 1;
}

void __34__SSDownloadManifestRequest_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD block[7];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SSDownloadManifestRequest_start__block_invoke_2;
  block[3] = &unk_1E47B9E88;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = a2;
  block[6] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __34__SSDownloadManifestRequest_start__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
  if (*(_QWORD *)(a1 + 40))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "downloadManifestRequest:didReceiveResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(v2, "requestDidFinish:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(v2, "request:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  return result;
}

- (void)startWithCompletionBlock:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__SSDownloadManifestRequest_startWithCompletionBlock___block_invoke;
  v3[3] = &unk_1E47B9ED8;
  v3[4] = a3;
  -[SSDownloadManifestRequest startWithManifestResponseBlock:](self, "startWithManifestResponseBlock:", v3);
}

uint64_t __54__SSDownloadManifestRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
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
  v6[2] = __44__SSDownloadManifestRequest_copyXPCEncoding__block_invoke;
  v6[3] = &unk_1E47B8BB8;
  v6[4] = v3;
  v6[5] = self;
  dispatch_sync(dispatchQueue, v6);
  return v3;
}

void __44__SSDownloadManifestRequest_copyXPCEncoding__block_invoke(uint64_t a1)
{
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "50", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 104));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "51", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "52", *(__CFString **)(*(_QWORD *)(a1 + 40) + 112));
}

- (SSDownloadManifestRequest)initWithXPCEncoding:(id)a3
{
  SSDownloadManifestRequest *v5;
  objc_super v7;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSDownloadManifestRequest;
    v5 = -[SSRequest init](&v7, sel_init);
    if (v5)
    {
      v5->_shouldHideUserPrompts = xpc_dictionary_get_BOOL(a3, "50");
      v5->_manifestFormat = xpc_dictionary_get_int64(a3, "51");
      v5->_urlRequest = (NSURLRequest *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39E0]), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "52"));
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

@end
