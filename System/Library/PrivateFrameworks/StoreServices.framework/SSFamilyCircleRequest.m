@implementation SSFamilyCircleRequest

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
      v22 = "-[SSFamilyCircleRequest startWithResponseBlock:]";
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
  v19[2] = __48__SSFamilyCircleRequest_startWithResponseBlock___block_invoke;
  v19[3] = &unk_1E47B8630;
  v19[4] = self;
  v20 = v4;
  v17 = v4;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 141, v19);

}

void __48__SSFamilyCircleRequest_startWithResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  SSFamilyCircleResponse *v6;
  SSFamilyCircle *v7;
  void *v8;
  SSFamilyCircle *v9;
  xpc_object_t xdict;

  xdict = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    if (xdict == (xpc_object_t)MEMORY[0x1E0C81258])
    {
      SSError((uint64_t)CFSTR("SSErrorDomain"), 121, 0, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 0;
    }
    else
    {
      v3 = objc_alloc(MEMORY[0x1E0CB35C8]);
      xpc_dictionary_get_value(xdict, "2");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v3, "initWithXPCEncoding:", v4);

      v6 = objc_alloc_init(SSFamilyCircleResponse);
      v7 = [SSFamilyCircle alloc];
      xpc_dictionary_get_value(xdict, "1");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SSFamilyCircle initWithXPCEncoding:](v7, "initWithXPCEncoding:", v8);

      -[SSFamilyCircleResponse setFamilyCircle:](v6, "setFamilyCircle:", v9);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest");

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
  v6[2] = __50__SSFamilyCircleRequest_startWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E47BF940;
  v7 = v4;
  v5 = v4;
  -[SSFamilyCircleRequest startWithResponseBlock:](self, "startWithResponseBlock:", v6);

}

uint64_t __50__SSFamilyCircleRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (SSFamilyCircleRequest)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSFamilyCircleRequest *v6;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v10.receiver = self;
    v10.super_class = (Class)SSFamilyCircleRequest;
    v6 = -[SSRequest init](&v10, sel_init);
    if (v6)
    {
      v6->_authenticationPromptStyle = xpc_dictionary_get_int64(v5, "1");
      v8 = objc_opt_class();
      v9 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
      v6->_fetchITunesAccountNames = objc_msgSend(v9, "BOOLValue");

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
  void *v4;

  v3 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_fetchITunesAccountNames);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "0", v4);

  xpc_dictionary_set_int64(v3, "1", self->_authenticationPromptStyle);
  return v3;
}

- (int64_t)authenticationPromptStyle
{
  return self->_authenticationPromptStyle;
}

- (void)setAuthenticationPromptStyle:(int64_t)a3
{
  self->_authenticationPromptStyle = a3;
}

- (BOOL)fetchITunesAccountNames
{
  return self->_fetchITunesAccountNames;
}

- (void)setFetchITunesAccountNames:(BOOL)a3
{
  self->_fetchITunesAccountNames = a3;
}

@end
