@implementation SSBiometrics

- (SSBiometrics)init
{
  SSBiometrics *v2;
  SSXPCConnection *v3;
  SSXPCConnection *connection;
  id v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *clientQueue;
  NSObject *v8;
  NSObject *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SSBiometrics;
  v2 = -[SSBiometrics init](&v11, sel_init);
  if (v2)
  {
    v3 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    connection = v2->_connection;
    v2->_connection = v3;

    v5 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.StoreServices.SSBiometrics.%p"), v2));
    v6 = dispatch_queue_create((const char *)objc_msgSend(v5, "UTF8String"), 0);
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v6;

    v8 = v2->_clientQueue;
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v8, v9);

  }
  return v2;
}

- (void)getAllCachedBiometricHTTPHeadersWithToken:(id)a3 accountID:(id)a4 evict:(BOOL)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  xpc_object_t v25;
  SSXPCConnection *connection;
  id v27;
  uint64_t v28;
  _QWORD v29[5];
  id v30;
  int v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a4;
  v12 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = objc_msgSend(v13, "shouldLog");
    if (objc_msgSend(v13, "shouldLogToDisk"))
      v15 = v14 | 2;
    else
      v15 = v14;
    objc_msgSend(v13, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      v17 = v15;
    else
      v17 = v15 & 2;
    if (v17)
    {
      v31 = 136446210;
      v32 = "-[SSBiometrics getAllCachedBiometricHTTPHeadersWithToken:accountID:evict:completionBlock:]";
      LODWORD(v28) = 12;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v18, 4, &v31, v28);
      v16 = objc_claimAutoreleasedReturnValue();
      free(v18);
      SSFileLog(v13, CFSTR("%@"), v19, v20, v21, v22, v23, v24, (uint64_t)v16);
    }

    goto LABEL_15;
  }
LABEL_16:
  v25 = SSXPCCreateMessageDictionary(203);
  SSXPCDictionarySetObject(v25, "1", v12);

  SSXPCDictionarySetObject(v25, "2", v11);
  xpc_dictionary_set_BOOL(v25, "3", a5);
  connection = self->_connection;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __90__SSBiometrics_getAllCachedBiometricHTTPHeadersWithToken_accountID_evict_completionBlock___block_invoke;
  v29[3] = &unk_1E47B8630;
  v29[4] = self;
  v30 = v10;
  v27 = v10;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v25, v29);

}

void __90__SSBiometrics_getAllCachedBiometricHTTPHeadersWithToken_accountID_evict_completionBlock___block_invoke(uint64_t a1, void *a2)
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
  xpc_dictionary_get_value(v4, "2");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v11, "initWithXPCEncoding:", v12);

LABEL_7:
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__SSBiometrics_getAllCachedBiometricHTTPHeadersWithToken_accountID_evict_completionBlock___block_invoke_2;
    block[3] = &unk_1E47B8608;
    v16 = v8;
    v14 = v7;
    v15 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __90__SSBiometrics_getAllCachedBiometricHTTPHeadersWithToken_accountID_evict_completionBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getCachedBiometricAuthenticationContextWithToken:(id)a3 evict:(BOOL)a4 completionBlock:(id)a5
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
  SSXPCConnection *connection;
  id v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  int v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
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
      v28 = 136446210;
      v29 = "-[SSBiometrics getCachedBiometricAuthenticationContextWithToken:evict:completionBlock:]";
      LODWORD(v25) = 12;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, &v28, v25);
      v13 = objc_claimAutoreleasedReturnValue();
      free(v15);
      SSFileLog(v10, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v13);
    }

    goto LABEL_15;
  }
LABEL_16:
  v22 = SSXPCCreateMessageDictionary(195);
  SSXPCDictionarySetObject(v22, "1", v9);

  xpc_dictionary_set_BOOL(v22, "2", a4);
  connection = self->_connection;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __87__SSBiometrics_getCachedBiometricAuthenticationContextWithToken_evict_completionBlock___block_invoke;
  v26[3] = &unk_1E47B8630;
  v26[4] = self;
  v27 = v8;
  v24 = v8;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v22, v26);

}

void __87__SSBiometrics_getCachedBiometricAuthenticationContextWithToken_evict_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  SSBiometricAuthenticationContext *v7;
  void *v8;
  NSObject *v9;
  SSBiometricAuthenticationContext *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD block[4];
  SSBiometricAuthenticationContext *v15;
  id v16;
  id v17;

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
  v10 = [SSBiometricAuthenticationContext alloc];
  xpc_dictionary_get_value(v4, "0");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SSBiometricAuthenticationContext initWithXPCEncoding:](v10, "initWithXPCEncoding:", v11);

  v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
  xpc_dictionary_get_value(v4, "1");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v12, "initWithXPCEncoding:", v13);

LABEL_7:
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__SSBiometrics_getCachedBiometricAuthenticationContextWithToken_evict_completionBlock___block_invoke_2;
    block[3] = &unk_1E47B8608;
    v17 = v8;
    v15 = v7;
    v16 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __87__SSBiometrics_getCachedBiometricAuthenticationContextWithToken_evict_completionBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getCachedBiometricHTTPHeadersWithToken:(id)a3 accountID:(id)a4 evict:(BOOL)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  xpc_object_t v25;
  SSXPCConnection *connection;
  id v27;
  uint64_t v28;
  _QWORD v29[5];
  id v30;
  int v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a4;
  v12 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = objc_msgSend(v13, "shouldLog");
    if (objc_msgSend(v13, "shouldLogToDisk"))
      v15 = v14 | 2;
    else
      v15 = v14;
    objc_msgSend(v13, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      v17 = v15;
    else
      v17 = v15 & 2;
    if (v17)
    {
      v31 = 136446210;
      v32 = "-[SSBiometrics getCachedBiometricHTTPHeadersWithToken:accountID:evict:completionBlock:]";
      LODWORD(v28) = 12;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v18, 4, &v31, v28);
      v16 = objc_claimAutoreleasedReturnValue();
      free(v18);
      SSFileLog(v13, CFSTR("%@"), v19, v20, v21, v22, v23, v24, (uint64_t)v16);
    }

    goto LABEL_15;
  }
LABEL_16:
  v25 = SSXPCCreateMessageDictionary(196);
  SSXPCDictionarySetObject(v25, "1", v12);

  SSXPCDictionarySetObject(v25, "2", v11);
  xpc_dictionary_set_BOOL(v25, "3", a5);
  connection = self->_connection;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __87__SSBiometrics_getCachedBiometricHTTPHeadersWithToken_accountID_evict_completionBlock___block_invoke;
  v29[3] = &unk_1E47B8630;
  v29[4] = self;
  v30 = v10;
  v27 = v10;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v25, v29);

}

void __87__SSBiometrics_getCachedBiometricHTTPHeadersWithToken_accountID_evict_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

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
    v8 = 0;
    v9 = 0;
    v10 = 0;
    goto LABEL_7;
  }
  v13 = objc_opt_class();
  v7 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "0", v13);
  v14 = objc_opt_class();
  v8 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "1", v14);
  v15 = objc_opt_class();
  v9 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "2", v15);
  v16 = objc_opt_class();
  v10 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "3", v16);
  v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
  xpc_dictionary_get_value(v4, "4");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v17, "initWithXPCEncoding:", v18);

LABEL_7:
  v11 = *(void **)(a1 + 40);
  if (v11)
  {
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __87__SSBiometrics_getCachedBiometricHTTPHeadersWithToken_accountID_evict_completionBlock___block_invoke_2;
    v19[3] = &unk_1E47C0000;
    v25 = v11;
    v20 = v7;
    v21 = v8;
    v22 = v9;
    v23 = v10;
    v24 = v6;
    dispatch_async(v12, v19);

  }
}

uint64_t __87__SSBiometrics_getCachedBiometricHTTPHeadersWithToken_accountID_evict_completionBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[9] + 16))(a1[9], a1[4], a1[5], a1[6], a1[7], a1[8]);
}

- (void)getConstraintsDictionaryForPurpose:(int64_t)a3 completion:(id)a4
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
  SSXPCConnection *connection;
  id v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;
  int v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
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
      v25 = 136446210;
      v26 = "-[SSBiometrics getConstraintsDictionaryForPurpose:completion:]";
      LODWORD(v22) = 12;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v25, v22);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog(v7, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v10);
    }

    goto LABEL_15;
  }
LABEL_16:
  v19 = SSXPCCreateMessageDictionary(214);
  xpc_dictionary_set_BOOL(v19, "1", a3 == 0);
  connection = self->_connection;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __62__SSBiometrics_getConstraintsDictionaryForPurpose_completion___block_invoke;
  v23[3] = &unk_1E47B8630;
  v23[4] = self;
  v24 = v6;
  v21 = v6;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v19, v23);

}

void __62__SSBiometrics_getConstraintsDictionaryForPurpose_completion___block_invoke(uint64_t a1, void *a2)
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
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__SSBiometrics_getConstraintsDictionaryForPurpose_completion___block_invoke_2;
    block[3] = &unk_1E47B8608;
    v16 = v8;
    v14 = v7;
    v15 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __62__SSBiometrics_getConstraintsDictionaryForPurpose_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getCurrentACLVersionWithCompletion:(id)a3
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
  xpc_object_t v17;
  SSXPCConnection *connection;
  id v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  int v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
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
      v23 = 136446210;
      v24 = "-[SSBiometrics getCurrentACLVersionWithCompletion:]";
      LODWORD(v20) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v23, v20);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v17 = SSXPCCreateMessageDictionary(213);
  connection = self->_connection;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __51__SSBiometrics_getCurrentACLVersionWithCompletion___block_invoke;
  v21[3] = &unk_1E47B8630;
  v21[4] = self;
  v22 = v4;
  v19 = v4;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v17, v21);

}

void __51__SSBiometrics_getCurrentACLVersionWithCompletion___block_invoke(uint64_t a1, void *a2)
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
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__SSBiometrics_getCurrentACLVersionWithCompletion___block_invoke_2;
    block[3] = &unk_1E47B8608;
    v16 = v8;
    v14 = v7;
    v15 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __51__SSBiometrics_getCurrentACLVersionWithCompletion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getStateWithCompletionBlock:(id)a3
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
  xpc_object_t v17;
  SSXPCConnection *connection;
  id v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  int v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
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
      v23 = 136446210;
      v24 = "-[SSBiometrics getStateWithCompletionBlock:]";
      LODWORD(v20) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v23, v20);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v17 = SSXPCCreateMessageDictionary(122);
  connection = self->_connection;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __44__SSBiometrics_getStateWithCompletionBlock___block_invoke;
  v21[3] = &unk_1E47B8630;
  v21[4] = self;
  v22 = v4;
  v19 = v4;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v17, v21);

}

void __44__SSBiometrics_getStateWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int64_t int64;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  int64_t v15;

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
    int64 = 5;
    goto LABEL_7;
  }
  int64 = xpc_dictionary_get_int64(v4, "0");
  v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
  xpc_dictionary_get_value(v4, "1");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v10, "initWithXPCEncoding:", v11);

LABEL_7:
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__SSBiometrics_getStateWithCompletionBlock___block_invoke_2;
    block[3] = &unk_1E47B8658;
    v14 = v8;
    v15 = int64;
    v13 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __44__SSBiometrics_getStateWithCompletionBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)renewPurchaseTokenWithAuthToken:(id)a3 completionBlock:(id)a4
{
  -[SSBiometrics setEnabled:withAuthToken:completionBlock:](self, "setEnabled:withAuthToken:completionBlock:", 1, a3, a4);
}

- (void)resetAccount:(id)a3 withCompletionBlock:(id)a4
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
  uint64_t v21;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
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
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      v12 = v10;
    else
      v12 = v10 & 2;
    if (v12)
    {
      v22 = 136446210;
      v23 = "-[SSBiometrics resetAccount:withCompletionBlock:]";
      LODWORD(v21) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v22, v21);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  v20 = SSXPCCreateMessageDictionary(125);
  SSXPCDictionarySetObject(v20, "1", v7);

  -[SSBiometrics _sendMessage:withCompletionBlock:](self, "_sendMessage:withCompletionBlock:", v20, v6);
}

- (void)resetWithCompletionBlock:(id)a3
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
  xpc_object_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
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
      v19 = 136446210;
      v20 = "-[SSBiometrics resetWithCompletionBlock:]";
      LODWORD(v18) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v19, v18);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v17 = SSXPCCreateMessageDictionary(124);
  -[SSBiometrics _sendMessage:withCompletionBlock:](self, "_sendMessage:withCompletionBlock:", v17, v4);

}

- (void)setEnabled:(BOOL)a3 withCompletionBlock:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0C99D50];
  v7 = a4;
  objc_msgSend(v6, "data");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SSBiometrics setEnabled:withAuthToken:completionBlock:](self, "setEnabled:withAuthToken:completionBlock:", v4, v8, v7);

}

- (void)setEnabled:(BOOL)a3 withAuthToken:(id)a4 completionBlock:(id)a5
{
  id v8;
  __CFString *v9;
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
  uint64_t v23;
  int v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (__CFString *)a4;
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
      v24 = 136446210;
      v25 = "-[SSBiometrics setEnabled:withAuthToken:completionBlock:]";
      LODWORD(v23) = 12;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, &v24, v23);
      v13 = objc_claimAutoreleasedReturnValue();
      free(v15);
      SSFileLog(v10, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v13);
    }

    goto LABEL_15;
  }
LABEL_16:
  v22 = SSXPCCreateMessageDictionary(123);
  xpc_dictionary_set_BOOL(v22, "1", a3);
  SSXPCDictionarySetCFObject(v22, "2", v9);

  -[SSBiometrics _sendMessage:withCompletionBlock:](self, "_sendMessage:withCompletionBlock:", v22, v8);
}

- (void)setAllowed:(BOOL)a3 completionBlock:(id)a4
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
  uint64_t v20;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
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
      v21 = 136446210;
      v22 = "-[SSBiometrics setAllowed:completionBlock:]";
      LODWORD(v20) = 12;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v21, v20);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog(v7, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v10);
    }

    goto LABEL_15;
  }
LABEL_16:
  v19 = SSXPCCreateMessageDictionary(126);
  xpc_dictionary_set_BOOL(v19, "1", a3);
  -[SSBiometrics _sendMessage:withCompletionBlock:](self, "_sendMessage:withCompletionBlock:", v19, v6);

}

- (void)tokenUpdateDidFinishWithLogKey:(id)a3 completion:(id)a4
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
      v27 = "-[SSBiometrics tokenUpdateDidFinishWithLogKey:completion:]";
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
  v20 = SSXPCCreateMessageDictionary(206);
  SSXPCDictionarySetObject(v20, "1", v7);

  connection = self->_connection;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __58__SSBiometrics_tokenUpdateDidFinishWithLogKey_completion___block_invoke;
  v24[3] = &unk_1E47B8630;
  v24[4] = self;
  v25 = v6;
  v22 = v6;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v20, v24);

}

void __58__SSBiometrics_tokenUpdateDidFinishWithLogKey_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

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
    goto LABEL_7;
  }
  v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
  xpc_dictionary_get_value(v4, "0");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v9, "initWithXPCEncoding:", v10);

LABEL_7:
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__SSBiometrics_tokenUpdateDidFinishWithLogKey_completion___block_invoke_2;
    v11[3] = &unk_1E47B8A98;
    v13 = v7;
    v12 = v6;
    dispatch_async(v8, v11);

  }
}

uint64_t __58__SSBiometrics_tokenUpdateDidFinishWithLogKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)tokenUpdateShouldStartWithLogKey:(id)a3 completion:(id)a4
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
      v27 = "-[SSBiometrics tokenUpdateShouldStartWithLogKey:completion:]";
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
  v20 = SSXPCCreateMessageDictionary(207);
  SSXPCDictionarySetObject(v20, "1", v7);

  connection = self->_connection;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __60__SSBiometrics_tokenUpdateShouldStartWithLogKey_completion___block_invoke;
  v24[3] = &unk_1E47B8630;
  v24[4] = self;
  v25 = v6;
  v22 = v6;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v20, v24);

}

void __60__SSBiometrics_tokenUpdateShouldStartWithLogKey_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  BOOL v15;

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
    v7 = 1;
    goto LABEL_7;
  }
  v7 = xpc_dictionary_get_BOOL(v4, "0");
  v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
  xpc_dictionary_get_value(v4, "1");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v10, "initWithXPCEncoding:", v11);

LABEL_7:
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__SSBiometrics_tokenUpdateShouldStartWithLogKey_completion___block_invoke_2;
    block[3] = &unk_1E47BD240;
    v14 = v8;
    v15 = v7;
    v13 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __60__SSBiometrics_tokenUpdateShouldStartWithLogKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)tokenUpdateStateWithCompletionBlock:(id)a3
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
  xpc_object_t v17;
  SSXPCConnection *connection;
  id v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  int v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
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
      v23 = 136446210;
      v24 = "-[SSBiometrics tokenUpdateStateWithCompletionBlock:]";
      LODWORD(v20) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v23, v20);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v17 = SSXPCCreateMessageDictionary(208);
  connection = self->_connection;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __52__SSBiometrics_tokenUpdateStateWithCompletionBlock___block_invoke;
  v21[3] = &unk_1E47B8630;
  v21[4] = self;
  v22 = v4;
  v19 = v4;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v17, v21);

}

void __52__SSBiometrics_tokenUpdateStateWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int64_t int64;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  int64_t v15;

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
    int64 = 0;
    goto LABEL_7;
  }
  int64 = xpc_dictionary_get_int64(v4, "0");
  v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
  xpc_dictionary_get_value(v4, "1");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v10, "initWithXPCEncoding:", v11);

LABEL_7:
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__SSBiometrics_tokenUpdateStateWithCompletionBlock___block_invoke_2;
    block[3] = &unk_1E47B8658;
    v14 = v8;
    v15 = int64;
    v13 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __52__SSBiometrics_tokenUpdateStateWithCompletionBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)getIdentityMapCountWithCompletionBlock:(id)a3
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
  xpc_object_t v17;
  SSXPCConnection *connection;
  id v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  int v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
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
      v23 = 136446210;
      v24 = "-[SSBiometrics getIdentityMapCountWithCompletionBlock:]";
      LODWORD(v20) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v23, v20);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v17 = SSXPCCreateMessageDictionary(182);
  connection = self->_connection;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __55__SSBiometrics_getIdentityMapCountWithCompletionBlock___block_invoke;
  v21[3] = &unk_1E47B8630;
  v21[4] = self;
  v22 = v4;
  v19 = v4;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v17, v21);

}

void __55__SSBiometrics_getIdentityMapCountWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD block[4];
  id v15;
  id v16;
  uint64_t v17;

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
  v11 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "0", v10);
  v7 = objc_msgSend(v11, "unsignedIntegerValue");

  v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
  xpc_dictionary_get_value(v4, "1");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v12, "initWithXPCEncoding:", v13);

LABEL_7:
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__SSBiometrics_getIdentityMapCountWithCompletionBlock___block_invoke_2;
    block[3] = &unk_1E47B8658;
    v16 = v8;
    v17 = v7;
    v15 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __55__SSBiometrics_getIdentityMapCountWithCompletionBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)isIdentityMapValidForAccountIdentifier:(id)a3 completionBlock:(id)a4
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
  uint64_t v21;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
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
      v22 = 136446210;
      v23 = "-[SSBiometrics isIdentityMapValidForAccountIdentifier:completionBlock:]";
      LODWORD(v21) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v22, v21);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  v20 = SSXPCCreateMessageDictionary(183);
  SSXPCDictionarySetObject(v20, "1", v7);

  -[SSBiometrics _sendMessage:withCompletionBlock:](self, "_sendMessage:withCompletionBlock:", v20, v6);
}

- (void)saveIdentityMapForAccountIdentifier:(id)a3 completionBlock:(id)a4
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
  uint64_t v21;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
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
      v22 = 136446210;
      v23 = "-[SSBiometrics saveIdentityMapForAccountIdentifier:completionBlock:]";
      LODWORD(v21) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v22, v21);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  v20 = SSXPCCreateMessageDictionary(184);
  SSXPCDictionarySetObject(v20, "1", v7);

  -[SSBiometrics _sendMessage:withCompletionBlock:](self, "_sendMessage:withCompletionBlock:", v20, v6);
}

- (void)_sendMessage:(id)a3 withCompletionBlock:(id)a4
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
  v9[2] = __49__SSBiometrics__sendMessage_withCompletionBlock___block_invoke;
  v9[3] = &unk_1E47B8630;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", a3, v9);

}

void __49__SSBiometrics__sendMessage_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  BOOL v15;

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
  v7 = xpc_dictionary_get_BOOL(v4, "0");
  v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
  xpc_dictionary_get_value(v4, "1");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v10, "initWithXPCEncoding:", v11);

LABEL_7:
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__SSBiometrics__sendMessage_withCompletionBlock___block_invoke_2;
    block[3] = &unk_1E47BD240;
    v14 = v8;
    v15 = v7;
    v13 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __49__SSBiometrics__sendMessage_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

@end
