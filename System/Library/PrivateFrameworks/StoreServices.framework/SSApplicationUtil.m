@implementation SSApplicationUtil

- (SSApplicationUtil)init
{
  SSApplicationUtil *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *serialQueue;
  NSObject *v5;
  NSObject *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSApplicationUtil;
  v2 = -[SSApplicationUtil init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.storeservices.applicationutils", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    v5 = v2->_serialQueue;
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v5, v6);

  }
  return v2;
}

- (void)restartApplication:(id)a3
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
  NSObject *serialQueue;
  id v18;
  uint64_t v19;
  _QWORD block[5];
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
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v22 = 136446210;
      v23 = "-[SSApplicationUtil restartApplication:]";
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
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SSApplicationUtil_restartApplication___block_invoke;
  block[3] = &unk_1E47B8AC0;
  block[4] = self;
  v21 = v4;
  v18 = v4;
  dispatch_async(serialQueue, block);

}

void __40__SSApplicationUtil_restartApplication___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "0", 165);
  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__SSApplicationUtil_restartApplication___block_invoke_2;
  v5[3] = &unk_1E47B8630;
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "sendMessage:withReply:", v2, v5);

}

void __40__SSApplicationUtil_restartApplication___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  CFArrayRef v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  int v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CFArrayRef v27;
  id v28;
  void *v29;
  uint64_t v30;
  _QWORD block[4];
  id v32;
  id v33;
  int v34;
  id v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!*(_QWORD *)(a1 + 40))
  {
    objc_opt_class();
    v6 = SSXPCDictionaryCopyCFObjectWithClass(v4, "0");
    v7 = -[__CFArray intValue](v6, "intValue");
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7)
    {
      if (!v8)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v10 = objc_msgSend(v9, "shouldLog");
      if (objc_msgSend(v9, "shouldLogToDisk"))
        v11 = v10 | 2;
      else
        v11 = v10;
      objc_msgSend(v9, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        v11 &= 2u;
      if (!v11)
        goto LABEL_30;
      v13 = (void *)objc_opt_class();
      v14 = v13;
      v34 = 138412546;
      v35 = v13;
      v36 = 1024;
      v37 = -[__CFArray intValue](v6, "intValue");
      LODWORD(v30) = 18;
    }
    else
    {
      if (!v8)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v18 = objc_msgSend(v9, "shouldLog");
      if (objc_msgSend(v9, "shouldLogToDisk"))
        v19 = v18 | 2;
      else
        v19 = v18;
      objc_msgSend(v9, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        v19 &= 2u;
      if (!v19)
        goto LABEL_30;
      v34 = 138412290;
      v35 = (id)objc_opt_class();
      v14 = v35;
      LODWORD(v30) = 12;
    }
    v20 = (void *)_os_log_send_and_compose_impl();

    if (!v20)
      goto LABEL_31;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v20, 4, &v34, v30);
    v12 = objc_claimAutoreleasedReturnValue();
    free(v20);
    SSFileLog(v9, CFSTR("%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v12);
LABEL_30:

    goto LABEL_31;
  }
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    v5 = 121;
  }
  else
  {
    if (v3 && MEMORY[0x1A85863E4](v3) == MEMORY[0x1E0C812F8])
    {
      objc_opt_class();
      v27 = SSXPCDictionaryCopyCFObjectWithClass(v4, "0");
      if (-[__CFArray intValue](v27, "intValue"))
      {
        v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
        xpc_dictionary_get_value(v4, "1");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v28, "initWithXPCEncoding:", v29);

      }
      else
      {
        v15 = 0;
      }

      goto LABEL_18;
    }
    v5 = 111;
  }
  SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
  dispatch_get_global_queue(0, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SSApplicationUtil_restartApplication___block_invoke_3;
  block[3] = &unk_1E47B8A98;
  v17 = *(id *)(a1 + 40);
  v32 = v15;
  v33 = v17;
  v6 = v15;
  dispatch_async(v16, block);

  v9 = v33;
LABEL_31:

}

uint64_t __40__SSApplicationUtil_restartApplication___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_connection
{
  SSXPCConnection *connection;
  SSXPCConnection *v4;
  SSXPCConnection *v5;

  connection = self->_connection;
  if (!connection)
  {
    v4 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    v5 = self->_connection;
    self->_connection = v4;

    connection = self->_connection;
  }
  return connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
