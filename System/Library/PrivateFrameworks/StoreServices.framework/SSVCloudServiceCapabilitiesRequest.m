@implementation SSVCloudServiceCapabilitiesRequest

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
  void *v17;
  int v18;
  int v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  int *v34;
  uint64_t v35;
  _QWORD v36[5];
  id v37;
  int v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
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
      v38 = 136446210;
      v39 = "-[SSVCloudServiceCapabilitiesRequest startWithResponseBlock:]";
      LODWORD(v35) = 12;
      v34 = &v38;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v38, v35);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig", v34);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = objc_msgSend(v17, "shouldLog");
  if (objc_msgSend(v17, "shouldLogToDisk"))
    v19 = v18 | 2;
  else
    v19 = v18;
  objc_msgSend(v17, "OSLogObject");
  v20 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    v19 &= 2u;
  if (!v19)
    goto LABEL_26;
  v21 = (void *)objc_opt_class();
  v22 = *((unsigned __int8 *)&self->super._usesTaskCompletionAssertions + 1);
  v23 = (void *)MEMORY[0x1E0CB3978];
  v24 = v21;
  objc_msgSend(v23, "callStackSymbols");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 138543874;
  v39 = (const char *)v21;
  v40 = 1024;
  v41 = v22;
  v42 = 2114;
  v43 = v25;
  LODWORD(v35) = 28;
  v26 = (void *)_os_log_send_and_compose_impl();

  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v26, 4, &v38, v35);
    v20 = objc_claimAutoreleasedReturnValue();
    free(v26);
    SSFileLog(v17, CFSTR("%@"), v27, v28, v29, v30, v31, v32, (uint64_t)v20);
LABEL_26:

  }
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __61__SSVCloudServiceCapabilitiesRequest_startWithResponseBlock___block_invoke;
  v36[3] = &unk_1E47B8630;
  v36[4] = self;
  v37 = v4;
  v33 = v4;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 175, v36);

}

void __61__SSVCloudServiceCapabilitiesRequest_startWithResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  SSVCloudServiceCapabilitiesResponse *v7;
  NSObject *v8;
  id v9;
  id v10;
  SSVCloudServiceCapabilitiesResponse *v11;
  id v12;
  void *v13;
  SSVCloudServiceCapabilitiesResponse *v14;
  void *v15;
  _QWORD block[4];
  SSVCloudServiceCapabilitiesResponse *v17;
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

        v14 = [SSVCloudServiceCapabilitiesResponse alloc];
        xpc_dictionary_get_value(v4, "3");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[SSVCloudServiceCapabilitiesResponse initWithXPCEncoding:](v14, "initWithXPCEncoding:", v15);

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
    block[2] = __61__SSVCloudServiceCapabilitiesRequest_startWithResponseBlock___block_invoke_2;
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

uint64_t __61__SSVCloudServiceCapabilitiesRequest_startWithResponseBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)startWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__SSVCloudServiceCapabilitiesRequest_startWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E47BFC48;
  v7 = v4;
  v5 = v4;
  -[SSVCloudServiceCapabilitiesRequest startWithResponseBlock:](self, "startWithResponseBlock:", v6);

}

uint64_t __63__SSVCloudServiceCapabilitiesRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (SSVCloudServiceCapabilitiesRequest)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSVCloudServiceCapabilitiesRequest *v6;
  objc_super v8;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v8.receiver = self;
    v8.super_class = (Class)SSVCloudServiceCapabilitiesRequest;
    v6 = -[SSRequest init](&v8, sel_init);
    if (v6)
      *(&v6->super._usesTaskCompletionAssertions + 1) = xpc_dictionary_get_BOOL(v5, "0");
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
  xpc_dictionary_set_BOOL(v3, "0", *(&self->super._usesTaskCompletionAssertions + 1));
  return v3;
}

- (BOOL)allowsPromptingForPrivacyAcknowledgement
{
  return *(&self->super._usesTaskCompletionAssertions + 1);
}

- (void)setAllowsPromptingForPrivacyAcknowledgement:(BOOL)a3
{
  *(&self->super._usesTaskCompletionAssertions + 1) = a3;
}

@end
