@implementation SSVShowDialogRequest

- (SSVShowDialogRequest)initWithEncodedDialog:(id)a3
{
  id v5;
  SSVShowDialogRequest *v6;
  SSVShowDialogRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSVShowDialogRequest;
  v6 = -[SSRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dialog, a3);

  return v7;
}

- (void)startWithDialogResponseBlock:(id)a3
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
      v22 = "-[SSVShowDialogRequest startWithDialogResponseBlock:]";
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
  v19[2] = __53__SSVShowDialogRequest_startWithDialogResponseBlock___block_invoke;
  v19[3] = &unk_1E47B8630;
  v19[4] = self;
  v20 = v4;
  v17 = v4;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 134, v19);

}

void __53__SSVShowDialogRequest_startWithDialogResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  SSVDialogResponse *v8;
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

      v8 = [SSVDialogResponse alloc];
      xpc_dictionary_get_value(v4, "1");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SSVDialogResponse initWithXPCEncoding:](v8, "initWithXPCEncoding:", v9);

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
    block[2] = __53__SSVShowDialogRequest_startWithDialogResponseBlock___block_invoke_2;
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

uint64_t __53__SSVShowDialogRequest_startWithDialogResponseBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (SSVShowDialogRequest)initWithXPCEncoding:(id)a3
{
  id v4;
  SSVShowDialogRequest *v5;
  uint64_t v6;
  OS_xpc_object *dialog;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSVShowDialogRequest;
  v5 = -[SSRequest init](&v9, sel_init);
  if (v5)
  {
    xpc_dictionary_get_value(v4, "0");
    v6 = objc_claimAutoreleasedReturnValue();
    dialog = v5->_dialog;
    v5->_dialog = (OS_xpc_object *)v6;

  }
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v3, "0", self->_dialog);
  return v3;
}

- (OS_xpc_object)encodedDialog
{
  return self->_dialog;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialog, 0);
}

@end
