@implementation SSPurchaseReceipt

- (SSPurchaseReceipt)initWithContentsOfFile:(id)a3
{
  id v4;
  SSPurchaseReceipt *v5;
  ISPurchaseReceipt *v6;
  ISPurchaseReceipt *purchaseReceipt;
  SSPurchaseReceipt *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSPurchaseReceipt;
  v5 = -[SSPurchaseReceipt init](&v10, sel_init);
  if (v5
    && (v6 = -[ISPurchaseReceipt initWithContentsOfFile:]([ISPurchaseReceipt alloc], "initWithContentsOfFile:", v4), purchaseReceipt = v5->_purchaseReceipt, v5->_purchaseReceipt = v6, purchaseReceipt, !v5->_purchaseReceipt))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (SSPurchaseReceipt)initWithContainerPath:(id)a3
{
  void *v4;
  void *v5;
  SSPurchaseReceipt *v6;

  objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("StoreKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("receipt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SSPurchaseReceipt initWithContentsOfFile:](self, "initWithContentsOfFile:", v5);
  return v6;
}

+ (void)getReceiptPathWithCompletionBlock:(id)a3
{
  id v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SSXPCConnection *v16;
  xpc_object_t v17;
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = objc_msgSend(v4, "shouldLog");
    if (objc_msgSend(v4, "shouldLogToDisk"))
      v6 = v5 | 2;
    else
      v6 = v5;
    objc_msgSend(v4, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      v8 = v6;
    else
      v8 = v6 & 2;
    if (v8)
    {
      v22 = 136446210;
      v23 = "+[SSPurchaseReceipt getReceiptPathWithCompletionBlock:]";
      LODWORD(v19) = 12;
      v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v22, v19);
      v7 = objc_claimAutoreleasedReturnValue();
      free(v9);
      SSFileLog(v4, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    }

    goto LABEL_15;
  }
LABEL_16:
  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil block"));
  v16 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  v17 = SSXPCCreateMessageDictionary(700);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __55__SSPurchaseReceipt_getReceiptPathWithCompletionBlock___block_invoke;
  v20[3] = &unk_1E47BAB40;
  v21 = v3;
  v18 = v3;
  -[SSXPCConnection sendMessage:withReply:](v16, "sendMessage:withReply:", v17, v20);

}

void __55__SSPurchaseReceipt_getReceiptPathWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  CFArrayRef v3;
  xpc_object_t xdict;

  xdict = a2;
  if (xdict && MEMORY[0x1A85863E4]() == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_BOOL(xdict, "0");
    objc_opt_class();
    v3 = SSXPCDictionaryCopyCFObjectWithClass(xdict, "1");
  }
  else
  {
    v3 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)isVPPLicensed
{
  return -[ISPurchaseReceipt isVPPLicensed](self->_purchaseReceipt, "isVPPLicensed");
}

- (BOOL)isRevoked
{
  return -[ISPurchaseReceipt isRevoked](self->_purchaseReceipt, "isRevoked");
}

- (NSDate)expirationDate
{
  return -[ISPurchaseReceipt expirationDate](self->_purchaseReceipt, "expirationDate");
}

- (BOOL)receiptExpired
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SSPurchaseReceipt expirationDate](self, "expirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "compare:", v3) == -1;

  return v4;
}

+ (id)receiptPathForProxy:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  id v10;

  v3 = a3;
  objc_msgSend(v3, "dataContainerURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("StoreKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v3, "profileValidated");
  if ((_DWORD)v4)
    v7 = CFSTR("sandboxReceipt");
  else
    v7 = CFSTR("receipt");
  objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  if (objc_msgSend(v9, "fileExistsAtPath:", v8))
    v10 = v8;
  else
    v10 = 0;

  return v10;
}

+ (int)vppStateFlagsWithProxy:(id)a3
{
  void *v3;
  SSPurchaseReceipt *v4;
  SSPurchaseReceipt *v5;
  int v6;

  +[SSPurchaseReceipt receiptPathForProxy:](SSPurchaseReceipt, "receiptPathForProxy:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[SSPurchaseReceipt initWithContentsOfFile:]([SSPurchaseReceipt alloc], "initWithContentsOfFile:", v3);
    v5 = v4;
    if (v4)
    {
      if (-[SSPurchaseReceipt isVPPLicensed](v4, "isVPPLicensed"))
      {
        if (-[SSPurchaseReceipt isRevoked](v5, "isRevoked"))
        {
          v6 = 11;
        }
        else if (-[SSPurchaseReceipt receiptExpired](v5, "receiptExpired"))
        {
          v6 = 7;
        }
        else
        {
          v6 = 3;
        }
      }
      else
      {
        v6 = 1;
      }
    }
    else
    {
      v6 = 0x80000000;
    }

  }
  else
  {
    v6 = 0x40000000;
  }

  return v6;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseReceipt, 0);
}

@end
