@implementation ISLoadURLBagOperation

- (ISLoadURLBagOperation)init
{
  id v3;
  ISLoadURLBagOperation *v4;

  v3 = objc_alloc_init(MEMORY[0x24BEB1FF8]);
  objc_msgSend(v3, "setBagType:", 0);
  v4 = -[ISLoadURLBagOperation initWithBagContext:](self, "initWithBagContext:", v3);

  return v4;
}

- (ISLoadURLBagOperation)initWithBagContext:(id)a3
{
  id v4;
  ISLoadURLBagOperation *v5;
  uint64_t v6;
  SSURLBagContext *context;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISLoadURLBagOperation;
  v5 = -[ISOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    context = v5->_context;
    v5->_context = (SSURLBagContext *)v6;

  }
  return v5;
}

+ (void)decrementNetworkCounterForBagContext:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;

  objc_msgSend(a3, "cacheKey");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(a1, "_networkSynchronyQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__ISLoadURLBagOperation_decrementNetworkCounterForBagContext___block_invoke;
    block[3] = &unk_24C43C3F0;
    v8 = a1;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

void __62__ISLoadURLBagOperation_decrementNetworkCounterForBagContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 40), "_networkCounters");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v2, "unsignedIntegerValue") - 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v4, "unsignedIntegerValue"))
    {
      objc_msgSend(*(id *)(a1 + 40), "_executedNetworkRequests");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));

      v4 = &unk_24C453190;
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 32));

  }
}

+ (void)incrementNetworkCounterForBagContext:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;

  objc_msgSend(a3, "cacheKey");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(a1, "_networkSynchronyQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__ISLoadURLBagOperation_incrementNetworkCounterForBagContext___block_invoke;
    block[3] = &unk_24C43C3F0;
    v8 = a1;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

void __62__ISLoadURLBagOperation_incrementNetworkCounterForBagContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 40), "_networkCounters");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = &unk_24C453190;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "unsignedIntegerValue") + 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 32));
}

+ (id)storeFrontHeaderSuffix
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "storeFrontHeaderSuffixForBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)storeFrontHeaderSuffixForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)CFPreferencesCopyValue(CFSTR("ISURLBagStorefrontHeaderSuffixes"), (CFStringRef)*MEMORY[0x24BEB2C88], (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    objc_msgSend(v4, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (ISURLBag)URLBag
{
  ISURLBag *v3;

  -[ISOperation lock](self, "lock");
  v3 = self->_outputBag;
  -[ISOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  ISStoreURLOperation *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  _BOOL4 v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  _BOOL8 v39;
  void *v40;
  int v41;
  int v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  ISURLBag *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  int v56;
  int v57;
  NSObject *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  int *v66;
  uint64_t v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  id v75;
  _QWORD block[4];
  id v77;
  ISLoadURLBagOperation *v78;
  _BYTE *v79;
  int v80;
  id v81;
  __int16 v82;
  void *v83;
  _BYTE v84[24];
  char v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  +[ISURLOperation sharedCFURLCache](ISURLOperation, "sharedCFURLCache");
  +[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISLoadURLBagOperation context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLBagForContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      v10 = v8;
    else
      v10 = v8 & 2;
    if (v10)
    {
      v11 = (void *)objc_opt_class();
      v12 = v11;
      objc_msgSend(v4, "cacheKey");
      *(_DWORD *)v84 = 138412546;
      *(_QWORD *)&v84[4] = v11;
      *(_WORD *)&v84[12] = 2112;
      *(_QWORD *)&v84[14] = objc_claimAutoreleasedReturnValue();
      LODWORD(v67) = 22;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, v84, v67);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        free(v13);
        SSFileLog();

      }
    }
    else
    {

    }
    -[ISLoadURLBagOperation _setOutputURLBag:](self, "_setOutputURLBag:", v5);
    -[ISOperation setSuccess:](self, "setSuccess:", 1);
    goto LABEL_77;
  }
  if (!objc_msgSend(v4, "usesCachedBagsOnly"))
  {
    *(_QWORD *)v84 = 0;
    *(_QWORD *)&v84[8] = v84;
    *(_QWORD *)&v84[16] = 0x2020000000;
    v85 = 0;
    objc_msgSend((id)objc_opt_class(), "_networkSynchronyQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __28__ISLoadURLBagOperation_run__block_invoke;
    block[3] = &unk_24C43C418;
    v24 = v4;
    v77 = v24;
    v78 = self;
    v79 = v84;
    dispatch_sync(v23, block);

    if (!*(_BYTE *)(*(_QWORD *)&v84[8] + 24))
    {

LABEL_76:
      _Block_object_dispose(v84, 8);
      goto LABEL_77;
    }
    v25 = objc_alloc_init(ISStoreURLOperation);
    -[ISOperation setDelegate:](v25, "setDelegate:", self);
    -[ISStoreURLOperation setNeedsURLBag:](v25, "setNeedsURLBag:", 0);
    -[ISStoreURLOperation setShouldAppendAuthKitHeaders:](v25, "setShouldAppendAuthKitHeaders:", 0);
    -[ISURLOperation setTracksPerformanceMetrics:](v25, "setTracksPerformanceMetrics:", SSDebugShouldTrackPerformance());
    -[ISStoreURLOperation setURLBagRequest:](v25, "setURLBagRequest:", 1);
    -[ISStoreURLOperation setUrlKnownToBeTrusted:](v25, "setUrlKnownToBeTrusted:", 1);
    -[ISLoadURLBagOperation accountDSID](self, "accountDSID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISURLOperation _setAccountDSIDOverride:](v25, "_setAccountDSIDOverride:", v26);

    +[ISDataProvider provider](ISProtocolDataProvider, "provider");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setShouldProcessProtocol:", 0);
    -[ISURLOperation setDataProvider:](v25, "setDataProvider:", v27);
    v71 = v27;
    v28 = objc_alloc(MEMORY[0x24BEB1F30]);
    +[ISURLBagCache URLWithBagContext:](ISURLBagCache, "URLWithBagContext:", v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = (void *)objc_msgSend(v28, "initWithURL:", v29);

    objc_msgSend(v73, "setAllowedRetryCount:", 0);
    if (objc_msgSend(v24, "allowsBootstrapCellularData"))
      objc_msgSend(v73, "setAllowsBootstrapCellularData:", 1);
    objc_msgSend(v24, "clientAuditTokenData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30 == 0;

    if (!v31)
    {
      objc_msgSend(v24, "clientAuditTokenData");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "setClientAuditTokenData:", v32);

    }
    if (objc_msgSend(v24, "ignoresCaches"))
      objc_msgSend(v73, "setCachePolicy:", 1);
    objc_msgSend(v73, "setITunesStoreRequest:", 1);
    -[ISLoadURLBagOperation _addHeadersToRequestProperties:](self, "_addHeadersToRequestProperties:", v73);
    -[ISURLOperation setRequestProperties:](v25, "setRequestProperties:", v73);
    v75 = 0;
    v33 = -[ISOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v25, &v75);
    v34 = v75;
    v35 = v34;
    if (v33)
    {
      objc_msgSend(v71, "output");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISURLOperation response](v25, "response");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v35;
      v38 = -[ISLoadURLBagOperation _setURLBagWithDictionary:response:error:](self, "_setURLBagWithDictionary:response:error:", v36, v37, &v74);
      v72 = v74;

      if (v38)
      {
        v39 = 1;
        goto LABEL_55;
      }
    }
    else
    {
      v72 = v34;
    }
    if (objc_msgSend(v24, "bagType") != 2)
    {
      v39 = 0;
      goto LABEL_55;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v40)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v41 = objc_msgSend(v40, "shouldLog");
    v42 = objc_msgSend(v40, "shouldLogToDisk");
    objc_msgSend(v40, "OSLogObject");
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v42)
      v41 |= 2u;
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      v41 &= 2u;
    if (v41)
    {
      v45 = (void *)objc_opt_class();
      v80 = 138412290;
      v81 = v45;
      v70 = v45;
      LODWORD(v67) = 12;
      v66 = &v80;
      v46 = (void *)_os_log_send_and_compose_impl();

      if (!v46)
      {
LABEL_51:

        v47 = -[ISURLBag initWithURLBagContext:]([ISURLBag alloc], "initWithURLBagContext:", v24);
        v39 = v47 != 0;
        if (v47)
          objc_msgSend(v3, "addURLBag:", v47);

LABEL_55:
        -[ISOperation setError:](self, "setError:", v72, v66);
        -[ISOperation setSuccess:](self, "setSuccess:", v39);
        -[ISOperation setDelegate:](v25, "setDelegate:", 0);
        if (!self->_outputBag)
        {
LABEL_75:

          goto LABEL_76;
        }
        objc_msgSend(v24, "clientBundleIdentifier");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v48;
        if (v48)
        {
          v50 = v48;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "bundleIdentifier");
          v50 = (id)objc_claimAutoreleasedReturnValue();

        }
        if (!objc_msgSend(v50, "isEqualToString:", CFSTR("com.apple.itunesstored"))
          || (objc_msgSend(v24, "cacheKey"),
              v52 = (void *)objc_claimAutoreleasedReturnValue(),
              v53 = objc_msgSend(v52, "containsString:", CFSTR("itunesstored")),
              v52,
              (v53 & 1) != 0))
        {
LABEL_74:
          v64 = (void *)objc_opt_class();
          -[ISURLBag valueForKey:](self->_outputBag, "valueForKey:", CFSTR("storefront-header-suffix"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "_addStoreFrontHeaderSuffix:forBundleIdentifier:", v65, v50);

          goto LABEL_75;
        }
        objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v54)
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v55 = v54;
        v56 = objc_msgSend(v54, "shouldLog");
        v57 = objc_msgSend(v55, "shouldLogToDisk");
        v69 = v55;
        objc_msgSend(v55, "OSLogObject");
        v58 = objc_claimAutoreleasedReturnValue();
        v59 = v58;
        if (v57)
          v56 |= 2u;
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          v60 = v56;
        else
          v60 = v56 & 2;
        if (v60)
        {
          v61 = v69;
          v68 = (id)objc_opt_class();
          objc_msgSend(v24, "cacheKey");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = 138412546;
          v81 = v68;
          v82 = 2112;
          v83 = v62;
          LODWORD(v67) = 22;
          v63 = (void *)_os_log_send_and_compose_impl();

          if (!v63)
          {
LABEL_73:

            v50 = 0;
            goto LABEL_74;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v63, 4, &v80, v67);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          free(v63);
          SSFileLog();
        }
        else
        {
          v61 = v69;
        }

        goto LABEL_73;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v46, 4, &v80, v67);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      free(v46);
      v66 = (int *)v44;
      SSFileLog();
    }

    goto LABEL_51;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = objc_msgSend(v15, "shouldLog");
  if (objc_msgSend(v15, "shouldLogToDisk"))
    v17 = v16 | 2;
  else
    v17 = v16;
  objc_msgSend(v15, "OSLogObject");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    v17 &= 2u;
  if (v17)
  {
    v19 = (void *)objc_opt_class();
    v20 = v19;
    objc_msgSend(v4, "cacheKey");
    *(_DWORD *)v84 = 138412546;
    *(_QWORD *)&v84[4] = v19;
    *(_WORD *)&v84[12] = 2112;
    *(_QWORD *)&v84[14] = objc_claimAutoreleasedReturnValue();
    LODWORD(v67) = 22;
    v21 = (void *)_os_log_send_and_compose_impl();

    if (v21)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v21, 4, v84, v67);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      free(v21);
      SSFileLog();

    }
  }
  else
  {

  }
LABEL_77:

}

void __28__ISLoadURLBagOperation_run__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "cacheKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "_networkCounters");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 && !objc_msgSend(v4, "isEqualToNumber:", &unk_24C453190))
    {
      objc_msgSend((id)objc_opt_class(), "_executedNetworkRequests");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "containsObject:", v2);

      if ((v6 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v8 = objc_msgSend(v7, "shouldLog");
        if (objc_msgSend(v7, "shouldLogToDisk"))
          v9 = v8 | 2;
        else
          v9 = v8;
        objc_msgSend(v7, "OSLogObject");
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          v9 &= 2u;
        if (v9)
        {
          *(_DWORD *)v15 = 138543618;
          *(_QWORD *)&v15[4] = objc_opt_class();
          *(_WORD *)&v15[12] = 2112;
          *(_QWORD *)&v15[14] = v2;
          v11 = *(id *)&v15[4];
          LODWORD(v14) = 22;
          v12 = (void *)_os_log_send_and_compose_impl();

          if (!v12)
          {
LABEL_16:

LABEL_19:
            goto LABEL_20;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, v15, v14, *(_OWORD *)v15, *(_QWORD *)&v15[16]);
          v10 = objc_claimAutoreleasedReturnValue();
          free(v12);
          SSFileLog();
        }

        goto LABEL_16;
      }
      objc_msgSend((id)objc_opt_class(), "_executedNetworkRequests");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v2);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_19;
  }
LABEL_20:

}

- (id)uniqueKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[ISLoadURLBagOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cacheKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("com.apple.iTunesStore.LoadURLBag-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)operation:(id)a3 shouldSetStoreFrontID:(id)a4
{
  void *v4;
  BOOL v5;

  -[ISLoadURLBagOperation context](self, "context", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "bagType") != 1;

  return v5;
}

- (void)operation:(id)a3 willSendRequest:(id)a4
{
  id v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  objc_msgSend(v4, "valueForHTTPHeaderField:", CFSTR("X-Apple-Synched-Store-Front"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (const __CFString *)*MEMORY[0x24BEB2C88];
    v7 = (void *)CFPreferencesCopyAppValue(CFSTR("LastSynchedStoreFront"), (CFStringRef)*MEMORY[0x24BEB2C88]);
    if ((objc_msgSend(v5, "isEqualToString:", v7) & 1) == 0)
    {
      objc_msgSend(v4, "setValue:forHTTPHeaderField:", 0, *MEMORY[0x24BEB2598]);
      CFPreferencesSetAppValue(CFSTR("LastSynchedStoreFront"), v5, v6);
      CFPreferencesAppSynchronize(v6);
    }

  }
  v21 = v5;
  objc_msgSend(v4, "allHTTPHeaderFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ISDictionaryValueForCaseInsensitiveString(v8, CFSTR("Cookie"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(";"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v19, "hasPrefix:", CFSTR("xp_ci")) & 1) == 0)
          objc_msgSend(v11, "addObject:", v19);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

  objc_msgSend(v11, "componentsJoinedByString:", CFSTR("; "));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v20, CFSTR("Cookie"));

}

- (void)_addHeadersToRequestProperties:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[SSURLBagContext allHTTPHeaders](self->_context, "allHTTPHeaders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addEntriesFromDictionary:", v5);
  if (objc_msgSend(v4, "count"))
    objc_msgSend(v6, "setHTTPHeaders:", v4);

}

+ (void)_addStoreFrontHeaderSuffix:(id)a3 forBundleIdentifier:(id)a4
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v6 = (const __CFString *)*MEMORY[0x24BEB2C88];
    v7 = (void *)CFPreferencesCopyValue(CFSTR("ISURLBagStorefrontHeaderSuffixes"), (CFStringRef)*MEMORY[0x24BEB2C88], (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    v8 = (id)objc_msgSend(v7, "mutableCopy");
    if (!v8)
      v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (objc_msgSend(v9, "length"))
      objc_msgSend(v8, "setObject:forKey:", v9, v5);
    else
      objc_msgSend(v8, "removeObjectForKey:", v5);
    if ((objc_msgSend(v8, "isEqualToDictionary:", v7) & 1) == 0)
    {
      CFPreferencesSetAppValue(CFSTR("ISURLBagStorefrontHeaderSuffixes"), v8, v6);
      CFPreferencesAppSynchronize(v6);
    }

  }
}

+ (id)_executedNetworkRequests
{
  NSObject *v2;

  objc_msgSend(a1, "_networkSynchronyQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  if (_executedNetworkRequests_ams_once_token___COUNTER__ != -1)
    dispatch_once(&_executedNetworkRequests_ams_once_token___COUNTER__, &__block_literal_global_5);
  return (id)_executedNetworkRequests_ams_once_object___COUNTER__;
}

void __49__ISLoadURLBagOperation__executedNetworkRequests__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v1 = (void *)_executedNetworkRequests_ams_once_object___COUNTER__;
  _executedNetworkRequests_ams_once_object___COUNTER__ = (uint64_t)v0;

}

+ (id)_networkCounters
{
  NSObject *v2;

  objc_msgSend(a1, "_networkSynchronyQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  if (_networkCounters_ams_once_token___COUNTER__ != -1)
    dispatch_once(&_networkCounters_ams_once_token___COUNTER__, &__block_literal_global_38);
  return (id)_networkCounters_ams_once_object___COUNTER__;
}

void __41__ISLoadURLBagOperation__networkCounters__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)_networkCounters_ams_once_object___COUNTER__;
  _networkCounters_ams_once_object___COUNTER__ = (uint64_t)v0;

}

+ (id)_networkSynchronyQueue
{
  if (_networkSynchronyQueue_ams_once_token___COUNTER__ != -1)
    dispatch_once(&_networkSynchronyQueue_ams_once_token___COUNTER__, &__block_literal_global_39);
  return (id)_networkSynchronyQueue_ams_once_object___COUNTER__;
}

void __47__ISLoadURLBagOperation__networkSynchronyQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.iTunesStore.ISLoadURLBagOperation._networkSynchrony", 0);
  v1 = (void *)_networkSynchronyQueue_ams_once_object___COUNTER__;
  _networkSynchronyQueue_ams_once_object___COUNTER__ = (uint64_t)v0;

}

- (void)_postBagDidLoadNotificationWithURLBag:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD16D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainThreadProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "postNotificationName:object:", CFSTR("ISURLBagDidLoadNotification"), v4);
}

- (void)_sendPingsForURLBag:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  unint64_t v20;
  id v21;
  void *v22;
  void *v23;
  int *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "valueForKey:", CFSTR("pingUrls"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (_sendPingsForURLBag__sOnce != -1)
      dispatch_once(&_sendPingsForURLBag__sOnce, &__block_literal_global_45);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = v3;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v29;
      v8 = 0x24BDD1000uLL;
      v9 = 0x24BDBC000uLL;
      do
      {
        v10 = 0;
        v27 = v6;
        do
        {
          if (*(_QWORD *)v29 != v7)
            objc_enumerationMutation(v4);
          v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = (void *)objc_msgSend(objc_alloc(*(Class *)(v9 + 3912)), "initWithString:", v11);
            if (v12)
            {
              objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v13)
              {
                objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v14 = objc_msgSend(v13, "shouldLog", v24);
              if (objc_msgSend(v13, "shouldLogToDisk"))
                v14 |= 2u;
              objc_msgSend(v13, "OSLogObject");
              v15 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
                v14 &= 2u;
              if (v14)
              {
                v16 = (void *)objc_opt_class();
                v32 = 138412546;
                v33 = v16;
                v34 = 2112;
                v35 = v12;
                v17 = v7;
                v18 = v8;
                v19 = v4;
                v20 = v9;
                v21 = v16;
                LODWORD(v25) = 22;
                v24 = &v32;
                v22 = (void *)_os_log_send_and_compose_impl();

                v9 = v20;
                v4 = v19;
                v8 = v18;
                v7 = v17;
                v6 = v27;

                if (v22)
                {
                  objc_msgSend(*(id *)(v8 + 1992), "stringWithCString:encoding:", v22, 4, &v32, v25);
                  v15 = objc_claimAutoreleasedReturnValue();
                  free(v22);
                  v24 = (int *)v15;
                  SSFileLog();
                  goto LABEL_20;
                }
              }
              else
              {
LABEL_20:

              }
              +[ISStoreURLOperation pingOperationWithUrl:](ISStoreURLOperation, "pingOperationWithUrl:", v12);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setNeedsURLBag:", 0);
              objc_msgSend((id)_sendPingsForURLBag__sPingQueue, "addOperation:", v23);

            }
          }
          ++v10;
        }
        while (v6 != v10);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v6);
    }

    v3 = v26;
  }

}

uint64_t __45__ISLoadURLBagOperation__sendPingsForURLBag___block_invoke()
{
  ISOperationQueue *v0;
  void *v1;

  v0 = objc_alloc_init(ISOperationQueue);
  v1 = (void *)_sendPingsForURLBag__sPingQueue;
  _sendPingsForURLBag__sPingQueue = (uint64_t)v0;

  objc_msgSend((id)_sendPingsForURLBag__sPingQueue, "setAdjustsMaxConcurrentOperationCount:", 0);
  objc_msgSend((id)_sendPingsForURLBag__sPingQueue, "setMaxConcurrentOperationCount:", 1);
  return objc_msgSend((id)_sendPingsForURLBag__sPingQueue, "setName:", CFSTR("com.apple.iTunesStore.URLBagPingQueue"));
}

- (void)_setOutputURLBag:(id)a3
{
  ISURLBag *v4;
  ISURLBag *outputBag;

  v4 = (ISURLBag *)a3;
  -[ISOperation lock](self, "lock");
  outputBag = self->_outputBag;
  self->_outputBag = v4;

  -[ISOperation unlock](self, "unlock");
}

- (BOOL)_setURLBagWithDictionary:(id)a3 response:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  ISURLBag *v10;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  NSObject *v24;
  int v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id *v30;
  uint64_t v32;
  id *v33;
  id v34;
  id v35;
  int v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(ISURLBag);
  -[ISLoadURLBagOperation context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISURLBag setURLBagContext:](v10, "setURLBagContext:", v11);
  v35 = 0;
  v12 = -[ISURLBag loadFromDictionary:returningError:](v10, "loadFromDictionary:returningError:", v9, &v35);

  v13 = v35;
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v8, "itunes_expirationInterval");
    -[ISURLBag setInvalidationTimeWithExprationInterval:](v10, "setInvalidationTimeWithExprationInterval:");
    if (SSIsDaemon())
    {
      if (!objc_msgSend(v11, "bagType"))
      {
        objc_msgSend(v11, "userIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          v16 = (void *)MEMORY[0x24BEB1DE8];
          -[ISURLBag availableStorefrontItemKinds](v10, "availableStorefrontItemKinds");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v16) = objc_msgSend(v16, "setCachedAvailableItemKinds:", v17);

          if ((_DWORD)v16)
            CFPreferencesSynchronize((CFStringRef)*MEMORY[0x24BDBD568], (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
        }
      }
    }
    objc_msgSend(v8, "allHeaderFields");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ISDictionaryValueForCaseInsensitiveString(v18, (void *)*MEMORY[0x24BEB25D8]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      ISDictionaryValueForCaseInsensitiveString(v18, (void *)*MEMORY[0x24BEB2588]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[ISURLBag setStoreFrontIdentifier:](v10, "setStoreFrontIdentifier:", v19);
    +[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addURLBag:", v10);

    -[ISLoadURLBagOperation _postBagDidLoadNotificationWithURLBag:](self, "_postBagDidLoadNotificationWithURLBag:", v10);
    -[ISLoadURLBagOperation _setOutputURLBag:](self, "_setOutputURLBag:", v10);
    -[ISLoadURLBagOperation _sendPingsForURLBag:](self, "_sendPingsForURLBag:", v10);

    goto LABEL_25;
  }
  v33 = a5;
  v34 = v13;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = objc_msgSend(v21, "shouldLog");
  if (objc_msgSend(v21, "shouldLogToDisk"))
    v23 = v22 | 2;
  else
    v23 = v22;
  objc_msgSend(v21, "OSLogObject");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    v25 = v23;
  else
    v25 = v23 & 2;
  if (v25)
  {
    v26 = (void *)objc_opt_class();
    v27 = v26;
    objc_msgSend(v8, "URL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 138412802;
    v37 = v26;
    v38 = 2112;
    v39 = v28;
    v40 = 2112;
    v41 = v34;
    LODWORD(v32) = 32;
    v29 = (void *)_os_log_send_and_compose_impl();

    v30 = v33;
    if (!v29)
      goto LABEL_23;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v29, 4, &v36, v32);
    v24 = objc_claimAutoreleasedReturnValue();
    free(v29);
    SSFileLog();
  }
  else
  {
    v30 = a5;
  }

LABEL_23:
  v14 = v34;
  if (v30)
    *v30 = objc_retainAutorelease(v34);
LABEL_25:

  return v12;
}

- (SSURLBagContext)context
{
  return (SSURLBagContext *)objc_getProperty(self, a2, 336, 1);
}

- (NSNumber)accountDSID
{
  return self->_accountDSID;
}

- (void)setAccountDSID:(id)a3
{
  objc_storeStrong((id *)&self->_accountDSID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountDSID, 0);
  objc_storeStrong((id *)&self->_outputBag, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
