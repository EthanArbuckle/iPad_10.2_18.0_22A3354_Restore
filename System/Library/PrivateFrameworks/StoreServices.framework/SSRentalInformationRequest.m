@implementation SSRentalInformationRequest

- (SSRentalInformationRequest)initWithAccountIdentifier:(id)a3 rentalKeyIdentifier:(id)a4
{
  id v6;
  id v7;
  SSRentalInformationRequest *v8;
  uint64_t v9;
  NSNumber *accountIdentifier;
  uint64_t v11;
  NSNumber *rentalKeyIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SSRentalInformationRequest;
  v8 = -[SSRequest init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    accountIdentifier = v8->_accountIdentifier;
    v8->_accountIdentifier = (NSNumber *)v9;

    v11 = objc_msgSend(v7, "copy");
    rentalKeyIdentifier = v8->_rentalKeyIdentifier;
    v8->_rentalKeyIdentifier = (NSNumber *)v11;

  }
  return v8;
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
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v21 = 136446210;
      v22 = "-[SSRentalInformationRequest startWithResponseBlock:]";
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
  v19[2] = __53__SSRentalInformationRequest_startWithResponseBlock___block_invoke;
  v19[3] = &unk_1E47B8630;
  v19[4] = self;
  v20 = v4;
  v17 = v4;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 170, v19);

}

void __53__SSRentalInformationRequest_startWithResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;

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
        v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
        xpc_dictionary_get_value(v4, "2");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)objc_msgSend(v13, "initWithXPCEncoding:", v14);

        v7 = xpc_dictionary_get_BOOL(v4, "1");
        v15 = objc_opt_class();
        v8 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "5", v15);
        if (v7)
        {
LABEL_10:
          dispatch_get_global_queue(0, 0);
          v9 = objc_claimAutoreleasedReturnValue();
          v16 = MEMORY[0x1E0C809B0];
          v17 = 3221225472;
          v18 = __53__SSRentalInformationRequest_startWithResponseBlock___block_invoke_2;
          v19 = &unk_1E47B9800;
          v10 = *(id *)(a1 + 40);
          v21 = v6;
          v22 = v10;
          v23 = v7;
          v20 = v8;
          v11 = v6;
          v12 = v8;
          dispatch_async(v9, &v16);

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
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest", v16, v17, v18, v19);

}

uint64_t __53__SSRentalInformationRequest_startWithResponseBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "50", (__CFString *)self->_accountIdentifier);
  SSXPCDictionarySetCFObject(v3, "51", (__CFString *)self->_rentalKeyIdentifier);
  return v3;
}

- (SSRentalInformationRequest)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  void *rentalKeyIdentifier;
  NSNumber *v7;
  NSNumber *accountIdentifier;
  NSNumber *v9;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    objc_opt_class();
    v7 = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass(v5, "50");
    accountIdentifier = self->_accountIdentifier;
    self->_accountIdentifier = v7;

    objc_opt_class();
    v9 = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass(v5, "51");
    rentalKeyIdentifier = self->_rentalKeyIdentifier;
    self->_rentalKeyIdentifier = v9;
  }
  else
  {
    rentalKeyIdentifier = self;
    self = 0;
  }

  return self;
}

- (NSNumber)accountIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (NSNumber)rentalKeyIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rentalKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
