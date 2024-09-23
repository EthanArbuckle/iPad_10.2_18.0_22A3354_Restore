@implementation SSRemoteWebViewRequest

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
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v21 = 136446210;
      v22 = "-[SSRemoteWebViewRequest startWithCompletionBlock:]";
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
  v19[2] = __51__SSRemoteWebViewRequest_startWithCompletionBlock___block_invoke;
  v19[3] = &unk_1E47B8630;
  v19[4] = self;
  v20 = v4;
  v17 = v4;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 209, v19);

}

void __51__SSRemoteWebViewRequest_startWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
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
    v13 = __51__SSRemoteWebViewRequest_startWithCompletionBlock___block_invoke_2;
    v14 = &unk_1E47B8A98;
    v9 = *(id *)(a1 + 40);
    v15 = v7;
    v16 = v9;
    v10 = v7;
    dispatch_async(v8, &v11);

  }
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest", v11, v12, v13, v14);

}

uint64_t __51__SSRemoteWebViewRequest_startWithCompletionBlock___block_invoke_2(uint64_t a1)
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
  SSRemoteWebViewRequest *v10;

  v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->super._dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__SSRemoteWebViewRequest_copyXPCEncoding__block_invoke;
  v8[3] = &unk_1E47B8768;
  v5 = v3;
  v9 = v5;
  v10 = self;
  dispatch_sync(dispatchQueue, v8);
  v6 = v5;

  return v6;
}

uint64_t __41__SSRemoteWebViewRequest_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "1", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));
  return SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "0", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104));
}

- (SSRemoteWebViewRequest)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSRemoteWebViewRequest *v6;
  uint64_t v8;
  uint64_t v9;
  NSString *referrer;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v6 = -[SSRequest init](self, "init");
    if (!v6)
      goto LABEL_5;
    v8 = objc_opt_class();
    v9 = SSXPCDictionaryCopyObjectWithClass(v5, "1", v8);
    referrer = v6->_referrer;
    v6->_referrer = (NSString *)v9;

    v11 = objc_opt_class();
    v12 = SSXPCDictionaryCopyObjectWithClass(v5, "0", v11);
    self = (SSRemoteWebViewRequest *)v6->_URLString;
    v6->_URLString = (NSString *)v12;
  }
  else
  {
    v6 = 0;
  }

LABEL_5:
  return v6;
}

- (NSString)referrer
{
  return self->_referrer;
}

- (void)setReferrer:(id)a3
{
  objc_storeStrong((id *)&self->_referrer, a3);
}

- (NSString)URLString
{
  return self->_URLString;
}

- (void)setURLString:(id)a3
{
  objc_storeStrong((id *)&self->_URLString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLString, 0);
  objc_storeStrong((id *)&self->_referrer, 0);
}

@end
