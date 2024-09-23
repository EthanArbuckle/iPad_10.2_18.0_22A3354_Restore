@implementation SSVLoadDownloadQueueOperation

- (SSVLoadDownloadQueueOperation)init
{
  SSVLoadDownloadQueueOperation *v2;
  NSLock *v3;
  NSLock *lock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSVLoadDownloadQueueOperation;
  v2 = -[SSVOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v2->_lock;
    v2->_lock = v3;

  }
  return v2;
}

- (SSVLoadDownloadQueueOperation)initWithRequestProperties:(id)a3
{
  id v4;
  SSVLoadDownloadQueueOperation *v5;
  SSURLRequestProperties *v6;
  SSURLRequestProperties *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSVLoadDownloadQueueOperation;
  v5 = -[SSVOperation init](&v10, sel_init);
  if (v5)
  {
    if (v4)
      v6 = (SSURLRequestProperties *)objc_msgSend(v4, "copy");
    else
      v6 = objc_alloc_init(SSURLRequestProperties);
    v7 = v6;
    objc_storeStrong((id *)&v5->_requestProperties, v6);

    -[SSVLoadDownloadQueueOperation setPowerAssertionIdentifier:](v5, "setPowerAssertionIdentifier:", CFSTR("com.apple.storeservices.download-queue"));
    -[SSURLRequestProperties URLBagKey](v5->_requestProperties, "URLBagKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVLoadDownloadQueueOperation setRequestIdentifier:](v5, "setRequestIdentifier:", v8);

  }
  return v5;
}

+ (id)newLoadAutomaticDownloadQueueOperation
{
  SSMutableURLRequestProperties *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setHTTPMethod:](v2, "setHTTPMethod:", CFSTR("POST"));
  -[SSMutableURLRequestProperties setURLBagURLBlock:](v2, "setURLBagURLBlock:", &__block_literal_global_45);
  v3 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRequestProperties:", v2);
  objc_msgSend(v3, "setNeedsAuthentication:", 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("automatic-downloads2"), CFSTR("downloads-url"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRequestIdentifier:", v4);

  return v3;
}

id __71__SSVLoadDownloadQueueOperation_newLoadAutomaticDownloadQueueOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[SSURLBag URLBagForContext:](SSURLBag, "URLBagForContext:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("automatic-downloads2"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(v2, "valueForKey:", CFSTR("automatic-downloads"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("downloads-url"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSNumber)accountIdentifier
{
  NSNumber *v3;

  -[SSVLoadDownloadQueueOperation lock](self, "lock");
  v3 = self->_accountIdentifier;
  -[SSVLoadDownloadQueueOperation unlock](self, "unlock");
  return v3;
}

- (void)addKeybagSyncToBody:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;

  v4 = a3;
  v13 = 0;
  v12 = 0;
  -[SSVLoadDownloadQueueOperation accountIdentifier](self, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "longLongValue");

  v7 = SSVFairPlayContextIdentifier();
  Mt76Vq80ux(v7, v6, 0, 1, (uint64_t)&v13, (uint64_t)&v12);
  if (!v8 && v13)
  {
    v9 = objc_alloc(MEMORY[0x1E0C99D50]);
    v10 = (void *)objc_msgSend(v9, "initWithBytesNoCopy:length:freeWhenDone:", v13, v12, 0);
    objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("kbsync"));
    jEHf8Xzsv8K(v13);

  }
}

- (void)addGUIDToBody:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[SSDevice currentDevice](SSDevice, "currentDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("guid"));

}

- (NSMutableOrderedSet)downloads
{
  NSMutableOrderedSet *v3;

  -[SSVLoadDownloadQueueOperation lock](self, "lock");
  v3 = self->_downloads;
  -[SSVLoadDownloadQueueOperation unlock](self, "unlock");
  return v3;
}

- (BOOL)featureEnabledForBagKey:(id)a3 bagContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  char v12;
  id v14;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_3;
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  if (!v7)
    goto LABEL_11;
LABEL_3:
  +[SSURLBag URLBagForContext:](SSURLBag, "URLBagForContext:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v9, "valueForKey:error:", v7, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v14;
  if (!v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = objc_msgSend(v10, "BOOLValue");
      if (!a5)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  v12 = 0;
  if (a5)
LABEL_8:
    *a5 = objc_retainAutorelease(v11);
LABEL_9:

LABEL_12:
  return v12;
}

- (id)gzipData:(id)a3
{
  id v3;
  Bytef *v4;
  uint64_t v5;
  id v6;
  id v7;
  int v8;
  int v9;
  z_stream v11;

  v3 = objc_retainAutorelease(a3);
  v4 = (Bytef *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");

  v6 = 0;
  if (v4 && v5)
  {
    memset(&v11.avail_in, 0, 104);
    v11.avail_in = v5;
    v11.avail_out = v5;
    v11.next_in = v4;
    v7 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v5));
    v11.next_out = (Bytef *)objc_msgSend(v7, "mutableBytes", v11.next_in, *(_QWORD *)&v11.avail_in);
    if (v7
      && !deflateInit2_(&v11, -1, 8, 31, 8, 0, "1.2.12", 112)
      && (v8 = deflate(&v11, 4), v9 = deflateEnd(&v11), v8 == 1))
    {
      v6 = 0;
      if (!v9 && v5 == v11.total_in)
      {
        objc_msgSend(v7, "setLength:", v11.total_out);
        v6 = v7;
      }
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (void)importKeybagSync:(id)a3
{
  id v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
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
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  LODWORD(v18) = 138412290;
  *(_QWORD *)((char *)&v18 + 4) = objc_opt_class();
  v8 = *(id *)((char *)&v18 + 4);
  LODWORD(v17) = 12;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v18, v17, v18);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog(v4, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v7);
LABEL_11:

  }
  SSVFairPlayContextIdentifier();
  v16 = objc_retainAutorelease(v3);
  objc_msgSend(v16, "bytes");
  objc_msgSend(v16, "length");

  lCUad();
}

- (void)lock
{
  -[NSLock lock](self->_lock, "lock");
}

- (BOOL)needsAuthentication
{
  BOOL needsAuthentication;

  -[SSVLoadDownloadQueueOperation lock](self, "lock");
  needsAuthentication = self->_needsAuthentication;
  -[SSVLoadDownloadQueueOperation unlock](self, "unlock");
  return needsAuthentication;
}

- (int64_t)reason
{
  int64_t reason;

  -[SSVLoadDownloadQueueOperation lock](self, "lock");
  reason = self->_reason;
  -[SSVLoadDownloadQueueOperation unlock](self, "unlock");
  return reason;
}

- (id)resolveBagURLForKey:(id)a3 bagContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v15;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (v7)
      goto LABEL_3;
LABEL_6:
    v12 = 0;
    v11 = 0;
    goto LABEL_11;
  }
  +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_6;
LABEL_3:
  +[SSURLBag URLBagForContext:](SSURLBag, "URLBagForContext:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v9, "valueForKey:error:", v7, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (uint64_t)v15;
  if (!v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "valueForKey:", CFSTR("downloads-url"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }

      goto LABEL_10;
    }
  }
  v12 = 0;
LABEL_9:
  v13 = v10;
LABEL_10:

LABEL_11:
  if (!(v12 | v11))
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 124, 0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v11);

  return (id)v12;
}

- (NSString)requestIdentifier
{
  NSString *v3;

  -[SSVLoadDownloadQueueOperation lock](self, "lock");
  v3 = self->_requestIdentifier;
  -[SSVLoadDownloadQueueOperation unlock](self, "unlock");
  return v3;
}

- (SSURLRequestProperties)requestProperties
{
  return self->_requestProperties;
}

- (void)setAccountIdentifier:(id)a3
{
  NSNumber *v5;

  v5 = (NSNumber *)a3;
  -[SSVLoadDownloadQueueOperation lock](self, "lock");
  if (self->_accountIdentifier != v5)
    objc_storeStrong((id *)&self->_accountIdentifier, a3);
  -[SSVLoadDownloadQueueOperation unlock](self, "unlock");

}

- (void)setNeedsAuthentication:(BOOL)a3
{
  -[SSVLoadDownloadQueueOperation lock](self, "lock");
  self->_needsAuthentication = a3;
  -[SSVLoadDownloadQueueOperation unlock](self, "unlock");
}

- (void)setDownloadsMetadata:(id)a3
{
  id v4;
  NSMutableOrderedSet *v5;
  NSMutableOrderedSet *downloads;

  v4 = a3;
  -[SSVLoadDownloadQueueOperation lock](self, "lock");
  v5 = (NSMutableOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v4);

  downloads = self->_downloads;
  self->_downloads = v5;

  -[SSVLoadDownloadQueueOperation unlock](self, "unlock");
}

- (void)setReason:(int64_t)a3
{
  -[SSVLoadDownloadQueueOperation lock](self, "lock");
  self->_reason = a3;
  -[SSVLoadDownloadQueueOperation unlock](self, "unlock");
}

- (void)setRequestIdentifier:(id)a3
{
  NSString *v4;
  NSString *requestIdentifier;
  NSString *v6;

  v6 = (NSString *)a3;
  -[SSVLoadDownloadQueueOperation lock](self, "lock");
  if (self->_requestIdentifier != v6)
  {
    v4 = (NSString *)-[NSString copy](v6, "copy");
    requestIdentifier = self->_requestIdentifier;
    self->_requestIdentifier = v4;

  }
  -[SSVLoadDownloadQueueOperation unlock](self, "unlock");

}

- (void)setStoreCorrelationID:(id)a3
{
  id v4;
  NSString *v5;
  NSString *storeCorrelationID;

  v4 = a3;
  -[SSVLoadDownloadQueueOperation lock](self, "lock");
  v5 = (NSString *)objc_msgSend(v4, "copy");

  storeCorrelationID = self->_storeCorrelationID;
  self->_storeCorrelationID = v5;

  -[SSVLoadDownloadQueueOperation unlock](self, "unlock");
}

- (void)unlock
{
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  NSMutableArray *rangesToLoad;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  NSNumber *accountIdentifier;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSMutableArray *v27;
  NSMutableArray *v28;
  void *v29;
  int v30;
  NSObject *v31;
  int v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  int v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  -[SSURLRequestProperties URLBagKey](self->_requestProperties, "URLBagKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVLoadDownloadQueueOperation requestURL](self, "requestURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v46 = 0;
    -[SSVLoadDownloadQueueOperation resolveBagURLForKey:bagContext:error:](self, "resolveBagURLForKey:bagContext:error:", v3, v4, &v46);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (NSMutableArray *)v46;
    if (v28)
    {
      v27 = v28;
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v30 = objc_msgSend(v29, "shouldLog");
      if (objc_msgSend(v29, "shouldLogToDisk"))
        v30 |= 2u;
      objc_msgSend(v29, "OSLogObject");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        v32 = v30;
      else
        v32 = v30 & 2;
      if (v32)
      {
        v33 = (void *)objc_opt_class();
        v47 = 138412546;
        v48 = v33;
        v49 = 2112;
        v50 = v27;
        v34 = v33;
        LODWORD(v43) = 22;
        v35 = (void *)_os_log_send_and_compose_impl();

        if (!v35)
        {
LABEL_31:

          -[SSVOperation setError:](self, "setError:", v27);
          goto LABEL_32;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v35, 4, &v47, v43);
        v31 = objc_claimAutoreleasedReturnValue();
        free(v35);
        SSFileLog(v29, CFSTR("%@"), v36, v37, v38, v39, v40, v41, (uint64_t)v31);
      }

      goto LABEL_31;
    }
  }
  v45 = v3;
  v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSMutableArray *)objc_msgSend(v6, "initWithObjects:", v7, v8, 0);
  rangesToLoad = self->_rangesToLoad;
  self->_rangesToLoad = v9;

  if ((unint64_t)-[NSMutableArray count](self->_rangesToLoad, "count") >= 2)
  {
    while (1)
    {
      if ((-[SSVLoadDownloadQueueOperation isCancelled](self, "isCancelled", v42) & 1) != 0)
        goto LABEL_18;
      -[NSMutableArray objectAtIndex:](self->_rangesToLoad, "objectAtIndex:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndex:](self->_rangesToLoad, "objectAtIndex:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[SSVLoadDownloadQueueOperation _loadDownloadsFromStart:toEnd:url:](self, "_loadDownloadsFromStart:toEnd:url:", v11, v12, v5))
      {
        -[NSMutableArray removeAllObjects](self->_rangesToLoad, "removeAllObjects");
        goto LABEL_17;
      }
      v13 = v5;
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = objc_msgSend(v14, "shouldLog");
      if (objc_msgSend(v14, "shouldLogToDisk"))
        v15 |= 2u;
      objc_msgSend(v14, "OSLogObject");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        v15 &= 2u;
      if (!v15)
        goto LABEL_14;
      v17 = (void *)objc_opt_class();
      accountIdentifier = self->_accountIdentifier;
      v47 = 138413058;
      v48 = v17;
      v49 = 2112;
      v50 = accountIdentifier;
      v51 = 2112;
      v52 = v11;
      v53 = 2112;
      v54 = v12;
      v19 = v17;
      LODWORD(v44) = 42;
      v42 = &v47;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (v20)
        break;
LABEL_15:

      -[NSMutableArray removeObjectsInRange:](self->_rangesToLoad, "removeObjectsInRange:", 0, 2);
      -[SSVOperation setSuccess:](self, "setSuccess:", -[NSMutableArray count](self->_rangesToLoad, "count") == 0);
      v5 = v13;
LABEL_17:

      if ((unint64_t)-[NSMutableArray count](self->_rangesToLoad, "count") <= 1)
        goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v20, 4, &v47, v44);
    v16 = objc_claimAutoreleasedReturnValue();
    free(v20);
    SSFileLog(v14, CFSTR("%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v16);
LABEL_14:

    goto LABEL_15;
  }
LABEL_18:
  v27 = self->_rangesToLoad;
  self->_rangesToLoad = 0;
  v3 = v45;
LABEL_32:

}

- (id)_account
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SSVLoadDownloadQueueOperation accountIdentifier](self, "accountIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2
    || (+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "accountWithUniqueIdentifier:", v2),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)_handleResponse:(id)a3
{
  void *v4;
  void *v5;
  NSMutableOrderedSet *downloads;
  NSMutableOrderedSet *v7;
  NSMutableOrderedSet *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "rangesToLoad");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    -[NSMutableArray addObjectsFromArray:](self->_rangesToLoad, "addObjectsFromArray:", v4);
  objc_msgSend(v9, "downloads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SSVLoadDownloadQueueOperation lock](self, "lock");
    downloads = self->_downloads;
    if (!downloads)
    {
      v7 = (NSMutableOrderedSet *)objc_opt_new();
      v8 = self->_downloads;
      self->_downloads = v7;

      downloads = self->_downloads;
    }
    -[NSMutableOrderedSet unionOrderedSet:](downloads, "unionOrderedSet:", v5);
    -[SSVLoadDownloadQueueOperation unlock](self, "unlock");
  }

}

- (BOOL)_loadDownloadsFromStart:(id)a3 toEnd:(id)a4 url:(id)a5
{
  uint64_t (*v8)(uint64_t, uint64_t);
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSString *v30;
  NSString *storeCorrelationID;
  void *v32;
  int v33;
  int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSString *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  _BYTE *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  id v52;
  id v53;
  _QWORD v54[5];
  uint64_t (*v55)(uint64_t, uint64_t);
  id v56;
  uint64_t *v57;
  uint64_t *v58;
  _BYTE *v59;
  id v60;
  id location;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  char v71;
  int v72;
  void *v73;
  __int16 v74;
  NSString *v75;
  _BYTE v76[24];
  uint64_t (*v77)(uint64_t, uint64_t);
  _BYTE v78[20];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v8 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v9 = a4;
  v53 = a5;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = objc_msgSend(v10, "shouldLog");
  if (objc_msgSend(v10, "shouldLogToDisk"))
    v11 |= 2u;
  objc_msgSend(v10, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    v13 = v11;
  else
    v13 = v11 & 2;
  if (v13)
  {
    v14 = (void *)objc_opt_class();
    v15 = v14;
    -[SSVLoadDownloadQueueOperation requestIdentifier](self, "requestIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v76 = 138413314;
    *(_QWORD *)&v76[4] = v14;
    *(_WORD *)&v76[12] = 2112;
    *(_QWORD *)&v76[14] = v16;
    *(_WORD *)&v76[22] = 2112;
    v77 = v8;
    *(_WORD *)v78 = 2112;
    *(_QWORD *)&v78[2] = v9;
    *(_WORD *)&v78[10] = 2048;
    *(_QWORD *)&v78[12] = -[SSVLoadDownloadQueueOperation reason](self, "reason");
    LODWORD(v50) = 52;
    v49 = v76;
    v17 = (void *)_os_log_send_and_compose_impl();

    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v17, 4, v76, v50);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      free(v17);
      SSFileLog(v10, CFSTR("%@"), v19, v20, v21, v22, v23, v24, (uint64_t)v18);

    }
  }
  else
  {

  }
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 0;
  *(_QWORD *)v76 = 0;
  *(_QWORD *)&v76[8] = v76;
  *(_QWORD *)&v76[16] = 0x3032000000;
  v77 = __Block_byref_object_copy__85;
  *(_QWORD *)v78 = __Block_byref_object_dispose__85;
  *(_QWORD *)&v78[8] = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__85;
  v66 = __Block_byref_object_dispose__85;
  v67 = 0;
  objc_initWeak(&location, self);
  v25 = -[SSVLoadDownloadQueueOperation _newURLOperationWithStartIdentifier:endIdentifier:url:](self, "_newURLOperationWithStartIdentifier:endIdentifier:url:", v8, v9, v53);
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __67__SSVLoadDownloadQueueOperation__loadDownloadsFromStart_toEnd_url___block_invoke;
  v54[3] = &unk_1E47C0790;
  v54[4] = self;
  v51 = v8;
  v55 = v51;
  v52 = v9;
  v56 = v52;
  v57 = &v68;
  objc_copyWeak(&v60, &location);
  v58 = &v62;
  v59 = v76;
  objc_msgSend(v25, "setOutputBlock:", v54);
  -[SSVOperation runChildOperation:](self, "runChildOperation:", v25);
  objc_msgSend(v25, "URLResponse");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    objc_msgSend(v26, "allHeaderFields");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKey:", CFSTR("x-apple-jingle-correlation-key"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v29, "length"))
    {
LABEL_25:

      goto LABEL_26;
    }
    v30 = (NSString *)objc_msgSend(v29, "copy");
    storeCorrelationID = self->_storeCorrelationID;
    self->_storeCorrelationID = v30;

    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v33 = objc_msgSend(v32, "shouldLog", v49);
    v34 = objc_msgSend(v32, "shouldLogToDisk");
    objc_msgSend(v32, "OSLogObject");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v34)
      v33 |= 2u;
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      v33 &= 2u;
    if (v33)
    {
      v37 = (void *)objc_opt_class();
      v38 = self->_storeCorrelationID;
      v72 = 138412546;
      v73 = v37;
      v74 = 2114;
      v75 = v38;
      v39 = v37;
      LODWORD(v50) = 22;
      v40 = (void *)_os_log_send_and_compose_impl();

      if (!v40)
      {
LABEL_24:

        goto LABEL_25;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v40, 4, &v72, v50);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      free(v40);
      SSFileLog(v32, CFSTR("%@"), v41, v42, v43, v44, v45, v46, (uint64_t)v36);
    }

    goto LABEL_24;
  }
LABEL_26:
  if (*((_BYTE *)v69 + 24))
    -[SSVLoadDownloadQueueOperation _handleResponse:](self, "_handleResponse:", v63[5]);
  else
    -[SSVOperation setError:](self, "setError:", *(_QWORD *)(*(_QWORD *)&v76[8] + 40));
  v47 = *((_BYTE *)v69 + 24) != 0;

  objc_destroyWeak(&v60);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(v76, 8);
  _Block_object_dispose(&v68, 8);

  return v47;
}

void __67__SSVLoadDownloadQueueOperation__loadDownloadsFromStart_toEnd_url___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id WeakRetained;
  void *v29;
  SSVStoreDownloadQueueResponse *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  _BYTE v40[24];
  uint64_t v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
    goto LABEL_26;
  }
  +[SSLogConfig sharedWriteToDiskConfig](SSLogConfig, "sharedWriteToDiskConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldLog");

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "requestIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("unknown");
    if (v9)
      v11 = (__CFString *)v9;
    v12 = v11;

    +[SSLogConfig sharedWriteToDiskConfig](SSLogConfig, "sharedWriteToDiskConfig");
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
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      v15 &= 2u;
    if (v15)
    {
      v17 = (void *)objc_opt_class();
      v18 = *(_QWORD *)(a1 + 40);
      v19 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)v40 = 138413058;
      *(_QWORD *)&v40[4] = v17;
      *(_WORD *)&v40[12] = 2112;
      *(_QWORD *)&v40[14] = v12;
      *(_WORD *)&v40[22] = 2112;
      v41 = v18;
      LOWORD(v42) = 2112;
      *(_QWORD *)((char *)&v42 + 2) = v19;
      v20 = v17;
      LODWORD(v39) = 42;
      v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v21, 4, v40, v39, *(_OWORD *)v40, *(_QWORD *)&v40[16], v41, v42);
      v16 = objc_claimAutoreleasedReturnValue();
      free(v21);
      SSFileLog(v13, CFSTR("%@"), v22, v23, v24, v25, v26, v27, (uint64_t)v16);
    }

    goto LABEL_17;
  }
LABEL_18:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("keybag"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v29, "length"))
      objc_msgSend(WeakRetained, "importKeybagSync:", v29);

  }
  v30 = [SSVStoreDownloadQueueResponse alloc];
  objc_msgSend(*(id *)(a1 + 32), "_account");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "uniqueIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[SSVStoreDownloadQueueResponse initWithDictionary:userIdentifier:](v30, "initWithDictionary:userIdentifier:", v5, v32);
  v34 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v35 = *(void **)(v34 + 40);
  *(_QWORD *)(v34 + 40) = v33;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "storeCorrelationID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v37 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "storeCorrelationID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setStoreCorrelationID:", v38);

  }
LABEL_26:

}

- (id)_newURLOperationWithStartIdentifier:(id)a3 endIdentifier:(id)a4 url:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSString *mdSyncState;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  SSVLoadURLOperation *v26;
  void *v27;
  uint64_t v29;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SSVLoadDownloadQueueOperation _account](self, "_account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)-[SSURLRequestProperties mutableCopy](self->_requestProperties, "mutableCopy");
  objc_msgSend(v12, "setAllowedRetryCount:", 0);
  objc_msgSend(v12, "setURL:", v8);

  objc_msgSend(v12, "setCachePolicy:", 1);
  objc_msgSend(v12, "setURLBagType:", SSURLBagTypeForAccountScope(objc_msgSend(v11, "accountScope")));
  objc_msgSend(v12, "requestParameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  if (-[SSVLoadDownloadQueueOperation reason](self, "reason") != 1)
  {
    objc_msgSend(v12, "setHTTPMethod:", CFSTR("POST"));
    -[SSVLoadDownloadQueueOperation addGUIDToBody:](self, "addGUIDToBody:", v17);
  }
  +[SSDevice currentDevice](SSDevice, "currentDevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "thinnedApplicationVariantIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend(v12, "setValue:forHTTPHeaderField:", v19, CFSTR("X-Apple-TA-Device"));
  -[SSVLoadDownloadQueueOperation lock](self, "lock");
  mdSyncState = self->_mdSyncState;
  if (mdSyncState)
    objc_msgSend(v12, "setValue:forHTTPHeaderField:", mdSyncState, CFSTR("X-Apple-MD-S"));
  -[SSVLoadDownloadQueueOperation unlock](self, "unlock");
  v21 = objc_msgSend(v10, "itemIdentifierValue");

  v22 = objc_msgSend(v9, "itemIdentifierValue");
  if (v21 - 1 < v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v23, CFSTR("startId"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v24, CFSTR("endId"));

  }
  -[SSVLoadDownloadQueueOperation addKeybagSyncToBody:](self, "addKeybagSyncToBody:", v17);
  if (objc_msgSend(v17, "count"))
  {
    v29 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v17, 100, 0, &v29);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHTTPBody:", v25);

  }
  v26 = -[SSVLoadURLOperation initWithURLRequestProperties:]([SSVLoadURLOperation alloc], "initWithURLRequestProperties:", v12);
  +[SSVURLDataConsumer consumer](SSVURLProtocolConsumer, "consumer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVLoadURLOperation setDataConsumer:](v26, "setDataConsumer:", v27);

  -[SSVLoadURLOperation setITunesStoreRequest:](v26, "setITunesStoreRequest:", 1);
  -[SSVLoadURLOperation setMachineDataStyle:](v26, "setMachineDataStyle:", 0);

  return v26;
}

- (NSURL)requestURL
{
  return self->_requestURL;
}

- (void)setRequestURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSString)powerAssertionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 392, 1);
}

- (void)setPowerAssertionIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (NSString)storeCorrelationID
{
  return self->_storeCorrelationID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeCorrelationID, 0);
  objc_storeStrong((id *)&self->_powerAssertionIdentifier, 0);
  objc_storeStrong((id *)&self->_requestURL, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_mdSyncState, 0);
  objc_storeStrong((id *)&self->_requestProperties, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_rangesToLoad, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
