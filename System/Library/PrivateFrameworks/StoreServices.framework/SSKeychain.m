@implementation SSKeychain

- (SSKeychain)init
{
  SSKeychain *v2;
  SSXPCConnection *v3;
  SSXPCConnection *connection;
  id v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v8;
  NSObject *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SSKeychain;
  v2 = -[SSKeychain init](&v11, sel_init);
  if (v2)
  {
    v3 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    connection = v2->_connection;
    v2->_connection = v3;

    v5 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.StoreServices.SSKeychain.%p"), v2));
    v6 = dispatch_queue_create((const char *)objc_msgSend(v5, "UTF8String"), 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v6;

    v8 = v2->_dispatchQueue;
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v8, v9);

  }
  return v2;
}

- (void)createAttestationDataForAccountIdentifier:(id)a3 completionBlock:(id)a4
{
  -[SSKeychain createAttestationDataForAccountIdentifier:purpose:completionBlock:](self, "createAttestationDataForAccountIdentifier:purpose:completionBlock:", a3, 0, a4);
}

- (void)createAttestationDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  xpc_object_t v22;
  void *v23;
  uint64_t v24;
  int v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      v14 = v12;
    else
      v14 = v12 & 2;
    if (v14)
    {
      v25 = 136446210;
      v26 = "-[SSKeychain createAttestationDataForAccountIdentifier:purpose:completionBlock:]";
      LODWORD(v24) = 12;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, &v25, v24);
      v13 = objc_claimAutoreleasedReturnValue();
      free(v15);
      SSFileLog(v10, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v13);
    }

    goto LABEL_15;
  }
LABEL_16:
  v22 = SSXPCCreateMessageDictionary(179);
  SSXPCDictionarySetObject(v22, "1", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v22, "2", v23);

  -[SSKeychain _sendMessage:completionBlock:](self, "_sendMessage:completionBlock:", v22, v8);
}

- (void)createX509CertChainDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  xpc_object_t v22;
  void *v23;
  SSXPCConnection *connection;
  id v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;
  int v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      v14 = v12;
    else
      v14 = v12 & 2;
    if (v14)
    {
      v29 = 136446210;
      v30 = "-[SSKeychain createX509CertChainDataForAccountIdentifier:purpose:completionBlock:]";
      LODWORD(v26) = 12;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, &v29, v26);
      v13 = objc_claimAutoreleasedReturnValue();
      free(v15);
      SSFileLog(v10, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v13);
    }

    goto LABEL_15;
  }
LABEL_16:
  v22 = SSXPCCreateMessageDictionary(204);
  SSXPCDictionarySetObject(v22, "1", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v22, "2", v23);

  connection = self->_connection;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __82__SSKeychain_createX509CertChainDataForAccountIdentifier_purpose_completionBlock___block_invoke;
  v27[3] = &unk_1E47B8630;
  v27[4] = self;
  v28 = v8;
  v25 = v8;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v22, v27);

}

void __82__SSKeychain_createX509CertChainDataForAccountIdentifier_purpose_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    v5 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A85863E4](v3) != MEMORY[0x1E0C812F8])
  {
    v5 = 111;
LABEL_6:
    SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    goto LABEL_7;
  }
  v10 = objc_opt_class();
  v7 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "0", v10);
  v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
  xpc_dictionary_get_value(v4, "1");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v11, "initWithXPCEncoding:", v12);

LABEL_7:
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__SSKeychain_createX509CertChainDataForAccountIdentifier_purpose_completionBlock___block_invoke_2;
    block[3] = &unk_1E47B8608;
    v16 = v8;
    v14 = v7;
    v15 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __82__SSKeychain_createX509CertChainDataForAccountIdentifier_purpose_completionBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)deleteKeychainTokensForAccountIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  xpc_object_t v20;
  SSXPCConnection *connection;
  id v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  int v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      v12 = v10;
    else
      v12 = v10 & 2;
    if (v12)
    {
      v26 = 136446210;
      v27 = "-[SSKeychain deleteKeychainTokensForAccountIdentifier:completionBlock:]";
      LODWORD(v23) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v26, v23);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  v20 = SSXPCCreateMessageDictionary(185);
  SSXPCDictionarySetObject(v20, "1", v7);

  connection = self->_connection;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __71__SSKeychain_deleteKeychainTokensForAccountIdentifier_completionBlock___block_invoke;
  v24[3] = &unk_1E47B8630;
  v24[4] = self;
  v25 = v6;
  v22 = v6;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v20, v24);

}

void __71__SSKeychain_deleteKeychainTokensForAccountIdentifier_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    v5 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A85863E4](v3) != MEMORY[0x1E0C812F8])
  {
    v5 = 111;
LABEL_6:
    SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    goto LABEL_7;
  }
  v10 = objc_opt_class();
  v7 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "0", v10);
  v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
  xpc_dictionary_get_value(v4, "1");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v11, "initWithXPCEncoding:", v12);

LABEL_7:
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__SSKeychain_deleteKeychainTokensForAccountIdentifier_completionBlock___block_invoke_2;
    block[3] = &unk_1E47B8608;
    v16 = v8;
    v14 = v7;
    v15 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __71__SSKeychain_deleteKeychainTokensForAccountIdentifier_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "isEqualToNumber:", &unk_1E481E648), *(_QWORD *)(a1 + 40));
}

- (void)getPublicKeyDataForAccountIdentifier:(id)a3 completionBlock:(id)a4
{
  -[SSKeychain getPublicKeyDataForAccountIdentifier:purpose:completionBlock:](self, "getPublicKeyDataForAccountIdentifier:purpose:completionBlock:", a3, 0, a4);
}

- (void)getPublicKeyDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  xpc_object_t v22;
  void *v23;
  uint64_t v24;
  int v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      v14 = v12;
    else
      v14 = v12 & 2;
    if (v14)
    {
      v25 = 136446210;
      v26 = "-[SSKeychain getPublicKeyDataForAccountIdentifier:purpose:completionBlock:]";
      LODWORD(v24) = 12;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, &v25, v24);
      v13 = objc_claimAutoreleasedReturnValue();
      free(v15);
      SSFileLog(v10, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v13);
    }

    goto LABEL_15;
  }
LABEL_16:
  v22 = SSXPCCreateMessageDictionary(180);
  SSXPCDictionarySetObject(v22, "1", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v22, "2", v23);

  -[SSKeychain _sendMessage:completionBlock:](self, "_sendMessage:completionBlock:", v22, v8);
}

- (void)keyCountForAccountIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  xpc_object_t v20;
  SSXPCConnection *connection;
  id v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  int v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      v12 = v10;
    else
      v12 = v10 & 2;
    if (v12)
    {
      v26 = 136446210;
      v27 = "-[SSKeychain keyCountForAccountIdentifier:completionBlock:]";
      LODWORD(v23) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v26, v23);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  v20 = SSXPCCreateMessageDictionary(202);
  SSXPCDictionarySetObject(v20, "1", v7);

  connection = self->_connection;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __59__SSKeychain_keyCountForAccountIdentifier_completionBlock___block_invoke;
  v24[3] = &unk_1E47B8630;
  v24[4] = self;
  v25 = v6;
  v22 = v6;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v20, v24);

}

void __59__SSKeychain_keyCountForAccountIdentifier_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t uint64;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    v5 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A85863E4](v3) != MEMORY[0x1E0C812F8])
  {
    v5 = 111;
LABEL_6:
    SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64 = 0;
    goto LABEL_7;
  }
  uint64 = xpc_dictionary_get_uint64(v4, "0");
  v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
  xpc_dictionary_get_value(v4, "1");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v10, "initWithXPCEncoding:", v11);

LABEL_7:
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__SSKeychain_keyCountForAccountIdentifier_completionBlock___block_invoke_2;
    block[3] = &unk_1E47B8658;
    v14 = v8;
    v15 = uint64;
    v13 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __59__SSKeychain_keyCountForAccountIdentifier_completionBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)signData:(id)a3 reason:(id)a4 fallback:(id)a5 cancel:(id)a6 forAccountIdentifier:(id)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  int v22;
  NSObject *v23;
  int v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  xpc_object_t v32;
  uint64_t v33;
  int v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = objc_msgSend(v20, "shouldLog");
    if (objc_msgSend(v20, "shouldLogToDisk"))
      v22 = v21 | 2;
    else
      v22 = v21;
    objc_msgSend(v20, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      v24 = v22;
    else
      v24 = v22 & 2;
    if (v24)
    {
      v34 = 136446210;
      v35 = "-[SSKeychain signData:reason:fallback:cancel:forAccountIdentifier:completionBlock:]";
      LODWORD(v33) = 12;
      v25 = (void *)_os_log_send_and_compose_impl();

      if (!v25)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v25, 4, &v34, v33);
      v23 = objc_claimAutoreleasedReturnValue();
      free(v25);
      SSFileLog(v20, CFSTR("%@"), v26, v27, v28, v29, v30, v31, (uint64_t)v23);
    }

    goto LABEL_15;
  }
LABEL_16:
  v32 = SSXPCCreateMessageDictionary(181);
  SSXPCDictionarySetObject(v32, "1", v19);

  SSXPCDictionarySetObject(v32, "2", v18);
  SSXPCDictionarySetObject(v32, "3", v17);

  SSXPCDictionarySetObject(v32, "4", v16);
  SSXPCDictionarySetObject(v32, "5", v15);

  -[SSKeychain _sendMessage:completionBlock:](self, "_sendMessage:completionBlock:", v32, v14);
}

- (void)signData:(id)a3 context:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  xpc_object_t v23;
  uint64_t v24;
  int v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = objc_msgSend(v11, "shouldLog");
    if (objc_msgSend(v11, "shouldLogToDisk"))
      v13 = v12 | 2;
    else
      v13 = v12;
    objc_msgSend(v11, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      v15 = v13;
    else
      v15 = v13 & 2;
    if (v15)
    {
      v25 = 136446210;
      v26 = "-[SSKeychain signData:context:completionBlock:]";
      LODWORD(v24) = 12;
      v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 4, &v25, v24);
      v14 = objc_claimAutoreleasedReturnValue();
      free(v16);
      SSFileLog(v11, CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v14);
    }

    goto LABEL_15;
  }
LABEL_16:
  v23 = SSXPCCreateMessageDictionary(192);
  SSXPCDictionarySetObject(v23, "1", v10);

  SSXPCDictionarySetObject(v23, "2", v9);
  -[SSKeychain _sendMessage:completionBlock:](self, "_sendMessage:completionBlock:", v23, v8);

}

- (void)x509CertChainDataForAccountIdentifier:(id)a3 purpose:(int64_t)a4 regenerateCerts:(BOOL)a5 completionBlock:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  xpc_object_t v24;
  void *v25;
  void *v26;
  SSXPCConnection *connection;
  id v28;
  uint64_t v29;
  _QWORD v30[5];
  id v31;
  int v32;
  const char *v33;
  uint64_t v34;

  v6 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = objc_msgSend(v12, "shouldLog");
    if (objc_msgSend(v12, "shouldLogToDisk"))
      v14 = v13 | 2;
    else
      v14 = v13;
    objc_msgSend(v12, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      v16 = v14;
    else
      v16 = v14 & 2;
    if (v16)
    {
      v32 = 136446210;
      v33 = "-[SSKeychain x509CertChainDataForAccountIdentifier:purpose:regenerateCerts:completionBlock:]";
      LODWORD(v29) = 12;
      v17 = (void *)_os_log_send_and_compose_impl();

      if (!v17)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v17, 4, &v32, v29);
      v15 = objc_claimAutoreleasedReturnValue();
      free(v17);
      SSFileLog(v12, CFSTR("%@"), v18, v19, v20, v21, v22, v23, (uint64_t)v15);
    }

    goto LABEL_15;
  }
LABEL_16:
  v24 = SSXPCCreateMessageDictionary(205);
  SSXPCDictionarySetObject(v24, "1", v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v24, "2", v25);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v24, "3", v26);

  connection = self->_connection;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __92__SSKeychain_x509CertChainDataForAccountIdentifier_purpose_regenerateCerts_completionBlock___block_invoke;
  v30[3] = &unk_1E47B8630;
  v30[4] = self;
  v31 = v10;
  v28 = v10;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v24, v30);

}

void __92__SSKeychain_x509CertChainDataForAccountIdentifier_purpose_regenerateCerts_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    v5 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A85863E4](v3) != MEMORY[0x1E0C812F8])
  {
    v5 = 111;
LABEL_6:
    SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    goto LABEL_7;
  }
  v10 = objc_opt_class();
  v7 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "0", v10);
  v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
  xpc_dictionary_get_value(v4, "1");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v11, "initWithXPCEncoding:", v12);

LABEL_7:
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __92__SSKeychain_x509CertChainDataForAccountIdentifier_purpose_regenerateCerts_completionBlock___block_invoke_2;
    block[3] = &unk_1E47B8608;
    v16 = v8;
    v14 = v7;
    v15 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __92__SSKeychain_x509CertChainDataForAccountIdentifier_purpose_regenerateCerts_completionBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_sendMessage:(id)a3 completionBlock:(id)a4
{
  id v6;
  SSXPCConnection *connection;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  connection = self->_connection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__SSKeychain__sendMessage_completionBlock___block_invoke;
  v9[3] = &unk_1E47B8630;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", a3, v9);

}

void __43__SSKeychain__sendMessage_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    v5 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A85863E4](v3) != MEMORY[0x1E0C812F8])
  {
    v5 = 111;
LABEL_6:
    SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    goto LABEL_7;
  }
  v10 = objc_opt_class();
  v7 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "0", v10);
  v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
  xpc_dictionary_get_value(v4, "1");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v11, "initWithXPCEncoding:", v12);

LABEL_7:
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__SSKeychain__sendMessage_completionBlock___block_invoke_2;
    block[3] = &unk_1E47B8608;
    v16 = v8;
    v14 = v7;
    v15 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __43__SSKeychain__sendMessage_completionBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
