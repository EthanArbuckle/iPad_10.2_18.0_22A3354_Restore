@implementation SSVInstallManagedApplicationRequest

- (SSVInstallManagedApplicationRequest)initWithItemIdentifer:(id)a3 externalVersionIdentifier:(id)a4 bundleIdentifier:(id)a5 bundleVersion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SSVInstallManagedApplicationRequest *v14;
  uint64_t v15;
  NSString *bundleIdentifier;
  uint64_t v17;
  NSString *bundleVersion;
  uint64_t v19;
  NSNumber *externalVersionIdentifier;
  uint64_t v21;
  NSString *itemIdentifier;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SSVInstallManagedApplicationRequest;
  v14 = -[SSRequest init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v13, "copy");
    bundleVersion = v14->_bundleVersion;
    v14->_bundleVersion = (NSString *)v17;

    v19 = objc_msgSend(v11, "copy");
    externalVersionIdentifier = v14->_externalVersionIdentifier;
    v14->_externalVersionIdentifier = (NSNumber *)v19;

    v21 = objc_msgSend(v10, "copy");
    itemIdentifier = v14->_itemIdentifier;
    v14->_itemIdentifier = (NSString *)v21;

  }
  return v14;
}

- (SSVInstallManagedApplicationRequest)initWithItemIdentifer:(id)a3 externalVersionIdentifier:(id)a4 bundleIdentifier:(id)a5 bundleVersion:(id)a6 skipDownloads:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  SSVInstallManagedApplicationRequest *v16;
  uint64_t v17;
  NSString *bundleIdentifier;
  uint64_t v19;
  NSString *bundleVersion;
  uint64_t v21;
  NSNumber *externalVersionIdentifier;
  uint64_t v23;
  NSString *itemIdentifier;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)SSVInstallManagedApplicationRequest;
  v16 = -[SSRequest init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v14, "copy");
    bundleIdentifier = v16->_bundleIdentifier;
    v16->_bundleIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v15, "copy");
    bundleVersion = v16->_bundleVersion;
    v16->_bundleVersion = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    externalVersionIdentifier = v16->_externalVersionIdentifier;
    v16->_externalVersionIdentifier = (NSNumber *)v21;

    v23 = objc_msgSend(v12, "copy");
    itemIdentifier = v16->_itemIdentifier;
    v16->_itemIdentifier = (NSString *)v23;

    v16->_skipDownloads = a7;
  }

  return v16;
}

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
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v21 = 136446210;
      v22 = "-[SSVInstallManagedApplicationRequest startWithResponseBlock:]";
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
  v19[2] = __62__SSVInstallManagedApplicationRequest_startWithResponseBlock___block_invoke;
  v19[3] = &unk_1E47B8630;
  v19[4] = self;
  v20 = v4;
  v17 = v4;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 112, v19);

}

void __62__SSVInstallManagedApplicationRequest_startWithResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;
  BOOL v16;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E0C81258])
    {
      v5 = 121;
    }
    else
    {
      if (v3 && MEMORY[0x1A85863E4](v3) == MEMORY[0x1E0C812F8])
      {
        v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
        xpc_dictionary_get_value(v4, "2");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)objc_msgSend(v11, "initWithXPCEncoding:", v12);

        v7 = xpc_dictionary_get_BOOL(v4, "1");
        if (v7)
        {
LABEL_10:
          dispatch_get_global_queue(0, 0);
          v8 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __62__SSVInstallManagedApplicationRequest_startWithResponseBlock___block_invoke_2;
          block[3] = &unk_1E47BD240;
          v9 = *(id *)(a1 + 40);
          v16 = v7;
          v14 = v6;
          v15 = v9;
          v10 = v6;
          dispatch_async(v8, block);

          goto LABEL_11;
        }
LABEL_8:
        if (!v6)
        {
          SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_10;
      }
      v5 = 111;
    }
    SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    goto LABEL_8;
  }
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest");

}

uint64_t __62__SSVInstallManagedApplicationRequest_startWithResponseBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)startWithDetailedResponseBlock:(id)a3
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
      v22 = "-[SSVInstallManagedApplicationRequest startWithDetailedResponseBlock:]";
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
  v19[2] = __70__SSVInstallManagedApplicationRequest_startWithDetailedResponseBlock___block_invoke;
  v19[3] = &unk_1E47B8630;
  v19[4] = self;
  v20 = v4;
  v17 = v4;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 113, v19);

}

void __70__SSVInstallManagedApplicationRequest_startWithDetailedResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  BOOL v24;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E0C81258])
    {
      v5 = 121;
    }
    else
    {
      if (v3 && MEMORY[0x1A85863E4](v3) == MEMORY[0x1E0C812F8])
      {
        v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
        xpc_dictionary_get_value(v4, "2");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)objc_msgSend(v12, "initWithXPCEncoding:", v13);

        v7 = xpc_dictionary_get_BOOL(v4, "1");
        v14 = objc_opt_class();
        v15 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "3", v14);
        v16 = v15;
        if (v15)
          v8 = objc_msgSend(v15, "integerValue");
        else
          v8 = 0;

        if (v7)
          goto LABEL_10;
        goto LABEL_8;
      }
      v5 = 111;
    }
    SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v8 = 0;
LABEL_8:
    if (!v6)
    {
      SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_10:
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __70__SSVInstallManagedApplicationRequest_startWithDetailedResponseBlock___block_invoke_2;
    v20 = &unk_1E47BD268;
    v10 = *(id *)(a1 + 40);
    v24 = v7;
    v22 = v10;
    v23 = v8;
    v21 = v6;
    v11 = v6;
    dispatch_async(v9, &v17);

  }
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest", v17, v18, v19, v20);

}

uint64_t __70__SSVInstallManagedApplicationRequest_startWithDetailedResponseBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)startWithMetadataResponseBlock:(id)a3
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
      v22 = "-[SSVInstallManagedApplicationRequest startWithMetadataResponseBlock:]";
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
  v19[2] = __70__SSVInstallManagedApplicationRequest_startWithMetadataResponseBlock___block_invoke;
  v19[3] = &unk_1E47B8630;
  v19[4] = self;
  v20 = v4;
  v17 = v4;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 113, v19);

}

void __70__SSVInstallManagedApplicationRequest_startWithMetadataResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  BOOL v25;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E0C81258])
    {
      v5 = 121;
    }
    else
    {
      if (v3 && MEMORY[0x1A85863E4](v3) == MEMORY[0x1E0C812F8])
      {
        v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
        xpc_dictionary_get_value(v4, "2");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)objc_msgSend(v14, "initWithXPCEncoding:", v15);

        v7 = xpc_dictionary_get_BOOL(v4, "1");
        v16 = objc_opt_class();
        v17 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "3", v16);
        v18 = v17;
        if (v17)
          v8 = objc_msgSend(v17, "integerValue");
        else
          v8 = 0;
        v19 = objc_opt_class();
        v9 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "5", v19);

        if (v7)
          goto LABEL_10;
        goto LABEL_8;
      }
      v5 = 111;
    }
    SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v8 = 0;
    v9 = 0;
LABEL_8:
    if (!v6)
    {
      SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_10:
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__SSVInstallManagedApplicationRequest_startWithMetadataResponseBlock___block_invoke_2;
    block[3] = &unk_1E47BD290;
    v11 = *(id *)(a1 + 40);
    v25 = v7;
    v23 = v11;
    v24 = v8;
    v21 = v9;
    v22 = v6;
    v12 = v6;
    v13 = v9;
    dispatch_async(v10, block);

  }
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest");

}

uint64_t __70__SSVInstallManagedApplicationRequest_startWithMetadataResponseBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_itemIdentifier);
  SSXPCDictionarySetObject(v3, "1", self->_externalVersionIdentifier);
  SSXPCDictionarySetObject(v3, "2", self->_bundleIdentifier);
  SSXPCDictionarySetObject(v3, "3", self->_bundleVersion);
  xpc_dictionary_set_BOOL(v3, "4", self->_skipDownloads);
  return v3;
}

- (SSVInstallManagedApplicationRequest)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSVInstallManagedApplicationRequest *v6;
  uint64_t v8;
  uint64_t v9;
  NSString *itemIdentifier;
  uint64_t v11;
  uint64_t v12;
  NSNumber *externalVersionIdentifier;
  uint64_t v14;
  uint64_t v15;
  NSString *bundleIdentifier;
  uint64_t v17;
  uint64_t v18;
  NSString *bundleVersion;
  objc_super v20;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v20.receiver = self;
    v20.super_class = (Class)SSVInstallManagedApplicationRequest;
    v6 = -[SSRequest init](&v20, sel_init);
    if (v6)
    {
      v8 = objc_opt_class();
      v9 = SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
      itemIdentifier = v6->_itemIdentifier;
      v6->_itemIdentifier = (NSString *)v9;

      v11 = objc_opt_class();
      v12 = SSXPCDictionaryCopyObjectWithClass(v5, "1", v11);
      externalVersionIdentifier = v6->_externalVersionIdentifier;
      v6->_externalVersionIdentifier = (NSNumber *)v12;

      v14 = objc_opt_class();
      v15 = SSXPCDictionaryCopyObjectWithClass(v5, "2", v14);
      bundleIdentifier = v6->_bundleIdentifier;
      v6->_bundleIdentifier = (NSString *)v15;

      v17 = objc_opt_class();
      v18 = SSXPCDictionaryCopyObjectWithClass(v5, "2", v17);
      bundleVersion = v6->_bundleVersion;
      v6->_bundleVersion = (NSString *)v18;

      v6->_skipDownloads = xpc_dictionary_get_BOOL(v5, "4");
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)externalVersionIdentifier
{
  return self->_externalVersionIdentifier;
}

- (void)setExternalVersionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)skipDownloads
{
  return self->_skipDownloads;
}

- (void)setSkipDownloads:(BOOL)a3
{
  self->_skipDownloads = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
