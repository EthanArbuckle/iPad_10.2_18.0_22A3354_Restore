@implementation SSVRepairApplicationRequest

- (SSVRepairApplicationRequest)initWithBundleID:(id)a3 accountIdentifier:(id)a4 claimStyle:(int64_t)a5
{
  id v8;
  id v9;
  SSVRepairApplicationRequest *v10;
  SSVRepairApplicationRequest *v11;
  uint64_t v12;
  NSString *bundleID;
  uint64_t v14;
  NSNumber *accountDSID;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SSVRepairApplicationRequest;
  v10 = -[SSRequest init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_claimStyle = a5;
    v12 = objc_msgSend(v8, "copy");
    bundleID = v11->_bundleID;
    v11->_bundleID = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    accountDSID = v11->_accountDSID;
    v11->_accountDSID = (NSNumber *)v14;

  }
  return v11;
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
      v22 = "-[SSVRepairApplicationRequest startWithResponseBlock:]";
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
  v19[2] = __54__SSVRepairApplicationRequest_startWithResponseBlock___block_invoke;
  v19[3] = &unk_1E47B8630;
  v19[4] = self;
  v20 = v4;
  v17 = v4;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 148, v19);

}

void __54__SSVRepairApplicationRequest_startWithResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  CFArrayRef v7;
  BOOL v8;
  NSObject *v9;
  id v10;
  id v11;
  const __CFArray *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  CFArrayRef v19;
  id v20;
  id v21;
  BOOL v22;

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
        objc_opt_class();
        v7 = SSXPCDictionaryCopyCFObjectWithClass(v4, "3");
        v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
        xpc_dictionary_get_value(v4, "2");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)objc_msgSend(v13, "initWithXPCEncoding:", v14);

        v8 = xpc_dictionary_get_BOOL(v4, "1");
        if (v8)
        {
LABEL_10:
          dispatch_get_global_queue(0, 0);
          v9 = objc_claimAutoreleasedReturnValue();
          v15 = MEMORY[0x1E0C809B0];
          v16 = 3221225472;
          v17 = __54__SSVRepairApplicationRequest_startWithResponseBlock___block_invoke_2;
          v18 = &unk_1E47B9800;
          v10 = *(id *)(a1 + 40);
          v20 = v6;
          v21 = v10;
          v22 = v8;
          v19 = v7;
          v11 = v6;
          v12 = v7;
          dispatch_async(v9, &v15);

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
    v8 = 0;
    goto LABEL_8;
  }
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest", v15, v16, v17, v18);

}

uint64_t __54__SSVRepairApplicationRequest_startWithResponseBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_bundleID);
  SSXPCDictionarySetObject(v3, "1", self->_accountDSID);
  xpc_dictionary_set_int64(v3, "2", self->_claimStyle);
  return v3;
}

- (SSVRepairApplicationRequest)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSVRepairApplicationRequest *v6;
  uint64_t v8;
  uint64_t v9;
  NSString *bundleID;
  uint64_t v11;
  uint64_t v12;
  NSNumber *accountDSID;
  objc_super v14;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v14.receiver = self;
    v14.super_class = (Class)SSVRepairApplicationRequest;
    v6 = -[SSRequest init](&v14, sel_init);
    if (v6)
    {
      v8 = objc_opt_class();
      v9 = SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
      bundleID = v6->_bundleID;
      v6->_bundleID = (NSString *)v9;

      v11 = objc_opt_class();
      v12 = SSXPCDictionaryCopyObjectWithClass(v5, "1", v11);
      accountDSID = v6->_accountDSID;
      v6->_accountDSID = (NSNumber *)v12;

      v6->_claimStyle = xpc_dictionary_get_int64(v5, "2");
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (NSNumber)accountDSID
{
  return self->_accountDSID;
}

- (int64_t)claimStyle
{
  return self->_claimStyle;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountDSID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
