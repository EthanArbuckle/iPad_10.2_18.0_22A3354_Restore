@implementation SSLookupRequest

- (SSLookupRequest)init
{
  SSLookupRequest *v2;
  SSLookupProperties *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSLookupRequest;
  v2 = -[SSRequest init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SSLookupProperties);
    v2->_properties = v3;
    -[SSLookupProperties setValue:forRequestParameter:](v3, "setValue:forRequestParameter:", CFSTR("1"), CFSTR("version"));
  }
  return v2;
}

- (SSLookupRequest)initWithLocation:(id)a3
{
  SSLookupRequest *v4;
  SSLookupRequest *v5;

  v4 = -[SSLookupRequest init](self, "init");
  v5 = v4;
  if (v4)
    -[SSLookupProperties setLocation:](v4->_properties, "setLocation:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSLookupRequest;
  -[SSRequest dealloc](&v3, sel_dealloc);
}

- (BOOL)authenticatesIfNeeded
{
  return self->_personalizationStyle == 1;
}

- (NSString)keyProfile
{
  return -[SSLookupProperties keyProfile](self->_properties, "keyProfile");
}

- (int64_t)localizationStyle
{
  return -[SSLookupProperties localizationStyle](self->_properties, "localizationStyle");
}

- (void)setAuthenticatesIfNeeded:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[SSLookupRequest authenticatesIfNeeded](self, "authenticatesIfNeeded") != a3)
    self->_personalizationStyle = v3;
}

- (void)setKeyProfile:(id)a3
{
  -[SSLookupProperties setKeyProfile:](self->_properties, "setKeyProfile:", a3);
}

- (void)setLocalizationStyle:(int64_t)a3
{
  -[SSLookupProperties setLocalizationStyle:](self->_properties, "setLocalizationStyle:", a3);
}

- (void)setValue:(id)a3 forRequestParameter:(id)a4
{
  -[SSLookupProperties setValue:forRequestParameter:](self->_properties, "setValue:forRequestParameter:", a3, a4);
}

- (void)startWithLookupBlock:(id)a3
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
    if (os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v8 = v7;
    else
      v8 = v7 & 2;
    if (v8)
    {
      v21 = 136446210;
      v22 = "-[SSLookupRequest startWithLookupBlock:]";
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
  v20[2] = __40__SSLookupRequest_startWithLookupBlock___block_invoke;
  v20[3] = &unk_1E47B8EE0;
  v20[4] = self;
  v20[5] = a3;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 85, v20, v18);
}

uint64_t __40__SSLookupRequest_startWithLookupBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  SSLookupResponse *v5;

  if (*(_QWORD *)(a1 + 40))
  {
    if (a2 == (void *)MEMORY[0x1E0C81258])
    {
      v4 = (id)SSError((uint64_t)CFSTR("SSErrorDomain"), 121, 0, 0);
      v5 = 0;
    }
    else
    {
      v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
      v5 = -[SSLookupResponse initWithXPCEncoding:]([SSLookupResponse alloc], "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "1"));
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  return objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest");
}

- (id)valueForRequestParameter:(id)a3
{
  return -[SSLookupProperties valueForRequestParameter:](self->_properties, "valueForRequestParameter:", a3);
}

- (BOOL)start
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __24__SSLookupRequest_start__block_invoke;
  v3[3] = &unk_1E47BDC38;
  v3[4] = self;
  -[SSLookupRequest startWithLookupBlock:](self, "startWithLookupBlock:", v3);
  return 1;
}

void __24__SSLookupRequest_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD block[7];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__SSLookupRequest_start__block_invoke_2;
  block[3] = &unk_1E47B9E88;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = a2;
  block[6] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __24__SSLookupRequest_start__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
  if (*(_QWORD *)(a1 + 40))
  {
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
  v3[2] = __44__SSLookupRequest_startWithCompletionBlock___block_invoke;
  v3[3] = &unk_1E47BDC60;
  v3[4] = a3;
  -[SSLookupRequest startWithLookupBlock:](self, "startWithLookupBlock:", v3);
}

void __44__SSLookupRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  NSObject *global_queue;
  _QWORD block[7];

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__SSLookupRequest_startWithCompletionBlock___block_invoke_2;
    block[3] = &unk_1E47BA838;
    block[4] = a3;
    block[5] = a2;
    block[6] = v3;
    dispatch_async(global_queue, block);
  }
}

uint64_t __44__SSLookupRequest_startWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  if (*(_OWORD *)(a1 + 32) == 0)
    SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (SSLookupProperties)_lookupProperties
{
  return (SSLookupProperties *)(id)-[SSLookupProperties copy](self->_properties, "copy");
}

- (void)_setTimeoutInterval:(id)a3
{
  -[SSLookupProperties setTimeoutInterval:](self->_properties, "setTimeoutInterval:", a3);
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_authenticationContext);
  xpc_dictionary_set_int64(v3, "1", self->_personalizationStyle);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_properties);
  return v3;
}

- (SSLookupRequest)initWithXPCEncoding:(id)a3
{
  SSLookupRequest *v5;
  objc_super v7;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSLookupRequest;
    v5 = -[SSRequest init](&v7, sel_init);
    if (v5)
    {
      v5->_authenticationContext = -[SSAuthenticationContext initWithXPCEncoding:]([SSAuthenticationContext alloc], "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "0"));
      v5->_personalizationStyle = xpc_dictionary_get_int64(a3, "1");
      v5->_properties = -[SSLookupProperties initWithXPCEncoding:]([SSLookupProperties alloc], "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "2"));
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (SSAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void)setAuthenticationContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)personalizationStyle
{
  return self->_personalizationStyle;
}

- (void)setPersonalizationStyle:(int64_t)a3
{
  self->_personalizationStyle = a3;
}

- (int64_t)resultFilters
{
  return self->_resultFilters;
}

- (void)setResultFilters:(int64_t)a3
{
  self->_resultFilters = a3;
}

@end
