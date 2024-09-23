@implementation SSURLConnectionRequest

- (SSURLConnectionRequest)init
{
  return -[SSURLConnectionRequest initWithURLRequest:](self, "initWithURLRequest:", 0);
}

- (SSURLConnectionRequest)initWithRequestProperties:(id)a3
{
  SSURLConnectionRequest *v5;
  objc_super v7;

  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("properties must not be nil"));
  v7.receiver = self;
  v7.super_class = (Class)SSURLConnectionRequest;
  v5 = -[SSRequest init](&v7, sel_init);
  if (v5)
    v5->_requestProperties = (SSURLRequestProperties *)objc_msgSend(a3, "copy");
  return v5;
}

- (SSURLConnectionRequest)initWithURLRequest:(id)a3
{
  SSURLRequestProperties *v5;
  SSURLConnectionRequest *v6;

  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("URLRequest must not be nil"));
  v5 = -[SSURLRequestProperties initWithURLRequest:]([SSURLRequestProperties alloc], "initWithURLRequest:", a3);
  v6 = -[SSURLConnectionRequest initWithRequestProperties:](self, "initWithRequestProperties:", v5);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSURLConnectionRequest;
  -[SSRequest dealloc](&v3, sel_dealloc);
}

- (NSURL)destinationFileURL
{
  NSObject *dispatchQueue;
  NSURL *v3;
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
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__SSURLConnectionRequest_destinationFileURL__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSURL *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__SSURLConnectionRequest_destinationFileURL__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (SSURLRequestProperties)requestProperties
{
  return self->_requestProperties;
}

- (void)setDestinationFileURL:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__SSURLConnectionRequest_setDestinationFileURL___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __48__SSURLConnectionRequest_setDestinationFileURL___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(result + 32) + 120);
  if (v1 != *(void **)(result + 40))
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 40), "copy");
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 120) = result;
  }
  return result;
}

- (void)setShouldMescalSign:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__SSURLConnectionRequest_setShouldMescalSign___block_invoke;
  v4[3] = &unk_1E47B9C78;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __46__SSURLConnectionRequest_setShouldMescalSign___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 153) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)shouldMescalSign
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
  v5[2] = __42__SSURLConnectionRequest_shouldMescalSign__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__SSURLConnectionRequest_shouldMescalSign__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 153);
  return result;
}

- (void)startWithConnectionResponseBlock:(id)a3
{
  SSVLoadURLOperation *v5;
  SSVURLDataConsumer *v6;
  NSObject *dispatchQueue;
  uint64_t v8;
  NSObject *global_queue;
  id v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  _QWORD v25[6];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD block[6];
  int v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (-[SSURLConnectionRequest _canRunInProcess](self, "_canRunInProcess"))
  {
    v5 = -[SSVLoadURLOperation initWithURLRequestProperties:]([SSVLoadURLOperation alloc], "initWithURLRequestProperties:", self->_requestProperties);
    v6 = -[SSURLConnectionRequest dataConsumer](self, "dataConsumer");
    if (!v6)
      v6 = +[SSVURLDataConsumer consumer](SSVURLConnectionConsumer, "consumer");
    -[SSVLoadURLOperation setDataConsumer:](v5, "setDataConsumer:", v6);
    dispatchQueue = self->super._dispatchQueue;
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__SSURLConnectionRequest_startWithConnectionResponseBlock___block_invoke;
    block[3] = &unk_1E47B8BB8;
    block[4] = self;
    block[5] = v5;
    dispatch_sync(dispatchQueue, block);
    if (a3)
    {
      v27[0] = v8;
      v27[1] = 3221225472;
      v27[2] = __59__SSURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_2;
      v27[3] = &unk_1E47BA798;
      v27[4] = a3;
      -[SSVLoadURLOperation setOutputBlock:](v5, "setOutputBlock:", v27);
    }
    global_queue = dispatch_get_global_queue(0, 0);
    v26[0] = v8;
    v26[1] = 3221225472;
    v26[2] = __59__SSURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_3;
    v26[3] = &unk_1E47B8B68;
    v26[4] = v5;
    dispatch_async(global_queue, v26);
  }
  else
  {
    if (SSIsInternalBuild() && _os_feature_enabled_impl())
    {
      v10 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v10)
        v10 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v11 = objc_msgSend(v10, "shouldLog");
      if (objc_msgSend(v10, "shouldLogToDisk"))
        v12 = v11 | 2;
      else
        v12 = v11;
      if (os_log_type_enabled((os_log_t)objc_msgSend(v10, "OSLogObject"), OS_LOG_TYPE_DEBUG))
        v13 = v12;
      else
        v13 = v12 & 2;
      if (v13)
      {
        v29 = 136446210;
        v30 = "-[SSURLConnectionRequest startWithConnectionResponseBlock:]";
        LODWORD(v24) = 12;
        v23 = &v29;
        v14 = _os_log_send_and_compose_impl();
        if (v14)
        {
          v15 = (void *)v14;
          v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, &v29, v24);
          free(v15);
          SSFileLog(v10, CFSTR("%@"), v17, v18, v19, v20, v21, v22, v16);
        }
      }
    }
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __59__SSURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_20;
    v25[3] = &unk_1E47B8EE0;
    v25[4] = self;
    v25[5] = a3;
    -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 62, v25, v23);
  }
}

uint64_t __59__SSURLConnectionRequest_startWithConnectionResponseBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 168))
  {
    objc_msgSend(*(id *)(a1 + 40), "_configureWithURLBagInterpreter:");
  }
  else if (*(_QWORD *)(v2 + 160))
  {
    objc_msgSend(*(id *)(a1 + 40), "configureWithURLBag:");
  }
  objc_msgSend(*(id *)(a1 + 40), "setSAPSession:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
  return objc_msgSend(*(id *)(a1 + 40), "setSAPSignaturePolicy:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
}

uint64_t __59__SSURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__SSURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "main");

}

uint64_t __59__SSURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_20(uint64_t a1, void *a2)
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
      v5 = -[SSURLConnectionResponse initWithXPCEncoding:]([SSURLConnectionResponse alloc], "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "1"));
    }
    if (!(v5 | v4))
      v4 = (uint64_t)(id)SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__SSURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_2_25;
    block[3] = &unk_1E47B9E60;
    v7 = *(_QWORD *)(a1 + 40);
    block[5] = v4;
    block[6] = v7;
    block[4] = v5;
    dispatch_async(global_queue, block);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest");
}

uint64_t __59__SSURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_2_25(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (NSURLRequest)URLRequest
{
  return (NSURLRequest *)-[SSURLRequestProperties copyURLRequest](self->_requestProperties, "copyURLRequest");
}

- (BOOL)start
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__SSURLConnectionRequest_start__block_invoke;
  v3[3] = &unk_1E47BA7C0;
  v3[4] = self;
  -[SSURLConnectionRequest startWithConnectionResponseBlock:](self, "startWithConnectionResponseBlock:", v3);
  return 1;
}

void __31__SSURLConnectionRequest_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD block[7];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SSURLConnectionRequest_start__block_invoke_2;
  block[3] = &unk_1E47B9E88;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = a2;
  block[6] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __31__SSURLConnectionRequest_start__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
  if (*(_QWORD *)(a1 + 40))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "urlConnectionRequest:didReceiveResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
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
  v3[2] = __51__SSURLConnectionRequest_startWithCompletionBlock___block_invoke;
  v3[3] = &unk_1E47BA798;
  v3[4] = a3;
  -[SSURLConnectionRequest startWithConnectionResponseBlock:](self, "startWithConnectionResponseBlock:", v3);
}

uint64_t __51__SSURLConnectionRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (SSAuthenticationContext)authenticationContext
{
  NSObject *dispatchQueue;
  SSAuthenticationContext *v3;
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
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__SSURLConnectionRequest_authenticationContext__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SSAuthenticationContext *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __47__SSURLConnectionRequest_authenticationContext__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 104);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)configureWithURLBag:(id)a3
{
  SSURLBag *urlBag;

  urlBag = self->_urlBag;
  if (urlBag != a3)
  {

    self->_urlBag = (SSURLBag *)a3;
  }
}

- (void)configureWithURLBagDictionary:(id)a3
{

  self->_urlBagInterpreter = -[SSVURLBagInterpreter initWithURLBagDictionary:]([SSVURLBagInterpreter alloc], "initWithURLBagDictionary:", a3);
}

- (SSVURLDataConsumer)dataConsumer
{
  NSObject *dispatchQueue;
  SSVURLDataConsumer *v3;
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
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__SSURLConnectionRequest_dataConsumer__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SSVURLDataConsumer *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __38__SSURLConnectionRequest_dataConsumer__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 112);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)runsInProcess
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
  v5[2] = __39__SSURLConnectionRequest_runsInProcess__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__SSURLConnectionRequest_runsInProcess__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 128);
  return result;
}

- (SSVFairPlaySAPSession)SAPSession
{
  NSObject *dispatchQueue;
  SSVFairPlaySAPSession *v3;
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
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__SSURLConnectionRequest_SAPSession__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SSVFairPlaySAPSession *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __36__SSURLConnectionRequest_SAPSession__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 136);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (SSVSAPSignaturePolicy)SAPSignaturePolicy
{
  NSObject *dispatchQueue;
  SSVSAPSignaturePolicy *v3;
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
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__SSURLConnectionRequest_SAPSignaturePolicy__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SSVSAPSignaturePolicy *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__SSURLConnectionRequest_SAPSignaturePolicy__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)sendsResponseForHTTPFailures
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
  v5[2] = __54__SSURLConnectionRequest_sendsResponseForHTTPFailures__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__SSURLConnectionRequest_sendsResponseForHTTPFailures__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 152);
  return result;
}

- (void)setAuthenticationContext:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__SSURLConnectionRequest_setAuthenticationContext___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __51__SSURLConnectionRequest_setAuthenticationContext___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(result + 32) + 104);
  if (v1 != *(void **)(result + 40))
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 40), "copy");
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 104) = result;
  }
  return result;
}

- (void)setDataConsumer:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__SSURLConnectionRequest_setDataConsumer___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

_QWORD *__42__SSURLConnectionRequest_setDataConsumer___block_invoke(_QWORD *result)
{
  void *v1;
  _QWORD *v2;

  v1 = *(void **)(result[4] + 112);
  if (v1 != (void *)result[5])
  {
    v2 = result;

    result = (id)v2[5];
    *(_QWORD *)(v2[4] + 112) = result;
  }
  return result;
}

- (void)setRunsInProcess:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__SSURLConnectionRequest_setRunsInProcess___block_invoke;
  v4[3] = &unk_1E47B9C78;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __43__SSURLConnectionRequest_setRunsInProcess___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 128) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setSAPSession:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__SSURLConnectionRequest_setSAPSession___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

_QWORD *__40__SSURLConnectionRequest_setSAPSession___block_invoke(_QWORD *result)
{
  void *v1;
  _QWORD *v2;

  v1 = *(void **)(result[4] + 136);
  if (v1 != (void *)result[5])
  {
    v2 = result;

    result = (id)v2[5];
    *(_QWORD *)(v2[4] + 136) = result;
  }
  return result;
}

- (void)setSAPSignaturePolicy:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__SSURLConnectionRequest_setSAPSignaturePolicy___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __48__SSURLConnectionRequest_setSAPSignaturePolicy___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(result + 32) + 144);
  if (v1 != *(void **)(result + 40))
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 40), "copy");
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 144) = result;
  }
  return result;
}

- (void)setSendsResponseForHTTPFailures:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__SSURLConnectionRequest_setSendsResponseForHTTPFailures___block_invoke;
  v4[3] = &unk_1E47B9C78;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __58__SSURLConnectionRequest_setSendsResponseForHTTPFailures___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 152) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)_canRunInProcess
{
  _BOOL4 v3;

  v3 = -[SSURLConnectionRequest runsInProcess](self, "runsInProcess");
  if (v3)
    LOBYTE(v3) = -[SSURLRequestProperties URL](self->_requestProperties, "URL") != 0;
  return v3;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "50", (__CFString *)-[SSURLConnectionRequest authenticationContext](self, "authenticationContext"));
  SSXPCDictionarySetCFObject(v3, "54", (__CFString *)-[NSURL absoluteString](-[SSURLConnectionRequest destinationFileURL](self, "destinationFileURL"), "absoluteString"));
  SSXPCDictionarySetCFObject(v3, "51", (__CFString *)self->_requestProperties);
  xpc_dictionary_set_BOOL(v3, "53", -[SSURLConnectionRequest sendsResponseForHTTPFailures](self, "sendsResponseForHTTPFailures"));
  xpc_dictionary_set_BOOL(v3, "52", -[SSURLConnectionRequest shouldMescalSign](self, "shouldMescalSign"));
  return v3;
}

- (SSURLConnectionRequest)initWithXPCEncoding:(id)a3
{
  SSURLConnectionRequest *v5;
  SSURLConnectionRequest *v7;
  CFArrayRef v8;
  uint64_t v9;
  objc_super v10;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v10.receiver = self;
    v10.super_class = (Class)SSURLConnectionRequest;
    v7 = -[SSRequest init](&v10, sel_init);
    v5 = v7;
    if (v7)
    {

      v5->_authenticationContext = -[SSAuthenticationContext initWithXPCEncoding:]([SSAuthenticationContext alloc], "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "50"));
      objc_opt_class();
      v8 = SSXPCDictionaryCopyCFObjectWithClass(a3, "54");

      if (v8)
        v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v8);
      else
        v9 = 0;
      v5->_destinationFileURL = (NSURL *)v9;

      v5->_requestProperties = -[SSURLRequestProperties initWithXPCEncoding:]([SSURLRequestProperties alloc], "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "51"));
      -[SSURLConnectionRequest setSendsResponseForHTTPFailures:](v5, "setSendsResponseForHTTPFailures:", xpc_dictionary_get_BOOL(a3, "53"));
      -[SSURLConnectionRequest setShouldMescalSign:](v5, "setShouldMescalSign:", xpc_dictionary_get_BOOL(a3, "52"));
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

@end
