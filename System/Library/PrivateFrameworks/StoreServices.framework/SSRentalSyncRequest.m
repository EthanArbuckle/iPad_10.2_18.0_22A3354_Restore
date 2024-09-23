@implementation SSRentalSyncRequest

- (SSRentalSyncRequest)initWithSinfs:(id)a3
{
  id v4;
  SSRentalSyncRequest *v5;
  uint64_t v6;
  NSArray *sinfs;
  objc_super v9;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v9.receiver = self;
    v9.super_class = (Class)SSRentalSyncRequest;
    v5 = -[SSRequest init](&v9, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      sinfs = v5->_sinfs;
      v5->_sinfs = (NSArray *)v6;

    }
  }
  else
  {

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Must have at least one sinf"));
    v5 = 0;
  }

  return v5;
}

- (SSRentalSyncRequest)initWithAccountIdentifier:(id)a3
{
  id v4;
  SSRentalSyncRequest *v5;
  uint64_t v6;
  NSNumber *accountIdentifier;
  objc_super v9;

  v4 = a3;
  if (objc_msgSend(v4, "unsignedLongLongValue"))
  {
    v9.receiver = self;
    v9.super_class = (Class)SSRentalSyncRequest;
    v5 = -[SSRequest init](&v9, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      accountIdentifier = v5->_accountIdentifier;
      v5->_accountIdentifier = (NSNumber *)v6;

    }
  }
  else
  {

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Must have a valid account identifier"));
    v5 = 0;
  }

  return v5;
}

- (void)startWithConnectionResponseBlock:(id)a3
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
      v22 = "-[SSRentalSyncRequest startWithConnectionResponseBlock:]";
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
  v19[2] = __56__SSRentalSyncRequest_startWithConnectionResponseBlock___block_invoke;
  v19[3] = &unk_1E47B8630;
  v19[4] = self;
  v20 = v4;
  v17 = v4;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 1016, v19);

}

void __56__SSRentalSyncRequest_startWithConnectionResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  SSURLConnectionResponse *v8;
  void *v9;
  SSURLConnectionResponse *v10;
  NSObject *v11;
  id v12;
  id v13;
  SSURLConnectionResponse *v14;
  _QWORD block[4];
  SSURLConnectionResponse *v16;
  id v17;
  id v18;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    if (v3 == (id)MEMORY[0x1E0C81258])
    {
      SSError((uint64_t)CFSTR("SSErrorDomain"), 121, 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
    }
    else
    {
      v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
      xpc_dictionary_get_value(v4, "1");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "initWithXPCEncoding:", v6);

      v8 = [SSURLConnectionResponse alloc];
      xpc_dictionary_get_value(v4, "2");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SSURLConnectionResponse initWithXPCEncoding:](v8, "initWithXPCEncoding:", v9);

    }
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__SSRentalSyncRequest_startWithConnectionResponseBlock___block_invoke_2;
    block[3] = &unk_1E47B8608;
    v12 = *(id *)(a1 + 40);
    v17 = v7;
    v18 = v12;
    v16 = v10;
    v13 = v7;
    v14 = v10;
    dispatch_async(v11, block);

  }
  objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest");

}

uint64_t __56__SSRentalSyncRequest_startWithConnectionResponseBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "50", (__CFString *)self->_accountIdentifier);
  SSXPCDictionarySetCFObject(v3, "51", (__CFString *)self->_sinfs);
  return v3;
}

- (SSRentalSyncRequest)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  void *sinfs;
  NSNumber *v7;
  NSNumber *accountIdentifier;
  NSArray *v9;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    objc_opt_class();
    v7 = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass(v5, "50");
    accountIdentifier = self->_accountIdentifier;
    self->_accountIdentifier = v7;

    objc_opt_class();
    v9 = (NSArray *)SSXPCDictionaryCopyCFObjectWithClass(v5, "51");
    sinfs = self->_sinfs;
    self->_sinfs = v9;
  }
  else
  {
    sinfs = self;
    self = 0;
  }

  return self;
}

- (NSArray)sinfs
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (NSNumber)accountIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (NSNumber)rentalKeyIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rentalKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_sinfs, 0);
}

@end
