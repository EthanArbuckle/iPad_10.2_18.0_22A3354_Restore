@implementation SSVMediaSocialPostRequest

- (SSVMediaSocialPostRequest)initWithPostDescription:(id)a3
{
  id v4;
  SSVMediaSocialPostRequest *v5;
  uint64_t v6;
  SSVMediaSocialPostDescription *postDescription;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSVMediaSocialPostRequest;
  v5 = -[SSRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    postDescription = v5->_postDescription;
    v5->_postDescription = (SSVMediaSocialPostDescription *)v6;

  }
  return v5;
}

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
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v21 = 136446210;
      v22 = "-[SSVMediaSocialPostRequest startWithCompletionBlock:]";
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
  v19[2] = __54__SSVMediaSocialPostRequest_startWithCompletionBlock___block_invoke;
  v19[3] = &unk_1E47B8630;
  v19[4] = self;
  v20 = v4;
  v17 = v4;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 159, v19);

}

void __54__SSVMediaSocialPostRequest_startWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  xpc_object_t xdict;

  v3 = a2;
  xdict = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E0C81258])
    {
      v4 = 121;
    }
    else
    {
      if (v3 && MEMORY[0x1A85863E4](v3) == MEMORY[0x1E0C812F8])
      {
        v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
        xpc_dictionary_get_value(xdict, "2");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (void *)objc_msgSend(v6, "initWithXPCEncoding:", v7);

        goto LABEL_8;
      }
      v4 = 111;
    }
    SSError((uint64_t)CFSTR("SSErrorDomain"), v4, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest");

}

- (SSVMediaSocialPostRequest)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSVMediaSocialPostRequest *v6;
  SSVMediaSocialPostDescription *v8;
  void *v9;
  uint64_t v10;
  SSVMediaSocialPostDescription *postDescription;
  objc_super v12;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v12.receiver = self;
    v12.super_class = (Class)SSVMediaSocialPostRequest;
    v6 = -[SSRequest init](&v12, sel_init);
    if (v6)
    {
      v8 = [SSVMediaSocialPostDescription alloc];
      xpc_dictionary_get_value(v5, "0");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SSVMediaSocialPostDescription initWithXPCEncoding:](v8, "initWithXPCEncoding:", v9);
      postDescription = v6->_postDescription;
      v6->_postDescription = (SSVMediaSocialPostDescription *)v10;

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
  SSXPCDictionarySetObject(v3, "0", self->_postDescription);
  return v3;
}

- (SSVMediaSocialPostDescription)postDescription
{
  return self->_postDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postDescription, 0);
}

@end
