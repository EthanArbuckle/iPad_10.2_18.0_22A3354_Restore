@implementation SSVSubscriptionStatusRequest

- (void)startWithStatusResponseBlock:(id)a3
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
  uint64_t v17;
  id v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
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
      v22 = 136446210;
      v23 = "-[SSVSubscriptionStatusRequest startWithStatusResponseBlock:]";
      LODWORD(v19) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v22, v19);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v17 = objc_msgSend((id)objc_opt_class(), "requestMessage");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__SSVSubscriptionStatusRequest_startWithStatusResponseBlock___block_invoke;
  v20[3] = &unk_1E47B8630;
  v20[4] = self;
  v21 = v4;
  v18 = v4;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", v17, v20);

}

void __61__SSVSubscriptionStatusRequest_startWithStatusResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  SSVSubscriptionStatus *v7;
  _BOOL4 v8;
  NSObject *v9;
  id v10;
  id v11;
  SSVSubscriptionStatus *v12;
  id v13;
  void *v14;
  SSVSubscriptionStatus *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  SSVSubscriptionStatus *v21;
  id v22;
  id v23;
  BOOL v24;

  v3 = a2;
  v4 = v3;
  if (!*(_QWORD *)(a1 + 40))
    goto LABEL_9;
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    v5 = 121;
    goto LABEL_7;
  }
  if (!v3 || MEMORY[0x1A85863E4](v3) != MEMORY[0x1E0C812F8])
  {
    v5 = 111;
LABEL_7:
    SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v8 = 1;
    goto LABEL_8;
  }
  v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
  xpc_dictionary_get_value(v4, "2");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v13, "initWithXPCEncoding:", v14);

  v8 = xpc_dictionary_get_BOOL(v4, "3");
  v15 = [SSVSubscriptionStatus alloc];
  xpc_dictionary_get_value(v4, "4");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SSVSubscriptionStatus initWithXPCEncoding:](v15, "initWithXPCEncoding:", v16);

LABEL_8:
  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __61__SSVSubscriptionStatusRequest_startWithStatusResponseBlock___block_invoke_2;
  v20 = &unk_1E47B9800;
  v10 = *(id *)(a1 + 40);
  v22 = v6;
  v23 = v10;
  v24 = v8;
  v21 = v7;
  v11 = v6;
  v12 = v7;
  dispatch_async(v9, &v17);

  if (v8)
LABEL_9:
    objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest", v17, v18, v19, v20);

}

uint64_t __61__SSVSubscriptionStatusRequest_startWithStatusResponseBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
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
  v6[2] = __57__SSVSubscriptionStatusRequest_startWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E47BE938;
  v7 = v4;
  v5 = v4;
  -[SSVSubscriptionStatusRequest startWithStatusResponseBlock:](self, "startWithStatusResponseBlock:", v6);

}

uint64_t __57__SSVSubscriptionStatusRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  BOOL v5;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    v5 = a3 == 0;
  else
    v5 = 1;
  if (!v5)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  return result;
}

+ (BOOL)_allowMultipleCallbacks
{
  return 1;
}

+ (int64_t)requestMessage
{
  return 149;
}

- (SSVSubscriptionStatusRequest)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSVSubscriptionStatusRequest *v6;
  SSAuthenticationContext *v8;
  void *v9;
  uint64_t v10;
  SSAuthenticationContext *authenticationContext;
  uint64_t v12;
  uint64_t v13;
  NSString *localizedAuthenticationReason;
  uint64_t v15;
  uint64_t v16;
  NSString *reason;
  objc_super v18;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v18.receiver = self;
    v18.super_class = (Class)SSVSubscriptionStatusRequest;
    v6 = -[SSRequest init](&v18, sel_init);
    if (v6)
    {
      v6->_authenticatesIfNecessary = xpc_dictionary_get_BOOL(v5, "3");
      v8 = [SSAuthenticationContext alloc];
      xpc_dictionary_get_value(v5, "0");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SSAuthenticationContext initWithXPCEncoding:](v8, "initWithXPCEncoding:", v9);
      authenticationContext = v6->_authenticationContext;
      v6->_authenticationContext = (SSAuthenticationContext *)v10;

      v6->_carrierBundleProvisioningStyle = xpc_dictionary_get_int64(v5, "1");
      v12 = objc_opt_class();
      v13 = SSXPCDictionaryCopyObjectWithClass(v5, "4", v12);
      localizedAuthenticationReason = v6->_localizedAuthenticationReason;
      v6->_localizedAuthenticationReason = (NSString *)v13;

      v15 = objc_opt_class();
      v16 = SSXPCDictionaryCopyObjectWithClass(v5, "2", v15);
      reason = v6->_reason;
      v6->_reason = (NSString *)v16;

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
  xpc_dictionary_set_BOOL(v3, "3", self->_authenticatesIfNecessary);
  SSXPCDictionarySetObject(v3, "0", self->_authenticationContext);
  xpc_dictionary_set_int64(v3, "1", self->_carrierBundleProvisioningStyle);
  SSXPCDictionarySetObject(v3, "4", self->_localizedAuthenticationReason);
  SSXPCDictionarySetObject(v3, "2", self->_reason);
  return v3;
}

- (BOOL)authenticatesIfNecessary
{
  return self->_authenticatesIfNecessary;
}

- (void)setAuthenticatesIfNecessary:(BOOL)a3
{
  self->_authenticatesIfNecessary = a3;
}

- (SSAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void)setAuthenticationContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (int64_t)carrierBundleProvisioningStyle
{
  return self->_carrierBundleProvisioningStyle;
}

- (void)setCarrierBundleProvisioningStyle:(int64_t)a3
{
  self->_carrierBundleProvisioningStyle = a3;
}

- (NSString)localizedAuthenticationReason
{
  return self->_localizedAuthenticationReason;
}

- (void)setLocalizedAuthenticationReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_localizedAuthenticationReason, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

@end
