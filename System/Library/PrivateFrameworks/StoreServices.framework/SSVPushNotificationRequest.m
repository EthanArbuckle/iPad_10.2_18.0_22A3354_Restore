@implementation SSVPushNotificationRequest

- (SSVPushNotificationRequest)initWithPushNotificationParameters:(id)a3
{
  id v4;
  SSVPushNotificationRequest *v5;
  uint64_t v6;
  SSVPushNotificationParameters *parameters;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSVPushNotificationRequest;
  v5 = -[SSRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    parameters = v5->_parameters;
    v5->_parameters = (SSVPushNotificationParameters *)v6;

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
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v21 = 136446210;
      v22 = "-[SSVPushNotificationRequest startWithResponseBlock:]";
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
  v19[2] = __53__SSVPushNotificationRequest_startWithResponseBlock___block_invoke;
  v19[3] = &unk_1E47B8630;
  v19[4] = self;
  v20 = v4;
  v17 = v4;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 127, v19);

}

void __53__SSVPushNotificationRequest_startWithResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  SSURLConnectionResponse *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E0C81258])
    {
      SSError((uint64_t)CFSTR("SSErrorDomain"), 121, 0, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      v10 = 0;
    }
    else
    {
      v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
      xpc_dictionary_get_value(v4, "2");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "initWithXPCEncoding:", v6);

      v8 = [SSURLConnectionResponse alloc];
      xpc_dictionary_get_value(v4, "1");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SSURLConnectionResponse initWithXPCEncoding:](v8, "initWithXPCEncoding:", v9);

    }
    if (!(v10 | v7))
    {
      SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__SSVPushNotificationRequest_startWithResponseBlock___block_invoke_2;
    block[3] = &unk_1E47B8608;
    v12 = *(id *)(a1 + 40);
    v17 = (id)v7;
    v18 = v12;
    v16 = (id)v10;
    v13 = (id)v7;
    v14 = (id)v10;
    dispatch_async(v11, block);

  }
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest");

}

uint64_t __53__SSVPushNotificationRequest_startWithResponseBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)start
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__SSVPushNotificationRequest_start__block_invoke;
  v3[3] = &unk_1E47BB9F8;
  v3[4] = self;
  -[SSVPushNotificationRequest startWithResponseBlock:](self, "startWithResponseBlock:", v3);
  return 1;
}

void __35__SSVPushNotificationRequest_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SSVPushNotificationRequest_start__block_invoke_2;
  block[3] = &unk_1E47B87B8;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __35__SSVPushNotificationRequest_start__block_invoke_2(uint64_t a1)
{
  char v2;
  void *v3;
  char v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
  {
    v2 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v2 & 1) != 0)
    {
      objc_msgSend(v5, "requestDidFinish:", *(_QWORD *)(a1 + 32));
LABEL_6:
      v3 = v5;
    }
  }
  else
  {
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "request:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
      goto LABEL_6;
    }
  }

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
  v6[2] = __55__SSVPushNotificationRequest_startWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E47BAAC8;
  v7 = v4;
  v5 = v4;
  -[SSVPushNotificationRequest startWithResponseBlock:](self, "startWithResponseBlock:", v6);

}

uint64_t __55__SSVPushNotificationRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (SSVPushNotificationRequest)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSVPushNotificationRequest *v6;
  SSVPushNotificationParameters *v8;
  void *v9;
  uint64_t v10;
  SSVPushNotificationParameters *parameters;
  objc_super v12;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v12.receiver = self;
    v12.super_class = (Class)SSVPushNotificationRequest;
    v6 = -[SSRequest init](&v12, sel_init);
    if (v6)
    {
      v8 = [SSVPushNotificationParameters alloc];
      xpc_dictionary_get_value(v5, "50");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SSVPushNotificationParameters initWithXPCEncoding:](v8, "initWithXPCEncoding:", v9);
      parameters = v6->_parameters;
      v6->_parameters = (SSVPushNotificationParameters *)v10;

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
  SSXPCDictionarySetCFObject(v3, "50", (__CFString *)self->_parameters);
  return v3;
}

- (SSVPushNotificationParameters)pushNotificationParameters
{
  return self->_parameters;
}

- (void)setPushNotificationParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
