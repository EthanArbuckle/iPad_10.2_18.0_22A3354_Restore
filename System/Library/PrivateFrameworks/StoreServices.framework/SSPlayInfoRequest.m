@implementation SSPlayInfoRequest

- (SSPlayInfoRequest)init
{
  return -[SSPlayInfoRequest initWithPlayInfoContext:](self, "initWithPlayInfoContext:", 0);
}

- (SSPlayInfoRequest)initWithPlayInfoContext:(id)a3
{
  SSPlayInfoRequest *v5;
  objc_super v7;

  if (!objc_msgSend(a3, "SICData"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Context must have SIC data"));
  v7.receiver = self;
  v7.super_class = (Class)SSPlayInfoRequest;
  v5 = -[SSRequest init](&v7, sel_init);
  if (v5)
    v5->_context = (SSPlayInfoRequestContext *)objc_msgSend(a3, "copy");
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSPlayInfoRequest;
  -[SSRequest dealloc](&v3, sel_dealloc);
}

- (SSPlayInfoRequestContext)playInfoContext
{
  return (SSPlayInfoRequestContext *)(id)-[SSPlayInfoRequestContext copy](self->_context, "copy");
}

- (SSPlayInfoResponse)playInfoResponse
{
  NSObject *dispatchQueue;
  SSPlayInfoResponse *v3;
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
  v9 = __Block_byref_object_copy__26;
  v10 = __Block_byref_object_dispose__26;
  v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__SSPlayInfoRequest_playInfoResponse__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SSPlayInfoResponse *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__SSPlayInfoRequest_playInfoResponse__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)startWithPlayInfoResponseBlock:(id)a3
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
      v22 = "-[SSPlayInfoRequest startWithPlayInfoResponseBlock:]";
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
  v20[2] = __52__SSPlayInfoRequest_startWithPlayInfoResponseBlock___block_invoke;
  v20[3] = &unk_1E47BC4B8;
  v20[4] = self;
  v20[5] = a3;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 58, v20, v18);
}

uint64_t __52__SSPlayInfoRequest_startWithPlayInfoResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  SSPlayInfoResponse *v5;
  NSObject *global_queue;
  uint64_t v7;
  _QWORD block[7];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 32));
  if (*(_QWORD *)(a1 + 40))
  {
    if (a2 == (void *)MEMORY[0x1E0C81258])
    {
      v4 = (id)SSError((uint64_t)CFSTR("SSErrorDomain"), 121, 0, 0);
      if (v4)
        goto LABEL_5;
    }
    else
    {
      v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
      v5 = -[SSPlayInfoResponse initWithXPCEncoding:]([SSPlayInfoResponse alloc], "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "1"));

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = -[SSPlayInfoResponse copy](v5, "copy");
      if (v5)
      {
LABEL_6:
        global_queue = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __52__SSPlayInfoRequest_startWithPlayInfoResponseBlock___block_invoke_2;
        block[3] = &unk_1E47B9E60;
        v7 = *(_QWORD *)(a1 + 40);
        block[5] = v4;
        block[6] = v7;
        block[4] = v5;
        dispatch_async(global_queue, block);

        return objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest");
      }
      if (v4)
      {
LABEL_5:

        v5 = 0;
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = -[SSPlayInfoResponse initWithPlayInfoData:error:]([SSPlayInfoResponse alloc], "initWithPlayInfoData:error:", 0, v4);
        goto LABEL_6;
      }
    }
    v4 = (id)SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
    goto LABEL_5;
  }
  return objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest");
}

uint64_t __52__SSPlayInfoRequest_startWithPlayInfoResponseBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)start
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __26__SSPlayInfoRequest_start__block_invoke;
  v3[3] = &unk_1E47BC4E0;
  v3[4] = self;
  -[SSPlayInfoRequest startWithPlayInfoResponseBlock:](self, "startWithPlayInfoResponseBlock:", v3);
  return 1;
}

void __26__SSPlayInfoRequest_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD block[7];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__SSPlayInfoRequest_start__block_invoke_2;
  block[3] = &unk_1E47B9E88;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = a2;
  block[6] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __26__SSPlayInfoRequest_start__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  uint64_t result;
  SSPlayInfoResponse *v6;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = *(_QWORD *)(a1 + 40);
  v4 = objc_opt_respondsToSelector();
  if (v3)
  {
    if ((v4 & 1) != 0)
      objc_msgSend(v2, "playInfoRequest:didReceiveResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(v2, "requestDidFinish:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if ((v4 & 1) != 0)
    {
      v6 = -[SSPlayInfoResponse initWithPlayInfoData:error:]([SSPlayInfoResponse alloc], "initWithPlayInfoData:error:", 0, *(_QWORD *)(a1 + 48));
      objc_msgSend(v2, "playInfoRequest:didReceiveResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
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
  v3[2] = __46__SSPlayInfoRequest_startWithCompletionBlock___block_invoke;
  v3[3] = &unk_1E47BC508;
  v3[4] = a3;
  -[SSPlayInfoRequest startWithPlayInfoResponseBlock:](self, "startWithPlayInfoResponseBlock:", v3);
}

uint64_t __46__SSPlayInfoRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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
  v6[2] = __36__SSPlayInfoRequest_copyXPCEncoding__block_invoke;
  v6[3] = &unk_1E47B8BB8;
  v6[4] = v3;
  v6[5] = self;
  dispatch_sync(dispatchQueue, v6);
  return v3;
}

void __36__SSPlayInfoRequest_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "50", *(__CFString **)(*(_QWORD *)(a1 + 40) + 96));
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "51", *(__CFString **)(*(_QWORD *)(a1 + 40) + 104));
}

- (SSPlayInfoRequest)initWithXPCEncoding:(id)a3
{
  SSPlayInfoRequest *v5;
  objc_super v7;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSPlayInfoRequest;
    v5 = -[SSRequest init](&v7, sel_init);
    if (v5)
    {
      v5->_context = -[SSPlayInfoRequestContext initWithXPCEncoding:]([SSPlayInfoRequestContext alloc], "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "50"));
      v5->_response = -[SSPlayInfoResponse initWithXPCEncoding:]([SSPlayInfoResponse alloc], "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "51"));
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

@end
