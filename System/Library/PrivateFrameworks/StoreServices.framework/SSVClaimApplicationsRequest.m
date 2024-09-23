@implementation SSVClaimApplicationsRequest

- (SSVClaimApplicationsRequest)initWithClaimStyle:(int64_t)a3
{
  SSVClaimApplicationsRequest *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSVClaimApplicationsRequest;
  result = -[SSRequest init](&v5, sel_init);
  if (result)
    result->_claimStyle = a3;
  return result;
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
      v22 = "-[SSVClaimApplicationsRequest startWithResponseBlock:]";
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
  v19[2] = __54__SSVClaimApplicationsRequest_startWithResponseBlock___block_invoke;
  v19[3] = &unk_1E47B8630;
  v19[4] = self;
  v20 = v4;
  v17 = v4;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 138, v19);

}

void __54__SSVClaimApplicationsRequest_startWithResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  CFArrayRef v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  id v11;
  id v12;
  const __CFArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  CFArrayRef v18;
  id v19;
  id v20;
  BOOL v21;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E0C81258])
    {
      SSError((uint64_t)CFSTR("SSErrorDomain"), 121, 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 0;
      v9 = 0;
    }
    else
    {
      objc_opt_class();
      v5 = SSXPCDictionaryCopyCFObjectWithClass(v4, "3");
      v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
      xpc_dictionary_get_value(v4, "2");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithXPCEncoding:", v7);

      v9 = xpc_dictionary_get_BOOL(v4, "1");
      if (v9)
      {
LABEL_8:
        dispatch_get_global_queue(0, 0);
        v10 = objc_claimAutoreleasedReturnValue();
        v14 = MEMORY[0x1E0C809B0];
        v15 = 3221225472;
        v16 = __54__SSVClaimApplicationsRequest_startWithResponseBlock___block_invoke_2;
        v17 = &unk_1E47B9800;
        v11 = *(id *)(a1 + 40);
        v19 = v8;
        v20 = v11;
        v21 = v9;
        v18 = v5;
        v12 = v8;
        v13 = v5;
        dispatch_async(v10, &v14);

        goto LABEL_9;
      }
    }
    if (!v8)
    {
      SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest", v14, v15, v16, v17);

}

uint64_t __54__SSVClaimApplicationsRequest_startWithResponseBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (SSVClaimApplicationsRequest)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSVClaimApplicationsRequest *v6;
  objc_super v8;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v8.receiver = self;
    v8.super_class = (Class)SSVClaimApplicationsRequest;
    v6 = -[SSRequest init](&v8, sel_init);
    if (v6)
      v6->_claimStyle = xpc_dictionary_get_int64(v5, "0");
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
  xpc_dictionary_set_int64(v3, "0", self->_claimStyle);
  return v3;
}

- (int64_t)claimStyle
{
  return self->_claimStyle;
}

@end
