@implementation SSRedeemCodesRequest

- (SSRedeemCodesRequest)initWithRedeemCodes:(id)a3
{
  SSRedeemCodesRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSRedeemCodesRequest;
  v4 = -[SSRequest init](&v6, sel_init);
  if (v4)
  {
    v4->_redeemCodes = (NSArray *)objc_msgSend(a3, "copy");
    v4->_headless = 1;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSRedeemCodesRequest;
  -[SSRequest dealloc](&v3, sel_dealloc);
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
  v9 = __Block_byref_object_copy__47;
  v10 = __Block_byref_object_dispose__47;
  v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__SSRedeemCodesRequest_authenticationContext__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SSAuthenticationContext *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __45__SSRedeemCodesRequest_authenticationContext__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 96);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSArray)redeemCodes
{
  return self->_redeemCodes;
}

- (void)setAuthenticationContext:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__SSRedeemCodesRequest_setAuthenticationContext___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __49__SSRedeemCodesRequest_setAuthenticationContext___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(result + 32) + 96);
  if (v1 != *(void **)(result + 40))
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 40), "copy");
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 96) = result;
  }
  return result;
}

- (void)startWithRedeemResponseBlock:(id)a3
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
  id v18;
  int v19;
  int v20;
  uint64_t v21;
  NSString *v22;
  NSArray *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *global_queue;
  int *v34;
  uint64_t v35;
  _QWORD v36[7];
  int v37;
  const char *v38;
  __int16 v39;
  NSString *v40;
  __int16 v41;
  NSArray *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
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
    if (os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v8 = v7;
    else
      v8 = v7 & 2;
    if (v8)
    {
      v37 = 136446210;
      v38 = "-[SSRedeemCodesRequest startWithRedeemResponseBlock:]";
      LODWORD(v35) = 12;
      v34 = &v37;
      v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v37, v35);
        free(v10);
        SSFileLog(v5, CFSTR("%@"), v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  if (!-[SSRedeemCodesRequest logCorrelationKey](self, "logCorrelationKey", v34))
    -[SSRedeemCodesRequest setLogCorrelationKey:](self, "setLogCorrelationKey:", AMSGenerateLogCorrelationKey());
  v18 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
  if (!v18)
    v18 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
  v19 = objc_msgSend(v18, "shouldLog");
  if (objc_msgSend(v18, "shouldLogToDisk"))
    v20 = v19 | 2;
  else
    v20 = v19;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v18, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v20 &= 2u;
  if (v20)
  {
    v21 = objc_opt_class();
    v22 = -[SSRedeemCodesRequest logCorrelationKey](self, "logCorrelationKey");
    v23 = -[SSRedeemCodesRequest redeemCodes](self, "redeemCodes");
    v37 = 138543874;
    v38 = (const char *)v21;
    v39 = 2114;
    v40 = v22;
    v41 = 2112;
    v42 = v23;
    LODWORD(v35) = 32;
    v24 = _os_log_send_and_compose_impl();
    if (v24)
    {
      v25 = (void *)v24;
      v26 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v24, 4, &v37, v35);
      free(v25);
      SSFileLog(v18, CFSTR("%@"), v27, v28, v29, v30, v31, v32, v26);
    }
  }
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_async(global_queue, &__block_literal_global_23);
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __53__SSRedeemCodesRequest_startWithRedeemResponseBlock___block_invoke_2;
  v36[3] = &unk_1E47BE330;
  v36[5] = global_queue;
  v36[6] = a3;
  v36[4] = self;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 91, v36);
}

uint64_t __53__SSRedeemCodesRequest_startWithRedeemResponseBlock___block_invoke()
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SSVNetworkingDidStartNotification"), 0);
}

void __53__SSRedeemCodesRequest_startWithRedeemResponseBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  SSRedeemCodesResponse *v5;
  id v6;
  id v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  _BYTE v26[24];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 48))
  {
    if (a2 == (void *)MEMORY[0x1E0C81258])
    {
      v4 = (id)SSError((uint64_t)CFSTR("SSErrorDomain"), 121, 0, 0);
      v5 = 0;
    }
    else
    {
      v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
      v5 = -[SSRedeemCodesResponse initWithXPCEncoding:]([SSRedeemCodesResponse alloc], "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "1"));
    }
    v6 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v7 = v6;
    if (v4)
    {
      if (!v6)
        v7 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = objc_msgSend(v7, "shouldLog");
      if (objc_msgSend(v7, "shouldLogToDisk"))
        v9 = v8 | 2;
      else
        v9 = v8;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v9 &= 2u;
      if (!v9)
        goto LABEL_26;
      v10 = objc_opt_class();
      v11 = objc_msgSend(*(id *)(a1 + 32), "logCorrelationKey");
      *(_DWORD *)v26 = 138543874;
      *(_QWORD *)&v26[4] = v10;
      *(_WORD *)&v26[12] = 2114;
      *(_QWORD *)&v26[14] = v11;
      *(_WORD *)&v26[22] = 2114;
      v27 = AMSLogableError();
      LODWORD(v25) = 32;
      v24 = v26;
    }
    else
    {
      if (!v6)
        v7 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v12 = objc_msgSend(v7, "shouldLog");
      if (objc_msgSend(v7, "shouldLogToDisk"))
        v13 = v12 | 2;
      else
        v13 = v12;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v13 &= 2u;
      if (!v13)
        goto LABEL_26;
      v14 = objc_opt_class();
      v15 = objc_msgSend(*(id *)(a1 + 32), "logCorrelationKey");
      *(_DWORD *)v26 = 138543618;
      *(_QWORD *)&v26[4] = v14;
      *(_WORD *)&v26[12] = 2114;
      *(_QWORD *)&v26[14] = v15;
      LODWORD(v25) = 22;
      v24 = v26;
    }
    v16 = (void *)_os_log_send_and_compose_impl();
    if (v16)
    {
      v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 4, v26, v25, *(_OWORD *)v26, *(_QWORD *)&v26[16]);
      free(v16);
      SSFileLog(v7, CFSTR("%@"), v18, v19, v20, v21, v22, v23, v17);
    }
LABEL_26:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest", v24);
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), &__block_literal_global_15);
}

uint64_t __53__SSRedeemCodesRequest_startWithRedeemResponseBlock___block_invoke_14()
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SSVNetworkingDidStopNotification"), 0);
}

- (void)startWithCompletionBlock:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__SSRedeemCodesRequest_startWithCompletionBlock___block_invoke;
  v3[3] = &unk_1E47BE358;
  v3[4] = a3;
  -[SSRedeemCodesRequest startWithRedeemResponseBlock:](self, "startWithRedeemResponseBlock:", v3);
}

uint64_t __49__SSRedeemCodesRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (SSRedeemCodesRequest)initWithXPCEncoding:(id)a3
{
  SSRedeemCodesRequest *v5;
  objc_super v7;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSRedeemCodesRequest;
    v5 = -[SSRequest init](&v7, sel_init);
    if (v5)
    {
      v5->_authenticationContext = -[SSAuthenticationContext initWithXPCEncoding:]([SSAuthenticationContext alloc], "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "0"));
      objc_opt_class();
      v5->_redeemCodes = (NSArray *)SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
      v5->_headless = xpc_dictionary_get_BOOL(a3, "2");
      v5->_cameraRecognized = xpc_dictionary_get_BOOL(a3, "3");
      objc_opt_class();
      v5->_logCorrelationKey = (NSString *)SSXPCDictionaryCopyCFObjectWithClass(a3, "4");
      objc_opt_class();
      v5->_params = (NSDictionary *)SSXPCDictionaryCopyCFObjectWithClass(a3, "5");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_authenticationContext);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_redeemCodes);
  xpc_dictionary_set_BOOL(v3, "2", self->_headless);
  xpc_dictionary_set_BOOL(v3, "3", self->_cameraRecognized);
  SSXPCDictionarySetCFObject(v3, "4", (__CFString *)self->_logCorrelationKey);
  SSXPCDictionarySetCFObject(v3, "5", (__CFString *)self->_params);
  return v3;
}

- (BOOL)headless
{
  return self->_headless;
}

- (void)setHeadless:(BOOL)a3
{
  self->_headless = a3;
}

- (BOOL)cameraRecognized
{
  return self->_cameraRecognized;
}

- (void)setCameraRecognized:(BOOL)a3
{
  self->_cameraRecognized = a3;
}

- (NSString)logCorrelationKey
{
  return self->_logCorrelationKey;
}

- (void)setLogCorrelationKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSDictionary)params
{
  return self->_params;
}

- (void)setParams:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

@end
