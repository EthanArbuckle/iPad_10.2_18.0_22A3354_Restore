@implementation SSMigrator

- (SSMigrator)init
{
  SSMigrator *v2;
  SSXPCConnection *v3;
  SSXPCConnection *connection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSMigrator;
  v2 = -[SSMigrator init](&v6, sel_init);
  if (v2)
  {
    v3 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    connection = v2->_connection;
    v2->_connection = v3;

  }
  return v2;
}

- (void)performMigration:(unint64_t)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  xpc_object_t v19;
  void *v20;
  SSXPCConnection *connection;
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  int v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      v11 = v9;
    else
      v11 = v9 & 2;
    if (v11)
    {
      v26 = 136446210;
      v27 = "-[SSMigrator performMigration:completionBlock:]";
      LODWORD(v23) = 12;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v26, v23);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog(v7, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v10);
    }

    goto LABEL_15;
  }
LABEL_16:
  v19 = SSXPCCreateMessageDictionary(116);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v19, "1", v20);

  NSLog(CFSTR("performing migration with updateType: %lu"), a3);
  connection = self->_connection;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __47__SSMigrator_performMigration_completionBlock___block_invoke;
  v24[3] = &unk_1E47BAB40;
  v25 = v6;
  v22 = v6;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v19, v24);

}

void __47__SSMigrator_performMigration_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  xpc_object_t xdict;

  xdict = a2;
  NSLog(CFSTR(" we are back wit ha reply of %@"), xdict);
  v3 = xdict;
  if (*(_QWORD *)(a1 + 32))
  {
    if (xdict == (xpc_object_t)MEMORY[0x1E0C81260] || xdict == (xpc_object_t)MEMORY[0x1E0C81258])
    {
      v5 = 121;
    }
    else
    {
      if (xdict && MEMORY[0x1A85863E4](xdict) == MEMORY[0x1E0C812F8])
      {
        v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
        xpc_dictionary_get_value(xdict, "2");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)objc_msgSend(v7, "initWithXPCEncoding:", v8);

        xpc_dictionary_get_BOOL(xdict, "1");
        goto LABEL_12;
      }
      v5 = 111;
    }
    SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    v3 = xdict;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
