@implementation SSVCloudServiceAPITokenRequest

- (SSVCloudServiceAPITokenRequest)initWithClientToken:(id)a3
{
  id v4;
  SSVCloudServiceAPITokenRequest *v5;
  uint64_t v6;
  NSString *clientToken;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSVCloudServiceAPITokenRequest;
  v5 = -[SSRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    clientToken = v5->_clientToken;
    v5->_clientToken = (NSString *)v6;

  }
  return v5;
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
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v21 = 136446210;
      v22 = "-[SSVCloudServiceAPITokenRequest startWithResponseBlock:]";
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
  v19[2] = __57__SSVCloudServiceAPITokenRequest_startWithResponseBlock___block_invoke;
  v19[3] = &unk_1E47B8630;
  v19[4] = self;
  v20 = v4;
  v17 = v4;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 191, v19);

}

void __57__SSVCloudServiceAPITokenRequest_startWithResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  SSVCloudServiceAPITokenResponse *v7;
  NSObject *v8;
  id v9;
  id v10;
  SSVCloudServiceAPITokenResponse *v11;
  id v12;
  void *v13;
  SSVCloudServiceAPITokenResponse *v14;
  void *v15;
  _QWORD block[4];
  SSVCloudServiceAPITokenResponse *v17;
  id v18;
  id v19;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E0C81258])
    {
      v5 = 121;
    }
    else
    {
      if (v3 && MEMORY[0x1A85863E4](v3) == MEMORY[0x1E0C812F8])
      {
        v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
        xpc_dictionary_get_value(v4, "2");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)objc_msgSend(v12, "initWithXPCEncoding:", v13);

        v14 = [SSVCloudServiceAPITokenResponse alloc];
        xpc_dictionary_get_value(v4, "3");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[SSVCloudServiceAPITokenResponse initWithXPCEncoding:](v14, "initWithXPCEncoding:", v15);

        goto LABEL_8;
      }
      v5 = 111;
    }
    SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
LABEL_8:
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__SSVCloudServiceAPITokenRequest_startWithResponseBlock___block_invoke_2;
    block[3] = &unk_1E47B8608;
    v9 = *(id *)(a1 + 40);
    v18 = v6;
    v19 = v9;
    v17 = v7;
    v10 = v6;
    v11 = v7;
    dispatch_async(v8, block);

  }
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest");

}

uint64_t __57__SSVCloudServiceAPITokenRequest_startWithResponseBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (SSVCloudServiceAPITokenRequest)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSVCloudServiceAPITokenRequest *v6;
  CFArrayRef v8;
  NSString *clientToken;
  objc_super v10;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v10.receiver = self;
    v10.super_class = (Class)SSVCloudServiceAPITokenRequest;
    v6 = -[SSRequest init](&v10, sel_init);
    if (v6)
    {
      objc_opt_class();
      v8 = SSXPCDictionaryCopyCFObjectWithClass(v5, "0");
      clientToken = v6->_clientToken;
      v6->_clientToken = (NSString *)v8;

    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_clientToken);
  return v3;
}

- (NSString)clientToken
{
  return self->_clientToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientToken, 0);
}

@end
