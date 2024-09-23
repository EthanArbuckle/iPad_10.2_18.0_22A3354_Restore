@implementation SSVPlaybackSubscriptionLeaseRequest

- (id)_actionParameterValue
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[SSVPlaybackLeaseRequest _actionType](self, "_actionType");
  if (v3 == 2)
    return CFSTR("lease-renew");
  v4 = CFSTR("lease-start");
  if (v3 == 1 && !-[SSVPlaybackLeaseRequest startsLeaseSession](self, "startsLeaseSession"))
    return CFSTR("lease-renew");
  return (id)v4;
}

- (id)_copyBodyDictionaryWithFairPlaySession:(void *)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  int v19;
  int v20;
  void *v21;
  int v22;
  int v23;
  NSObject *v24;
  int v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v38;
  unsigned int v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t v42;
  objc_super v43;
  int v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v43.receiver = self;
  v43.super_class = (Class)SSVPlaybackSubscriptionLeaseRequest;
  v4 = -[SSVPlaybackLeaseRequest _copyBodyDictionaryWithFairPlaySession:](&v43, sel__copyBodyDictionaryWithFairPlaySession_, a3);
  +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSVPlaybackLeaseRequest _certificateData](self, "_certificateData");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedLongLongValue");

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", "lease", 5, 0);
    v42 = 0;
    v41 = 0;
    v40 = 0;
    v39 = 0;
    v13 = SSVFairPlayContextIdentifier();
    v14 = -[SSVPlaybackSubscriptionLeaseRequest _transactionType](self, "_transactionType");
    v15 = objc_retainAutorelease(v8);
    v16 = objc_msgSend(v15, "bytes");
    v17 = objc_msgSend(v15, "length");
    v18 = objc_retainAutorelease(v12);
    PhUojZmspd(v13, v11, v14, v16, v17, objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"), (uint64_t)&v42, (uint64_t)&v41, (uint64_t)&v40, (uint64_t)&v39);
    if (v19)
    {
      v20 = v19;
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v22 = objc_msgSend(v21, "shouldLog");
      if (objc_msgSend(v21, "shouldLogToDisk"))
        v23 = v22 | 2;
      else
        v23 = v22;
      objc_msgSend(v21, "OSLogObject");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        v25 = v23;
      else
        v25 = v23 & 2;
      if (v25)
      {
        v44 = 134217984;
        v45 = v20;
        LODWORD(v38) = 12;
        v26 = (void *)_os_log_send_and_compose_impl();

        if (!v26)
        {
LABEL_22:

LABEL_23:
          goto LABEL_24;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v26, 4, &v44, v38);
        v24 = objc_claimAutoreleasedReturnValue();
        free(v26);
        SSFileLog(v21, CFSTR("%@"), v27, v28, v29, v30, v31, v32, (uint64_t)v24);
      }
    }
    else
    {
      if (v39)
      {
        v33 = objc_alloc(MEMORY[0x1E0C99D50]);
        v34 = (void *)objc_msgSend(v33, "initWithBytesNoCopy:length:deallocator:", v40, v39, &__block_literal_global_44);
        objc_msgSend(v34, "base64EncodedStringWithOptions:", 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("sbsync"));

      }
      if (!v41)
        goto LABEL_23;
      v36 = objc_alloc(MEMORY[0x1E0C99D50]);
      v21 = (void *)objc_msgSend(v36, "initWithBytesNoCopy:length:deallocator:", v42, v41, &__block_literal_global_12_0);
      objc_msgSend(v21, "base64EncodedStringWithOptions:", 0);
      v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("spc"));
    }

    goto LABEL_22;
  }
LABEL_24:

  return v4;
}

void __78__SSVPlaybackSubscriptionLeaseRequest__copyBodyDictionaryWithFairPlaySession___block_invoke(uint64_t a1, uint64_t a2)
{
  jEHf8Xzsv8K(a2);
}

void __78__SSVPlaybackSubscriptionLeaseRequest__copyBodyDictionaryWithFairPlaySession___block_invoke_2(uint64_t a1, uint64_t a2)
{
  jEHf8Xzsv8K(a2);
}

- (id)_URLBagKey
{
  return CFSTR("subDownload");
}

- (unsigned)_transactionType
{
  int64_t v3;

  v3 = -[SSVPlaybackLeaseRequest _actionType](self, "_actionType");
  if (v3 == 2)
    return 310;
  if (v3 == 1)
  {
    if (-[SSVPlaybackLeaseRequest startsLeaseSession](self, "startsLeaseSession"))
      return 308;
    else
      return 310;
  }
  else if (v3)
  {
    return 0;
  }
  else
  {
    return 308;
  }
}

@end
