@implementation SSRentalCheckoutRequest

- (SSRentalCheckoutRequest)init
{
  return -[SSRentalCheckoutRequest initWithSinfs:](self, "initWithSinfs:", 0);
}

- (SSRentalCheckoutRequest)initWithAccountIdentifier:(id)a3 rentalKeyIdentifier:(id)a4
{
  SSRentalCheckoutRequest *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  objc_super v12;

  if (!objc_msgSend(a3, "unsignedLongLongValue"))
  {

    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = CFSTR("Must have a valid account identifier");
LABEL_7:
    objc_msgSend(v8, "raise:format:", v9, v10);
    return 0;
  }
  if (!objc_msgSend(a4, "unsignedLongLongValue"))
  {

    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = CFSTR("Must have a valid rental key identifier");
    goto LABEL_7;
  }
  v12.receiver = self;
  v12.super_class = (Class)SSRentalCheckoutRequest;
  v7 = -[SSRequest init](&v12, sel_init);
  if (v7)
  {
    v7->_accountIdentifier = (NSNumber *)objc_msgSend(a3, "copy");
    v7->_rentalKeyIdentifier = (NSNumber *)objc_msgSend(a4, "copy");
    v7->_shouldValidateRentalInfo = 1;
  }
  return v7;
}

- (SSRentalCheckoutRequest)initWithDownloadIdentifier:(int64_t)a3
{
  SSRentalCheckoutRequest *result;
  objc_super v5;

  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SSRentalCheckoutRequest;
    result = -[SSRequest init](&v5, sel_init);
    if (result)
    {
      result->_downloadIdentifier = a3;
      result->_shouldValidateRentalInfo = 1;
    }
  }
  else
  {

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Must have a valid download identifier"));
    return 0;
  }
  return result;
}

- (SSRentalCheckoutRequest)initWithSinfs:(id)a3
{
  SSRentalCheckoutRequest *v5;
  objc_super v7;

  if (objc_msgSend(a3, "count"))
  {
    v7.receiver = self;
    v7.super_class = (Class)SSRentalCheckoutRequest;
    v5 = -[SSRequest init](&v7, sel_init);
    if (v5)
    {
      v5->_sinfs = (NSArray *)objc_msgSend(a3, "copy");
      v5->_shouldValidateRentalInfo = 1;
    }
  }
  else
  {

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Must have at least one sinf"));
    return 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSRentalCheckoutRequest;
  -[SSRequest dealloc](&v3, sel_dealloc);
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (int64_t)downloadIdentifier
{
  return self->_downloadIdentifier;
}

- (NSNumber)rentalKeyIdentifier
{
  return self->_rentalKeyIdentifier;
}

- (NSArray)sinfs
{
  return self->_sinfs;
}

- (void)startWithCompletionBlock:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__SSRentalCheckoutRequest_startWithCompletionBlock___block_invoke;
  v3[3] = &unk_1E47BA798;
  v3[4] = a3;
  -[SSRentalCheckoutRequest startWithConnectionResponseBlock:](self, "startWithConnectionResponseBlock:", v3);
}

uint64_t __52__SSRentalCheckoutRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (void)startWithConnectionResponseBlock:(id)a3
{
  id v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  _QWORD v20[6];
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v5 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v5)
      v5 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v8 = v7;
    else
      v8 = v7 & 2;
    if (v8)
    {
      v21 = 136446210;
      v22 = "-[SSRentalCheckoutRequest startWithConnectionResponseBlock:]";
      LODWORD(v19) = 12;
      v18 = &v21;
      v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v21, v19);
        free(v10);
        SSFileLog(v5, CFSTR("%@"), v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __60__SSRentalCheckoutRequest_startWithConnectionResponseBlock___block_invoke;
  v20[3] = &unk_1E47B8EE0;
  v20[4] = self;
  v20[5] = a3;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 60, v20, v18);
}

uint64_t __60__SSRentalCheckoutRequest_startWithConnectionResponseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  SSURLConnectionResponse *v5;
  NSObject *global_queue;
  uint64_t v7;
  _QWORD block[7];

  if (*(_QWORD *)(a1 + 40))
  {
    if (a2 == (void *)MEMORY[0x1E0C81258])
    {
      v4 = (id)SSError((uint64_t)CFSTR("SSErrorDomain"), 121, 0, 0);
      v5 = 0;
    }
    else
    {
      v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "1"));
      v5 = -[SSURLConnectionResponse initWithXPCEncoding:]([SSURLConnectionResponse alloc], "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__SSRentalCheckoutRequest_startWithConnectionResponseBlock___block_invoke_2;
    block[3] = &unk_1E47B9E60;
    v7 = *(_QWORD *)(a1 + 40);
    block[5] = v4;
    block[6] = v7;
    block[4] = v5;
    dispatch_async(global_queue, block);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest");
}

uint64_t __60__SSRentalCheckoutRequest_startWithConnectionResponseBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "50", (__CFString *)self->_accountIdentifier);
  xpc_dictionary_set_BOOL(v3, "55", self->_checkoutWithPlay);
  xpc_dictionary_set_int64(v3, "51", self->_downloadIdentifier);
  SSXPCDictionarySetCFObject(v3, "52", (__CFString *)self->_rentalKeyIdentifier);
  SSXPCDictionarySetCFObject(v3, "54", (__CFString *)self->_sinfs);
  xpc_dictionary_set_BOOL(v3, "53", self->_shouldValidateRentalInfo);
  xpc_dictionary_set_uint64(v3, "56", self->_checkoutType);
  return v3;
}

- (SSRentalCheckoutRequest)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    objc_opt_class();
    self->_accountIdentifier = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass(a3, "50");
    self->_checkoutWithPlay = xpc_dictionary_get_BOOL(a3, "55");
    self->_downloadIdentifier = xpc_dictionary_get_int64(a3, "51");
    objc_opt_class();
    self->_rentalKeyIdentifier = (NSNumber *)SSXPCDictionaryCopyCFObjectWithClass(a3, "52");
    objc_opt_class();
    self->_sinfs = (NSArray *)SSXPCDictionaryCopyCFObjectWithClass(a3, "54");
    self->_shouldValidateRentalInfo = xpc_dictionary_get_BOOL(a3, "53");
    self->_checkoutType = xpc_dictionary_get_uint64(a3, "56");
  }
  else
  {

    return 0;
  }
  return self;
}

- (BOOL)shouldValidateRentalInfo
{
  return self->_shouldValidateRentalInfo;
}

- (void)setShouldValidateRentalInfo:(BOOL)a3
{
  self->_shouldValidateRentalInfo = a3;
}

- (BOOL)shouldCheckoutWithPlay
{
  return self->_checkoutWithPlay;
}

- (void)setCheckoutWithPlay:(BOOL)a3
{
  self->_checkoutWithPlay = a3;
}

- (unint64_t)checkoutType
{
  return self->_checkoutType;
}

- (void)setCheckoutType:(unint64_t)a3
{
  self->_checkoutType = a3;
}

@end
