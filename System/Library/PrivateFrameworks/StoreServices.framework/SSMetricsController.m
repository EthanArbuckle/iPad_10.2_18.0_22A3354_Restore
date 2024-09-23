@implementation SSMetricsController

- (SSMetricsController)init
{
  id v2;
  dispatch_queue_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  SSMetricsConfiguration *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SSMetricsController;
  v2 = -[SSMetricsController init](&v19, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.storeservices.analytics", 0);
    v4 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v3;

    v5 = *((_QWORD *)v2 + 4);
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v5, v6);

    v7 = dispatch_queue_create("com.apple.storeservices.analytics.flush", 0);
    v8 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v7;

    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 5), v6);
    v9 = -[SSMetricsConfiguration initWithGlobalConfiguration:]([SSMetricsConfiguration alloc], "initWithGlobalConfiguration:", &unk_1E481E948);
    v10 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v9;

    v11 = (void *)MEMORY[0x1E0CFD9E8];
    objc_msgSend(MEMORY[0x1E0CFDB60], "bagSubProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CFDB60], "bagSubProfileVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bagForProfile:profileVersion:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFDA78]), "initWithBag:", v14);
    v16 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v15;

    *((_BYTE *)v2 + 49) = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v2, sel__applicationWillEnterForeground, 0x1E47DBF90, 0);

  }
  return (SSMetricsController *)v2;
}

- (id)_cookieValuesForConfiguration:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "cookieFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[SSVCookieStorage sharedStorage](SSVCookieStorage, "sharedStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allCookiesForAccount:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v14, "name", (_QWORD)v20);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v3, "containsObject:", v15);

          if (v16)
          {
            objc_msgSend(v14, "value");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setValue:forKey:", v17, v18);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __39__SSMetricsController__setupFlushTimer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  float v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  dispatch_block_t v22;
  uint64_t v23;
  void *v24;
  dispatch_time_t v25;
  uint64_t v26;
  _QWORD block[5];
  id v28;
  _BYTE location[12];
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 56))
  {
    dispatch_block_cancel(*(dispatch_block_t *)(v2 + 56));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 56);
    *(_QWORD *)(v3 + 56) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v2 + 48))
  {
    if ((objc_msgSend((id)v2, "isDisabled") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "configuration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reportingFrequency");
      v7 = v6;

      if (v7 != 0.0)
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
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          v10 &= 2u;
        if (v10)
        {
          v12 = (void *)objc_opt_class();
          v13 = v7;
          *(_DWORD *)location = 138412546;
          *(_QWORD *)&location[4] = v12;
          v30 = 2048;
          v31 = v13;
          v14 = v12;
          LODWORD(v26) = 22;
          v15 = (void *)_os_log_send_and_compose_impl();

          if (!v15)
          {
LABEL_17:

            objc_initWeak((id *)location, *(id *)(a1 + 32));
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __39__SSMetricsController__setupFlushTimer__block_invoke_50;
            block[3] = &unk_1E47BA0B8;
            objc_copyWeak(&v28, (id *)location);
            block[4] = *(_QWORD *)(a1 + 32);
            v22 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, block);
            v23 = *(_QWORD *)(a1 + 32);
            v24 = *(void **)(v23 + 56);
            *(_QWORD *)(v23 + 56) = v22;

            v25 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
            dispatch_after(v25, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40), *(dispatch_block_t *)(*(_QWORD *)(a1 + 32) + 56));
            objc_destroyWeak(&v28);
            objc_destroyWeak((id *)location);
            return;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, location, v26);
          v11 = objc_claimAutoreleasedReturnValue();
          free(v15);
          SSFileLog(v8, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v11);
        }

        goto LABEL_17;
      }
    }
  }
}

void __46__SSMetricsController_setGlobalConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 24) != v2)
  {
    objc_msgSend(v2, "reportingFrequency");
    v5 = v4;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "reportingFrequency");
    if (v5 != v6)
      objc_msgSend(*(id *)(a1 + 32), "setFlushTimerEnabled:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "childConfiguration");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setChildConfiguration:", v7);

  }
}

- (void)setFlushTimerEnabled:(BOOL)a3
{
  if (self->_flushTimerEnabled != a3)
  {
    self->_flushTimerEnabled = a3;
    -[SSMetricsController _setupFlushTimer](self, "_setupFlushTimer");
  }
}

- (BOOL)isDisabled
{
  void *v2;
  char v3;

  -[SSMetricsController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled");

  return v3;
}

- (id)configuration
{
  return self->_configuration;
}

- (void)setGlobalConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[SSMetricsController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SSMetricsController_setGlobalConfiguration___block_invoke;
  block[3] = &unk_1E47B8768;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (id)serialQueue
{
  return self->_serialQueue;
}

- (void)_setupFlushTimer
{
  NSObject *flushSerialQueue;
  _QWORD block[5];

  flushSerialQueue = self->_flushSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SSMetricsController__setupFlushTimer__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_async(flushSerialQueue, block);
}

uint64_t __70__SSMetricsController__serialQueueInsertEvents_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __70__SSMetricsController__serialQueueInsertEvents_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  int v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  _QWORD block[4];
  id v34;
  id v35;
  int v36;
  id v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!*(_QWORD *)(a1 + 40))
  {
    v6 = objc_opt_class();
    v7 = (id)SSXPCDictionaryCopyObjectWithClass(v4, "0", v6);
    v8 = objc_msgSend(v7, "intValue");
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8)
    {
      if (!v9)
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
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        v12 &= 2u;
      if (!v12)
        goto LABEL_30;
      v14 = (void *)objc_opt_class();
      v15 = v14;
      v36 = 138412546;
      v37 = v14;
      v38 = 1024;
      v39 = objc_msgSend(v7, "intValue");
      LODWORD(v32) = 18;
    }
    else
    {
      if (!v9)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v19 = objc_msgSend(v10, "shouldLog");
      if (objc_msgSend(v10, "shouldLogToDisk"))
        v20 = v19 | 2;
      else
        v20 = v19;
      objc_msgSend(v10, "OSLogObject");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        v20 &= 2u;
      if (!v20)
        goto LABEL_30;
      v36 = 138412290;
      v37 = (id)objc_opt_class();
      v15 = v37;
      LODWORD(v32) = 12;
    }
    v21 = (void *)_os_log_send_and_compose_impl();

    if (!v21)
      goto LABEL_31;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v21, 4, &v36, v32);
    v13 = objc_claimAutoreleasedReturnValue();
    free(v21);
    SSFileLog(v10, CFSTR("%@"), v22, v23, v24, v25, v26, v27, (uint64_t)v13);
LABEL_30:

    goto LABEL_31;
  }
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    v5 = 121;
  }
  else
  {
    if (v3 && MEMORY[0x1A85863E4](v3) == MEMORY[0x1E0C812F8])
    {
      v28 = objc_opt_class();
      v29 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "0", v28);
      if (objc_msgSend(v29, "intValue"))
      {
        v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
        xpc_dictionary_get_value(v4, "1");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v30, "initWithXPCEncoding:", v31);

      }
      else
      {
        v16 = 0;
      }

      goto LABEL_18;
    }
    v5 = 111;
  }
  SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
  dispatch_get_global_queue(0, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SSMetricsController__serialQueueInsertEvents_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E47B8A98;
  v18 = *(id *)(a1 + 40);
  v34 = v16;
  v35 = v18;
  v7 = v16;
  dispatch_async(v17, block);

  v10 = v35;
LABEL_31:

}

void __58__SSMetricsController_insertEvents_withCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int v28;
  int v29;
  NSObject *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  int v45;
  int v46;
  NSObject *v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  int v61;
  int v62;
  NSObject *v63;
  void *v64;
  id v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  NSObject *v75;
  int *v76;
  uint64_t v77;
  _QWORD v78[4];
  id v79;
  _QWORD block[4];
  id v81;
  _QWORD v82[4];
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  int v88;
  void *v89;
  __int16 v90;
  uint64_t v91;
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = SSRestrictionsIsOnDeviceDiagnosticsAllowed();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v85 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
        if ((objc_msgSend(v10, "requiresDiagnosticSendingPermission") ^ 1 | v3) == 1)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
    }
    while (v7);
  }

  v11 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v11 != objc_msgSend(v4, "count"))
  {
    v12 = objc_msgSend(*(id *)(a1 + 32), "count");
    v13 = objc_msgSend(v4, "count");
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v14, "shouldLog");
    if (objc_msgSend(v14, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    objc_msgSend(v14, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      v16 &= 2u;
    if (v16)
    {
      v18 = (void *)objc_opt_class();
      v88 = 138412546;
      v89 = v18;
      v90 = 2048;
      v91 = v12 - v13;
      v19 = v18;
      LODWORD(v77) = 22;
      v76 = &v88;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_22:

        goto LABEL_23;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v20, 4, &v88, v77);
      v17 = objc_claimAutoreleasedReturnValue();
      free(v20);
      SSFileLog(v14, CFSTR("%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v17);
    }

    goto LABEL_22;
  }
LABEL_23:
  if (objc_msgSend(v4, "count", v76))
  {
    if ((objc_msgSend(WeakRetained, "isDisabled") & 1) != 0)
    {
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v27)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v28 = objc_msgSend(v27, "shouldLog");
      if (objc_msgSend(v27, "shouldLogToDisk"))
        v29 = v28 | 2;
      else
        v29 = v28;
      objc_msgSend(v27, "OSLogObject");
      v30 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        v29 &= 2u;
      if (v29)
      {
        v31 = (void *)objc_opt_class();
        v32 = v31;
        v33 = objc_msgSend(v4, "count");
        v88 = 138412546;
        v89 = v31;
        v90 = 2048;
        v91 = v33;
        LODWORD(v77) = 22;
        v34 = (void *)_os_log_send_and_compose_impl();

        if (!v34)
          goto LABEL_36;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v34, 4, &v88, v77);
        v30 = objc_claimAutoreleasedReturnValue();
        free(v34);
        SSFileLog(v27, CFSTR("%@"), v35, v36, v37, v38, v39, v40, (uint64_t)v30);
      }

LABEL_36:
      v41 = *(void **)(a1 + 48);
      if (v41)
      {
        dispatch_get_global_queue(0, 0);
        v42 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __58__SSMetricsController_insertEvents_withCompletionHandler___block_invoke_54;
        block[3] = &unk_1E47BA738;
        v81 = v41;
        dispatch_async(v42, block);

        v43 = v81;
LABEL_66:

        goto LABEL_67;
      }
      goto LABEL_67;
    }
    objc_msgSend(WeakRetained, "configuration");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "reportingURLString");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v43, "length"))
    {
      objc_msgSend(WeakRetained, "_serialQueueInsertEvents:withCompletionHandler:", v4, *(_QWORD *)(a1 + 48));
      goto LABEL_66;
    }
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v60)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v61 = objc_msgSend(v60, "shouldLog");
    if (objc_msgSend(v60, "shouldLogToDisk"))
      v62 = v61 | 2;
    else
      v62 = v61;
    objc_msgSend(v60, "OSLogObject");
    v63 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      v62 &= 2u;
    if (v62)
    {
      v64 = (void *)objc_opt_class();
      v65 = v64;
      v66 = objc_msgSend(v4, "count");
      v88 = 138412546;
      v89 = v64;
      v90 = 2048;
      v91 = v66;
      LODWORD(v77) = 22;
      v67 = (void *)_os_log_send_and_compose_impl();

      if (!v67)
        goto LABEL_64;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v67, 4, &v88, v77);
      v63 = objc_claimAutoreleasedReturnValue();
      free(v67);
      SSFileLog(v60, CFSTR("%@"), v68, v69, v70, v71, v72, v73, (uint64_t)v63);
    }

LABEL_64:
    v74 = *(void **)(a1 + 48);
    if (v74)
    {
      dispatch_get_global_queue(0, 0);
      v75 = objc_claimAutoreleasedReturnValue();
      v82[0] = MEMORY[0x1E0C809B0];
      v82[1] = 3221225472;
      v82[2] = __58__SSMetricsController_insertEvents_withCompletionHandler___block_invoke_53;
      v82[3] = &unk_1E47BA738;
      v83 = v74;
      dispatch_async(v75, v82);

    }
    goto LABEL_66;
  }
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v44)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v45 = objc_msgSend(v44, "shouldLog");
  if (objc_msgSend(v44, "shouldLogToDisk"))
    v46 = v45 | 2;
  else
    v46 = v45;
  objc_msgSend(v44, "OSLogObject");
  v47 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    v46 &= 2u;
  if (v46)
  {
    v48 = (void *)objc_opt_class();
    v88 = 138412290;
    v89 = v48;
    v49 = v48;
    LODWORD(v77) = 12;
    v50 = (void *)_os_log_send_and_compose_impl();

    if (!v50)
      goto LABEL_49;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v50, 4, &v88, v77);
    v47 = objc_claimAutoreleasedReturnValue();
    free(v50);
    SSFileLog(v44, CFSTR("%@"), v51, v52, v53, v54, v55, v56, (uint64_t)v47);
  }

LABEL_49:
  v57 = *(void **)(a1 + 48);
  if (v57)
  {
    dispatch_get_global_queue(0, 0);
    v58 = objc_claimAutoreleasedReturnValue();
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = __58__SSMetricsController_insertEvents_withCompletionHandler___block_invoke_55;
    v78[3] = &unk_1E47BA738;
    v79 = v57;
    dispatch_async(v58, v78);

    v43 = v79;
    goto LABEL_66;
  }
LABEL_67:

}

- (void)insertEvents:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SSMetricsController *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SSMetricsController serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SSMetricsController_insertEvents_withCompletionHandler___block_invoke;
  block[3] = &unk_1E47BB6C8;
  objc_copyWeak(&v15, &location);
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)insertEvent:(id)a3 withCompletionHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;

  if (a3)
  {
    v6 = (void *)MEMORY[0x1E0C99D20];
    v7 = a4;
    objc_msgSend(v6, "arrayWithObject:", a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[SSMetricsController insertEvents:withCompletionHandler:](self, "insertEvents:withCompletionHandler:");

  }
  else
  {
    v8 = a4;
    -[SSMetricsController insertEvents:withCompletionHandler:](self, "insertEvents:withCompletionHandler:", 0);
  }

}

- (id)_userType
{
  void *v2;
  void *v3;
  unint64_t v4;
  __CFString *v5;

  +[SSVSubscriptionStatusCoordinator sharedCoordinator](SSVSubscriptionStatusCoordinator, "sharedCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastKnownStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "accountStatus");
  if (v4 > 4)
    v5 = 0;
  else
    v5 = off_1E47BB738[v4];

  return v5;
}

- (void)_serialQueueInsertEvents:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  int v20;
  char *v21;
  char *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  AMSEngagement *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v41;
  int v42;
  int v43;
  int v44;
  char *v45;
  char *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  int v57;
  int v58;
  NSObject *v59;
  int v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  xpc_object_t v68;
  void *v69;
  int v70;
  int v71;
  NSObject *v72;
  void *v73;
  id v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  int *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  __CFString *v91;
  void *v92;
  uint64_t v93;
  id obj;
  SSMetricsController *v95;
  uint64_t v96;
  _QWORD block[4];
  id v98;
  char v99;
  _QWORD v100[5];
  id v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  int v106;
  const char *v107;
  __int16 v108;
  void *v109;
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v95 = self;
  -[SSMetricsController configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportingURLString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v92 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "length"))
  {
    v87 = v7;
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[SSMetricsController _userType](self, "_userType");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:");
    -[SSMetricsController _cookieValuesForConfiguration:](self, "_cookieValuesForConfiguration:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
      objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("cookies"));
    v85 = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v88 = v6;
    obj = v6;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v103;
      v89 = v8;
      do
      {
        v15 = 0;
        v93 = v13;
        do
        {
          if (*(_QWORD *)v103 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v15);
          if ((objc_msgSend(v16, "isBlacklistedByConfiguration:", v8, v83, v84) & 1) != 0)
          {
            +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v17)
            {
              +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v18 = objc_msgSend(v17, "shouldLog");
            if (objc_msgSend(v17, "shouldLogToDisk"))
              v18 |= 2u;
            objc_msgSend(v17, "OSLogObject");
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              v20 = v18;
            else
              v20 = v18 & 2;
            if (v20)
            {
              v21 = (char *)objc_opt_class();
              v106 = 138412546;
              v107 = v21;
              v108 = 2112;
              v109 = v16;
              v22 = v21;
              LODWORD(v84) = 22;
              v83 = &v106;
              v23 = (void *)_os_log_send_and_compose_impl();

              if (v23)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v23, 4, &v106, v84);
                v19 = objc_claimAutoreleasedReturnValue();
                free(v23);
                SSFileLog(v17, CFSTR("%@"), v24, v25, v26, v27, v28, v29, (uint64_t)v19);
                goto LABEL_27;
              }
            }
            else
            {
LABEL_27:

            }
            goto LABEL_43;
          }
          v96 = MEMORY[0x1A8585BF8]();
          if ((objc_msgSend(MEMORY[0x1E0CFDAC0], "suppressEngagement") & 1) == 0)
          {
            v30 = v95->_engagement;
            v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v16, "appendPropertiesToBody:", v31);
            v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB68]), "initWithUnderlyingDictionary:", v31);
            if ((objc_msgSend(v32, "suppressEngagement") & 1) == 0)
            {
              objc_msgSend(v32, "underlyingDictionary");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = (id)-[AMSEngagement enqueueData:](v30, "enqueueData:", v33);

              v8 = v89;
            }

          }
          v35 = v14;
          v36 = v10;
          objc_msgSend(v16, "allTableEntityPropertiesPermittedByConfiguration:externalValues:", v8, v10);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectForKey:", CFSTR("eventBody"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v38, "length"))
          {
            objc_msgSend(v16, "decorateReportingURL:", v92);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v16, "shouldSuppressUserInfo"));
            v40 = objc_claimAutoreleasedReturnValue();
            v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v41, "setObject:forKey:", v90, CFSTR("timestampInserted"));
            objc_msgSend(v41, "setObject:forKey:", &unk_1E481E750, CFSTR("timestampReported"));
            objc_msgSend(v41, "setObject:forKey:", v39, CFSTR("report_url"));
            objc_msgSend(v41, "setObject:forKey:", v40, CFSTR("supressDsid"));
            objc_msgSend(v41, "setObject:forKey:", v38, CFSTR("eventBody"));
            -[__CFString addObject:](v91, "addObject:", v41);

          }
          else
          {
            +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v39)
            {
              +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v42 = objc_msgSend(v39, "shouldLog");
            if (objc_msgSend(v39, "shouldLogToDisk"))
              v43 = v42 | 2;
            else
              v43 = v42;
            objc_msgSend(v39, "OSLogObject");
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              v44 = v43;
            else
              v44 = v43 & 2;
            if (v44)
            {
              v45 = (char *)objc_opt_class();
              v106 = 138412546;
              v107 = v45;
              v108 = 2112;
              v109 = v16;
              v46 = v45;
              LODWORD(v84) = 22;
              v83 = &v106;
              v47 = (void *)_os_log_send_and_compose_impl();

              if (!v47)
              {
                v8 = v89;
                v54 = (void *)v96;
                goto LABEL_42;
              }
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v47, 4, &v106, v84);
              v40 = objc_claimAutoreleasedReturnValue();
              free(v47);
              SSFileLog(v39, CFSTR("%@"), v48, v49, v50, v51, v52, v53, (uint64_t)v40);
            }
            v8 = v89;
          }
          v54 = (void *)v96;

LABEL_42:
          objc_autoreleasePoolPop(v54);
          v10 = v36;
          v14 = v35;
          v13 = v93;
LABEL_43:
          ++v15;
        }
        while (v13 != v15);
        v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
        v13 = v55;
      }
      while (v55);
    }

    if (!-[__CFString count](v91, "count"))
    {
      v7 = v87;
      v6 = v88;
      if (!v87)
      {
LABEL_78:

        goto LABEL_79;
      }
      dispatch_get_global_queue(0, 0);
      v82 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __70__SSMetricsController__serialQueueInsertEvents_withCompletionHandler___block_invoke_44;
      block[3] = &unk_1E47BB678;
      v99 = 1;
      v98 = v87;
      dispatch_async(v82, block);

      v68 = v98;
LABEL_77:

      goto LABEL_78;
    }
    v7 = v87;
    if (!SSIsInternalBuild() || !_os_feature_enabled_impl())
    {
LABEL_63:
      v68 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v68, "0", 110);
      SSXPCDictionarySetCFObject(v68, "1", v91);
      -[SSMetricsController _connection](v95, "_connection");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v100[0] = MEMORY[0x1E0C809B0];
      v100[1] = 3221225472;
      v100[2] = __70__SSMetricsController__serialQueueInsertEvents_withCompletionHandler___block_invoke;
      v100[3] = &unk_1E47B8630;
      v100[4] = v95;
      v101 = v87;
      objc_msgSend(v69, "sendMessage:withReply:", v68, v100);

      v6 = v88;
      goto LABEL_77;
    }
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v56)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v57 = objc_msgSend(v56, "shouldLog", v83);
    if (objc_msgSend(v56, "shouldLogToDisk"))
      v58 = v57 | 2;
    else
      v58 = v57;
    objc_msgSend(v56, "OSLogObject");
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
      v60 = v58;
    else
      v60 = v58 & 2;
    if (v60)
    {
      v106 = 136446210;
      v107 = "-[SSMetricsController _serialQueueInsertEvents:withCompletionHandler:]";
      LODWORD(v84) = 12;
      v61 = (void *)_os_log_send_and_compose_impl();

      if (!v61)
      {
LABEL_62:

        goto LABEL_63;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v61, 4, &v106, v84);
      v59 = objc_claimAutoreleasedReturnValue();
      free(v61);
      SSFileLog(v56, CFSTR("%@"), v62, v63, v64, v65, v66, v67, (uint64_t)v59);
    }

    goto LABEL_62;
  }
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v70 = objc_msgSend(v10, "shouldLog");
  if (objc_msgSend(v10, "shouldLogToDisk"))
    v71 = v70 | 2;
  else
    v71 = v70;
  objc_msgSend(v10, "OSLogObject");
  v72 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    v71 &= 2u;
  if (!v71)
    goto LABEL_74;
  v73 = (void *)objc_opt_class();
  v74 = v73;
  v106 = 138412546;
  v107 = (const char *)v73;
  v108 = 1024;
  LODWORD(v109) = objc_opt_class();
  LODWORD(v84) = 18;
  v75 = (void *)_os_log_send_and_compose_impl();

  if (v75)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v75, 4, &v106, v84);
    v72 = objc_claimAutoreleasedReturnValue();
    free(v75);
    SSFileLog(v10, CFSTR("%@"), v76, v77, v78, v79, v80, v81, (uint64_t)v72);
LABEL_74:

  }
LABEL_79:

}

- (id)_connection
{
  SSXPCConnection *connection;
  SSXPCConnection *v4;
  SSXPCConnection *v5;

  connection = self->_connection;
  if (!connection)
  {
    v4 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    v5 = self->_connection;
    self->_connection = v4;

    connection = self->_connection;
  }
  return connection;
}

- (void)dealloc
{
  void *v3;
  id flushTimerBlock;
  id v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x1E47DBF90, 0);

  flushTimerBlock = self->_flushTimerBlock;
  if (flushTimerBlock)
  {
    dispatch_block_cancel(flushTimerBlock);
    v5 = self->_flushTimerBlock;
    self->_flushTimerBlock = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)SSMetricsController;
  -[SSMetricsController dealloc](&v6, sel_dealloc);
}

void __70__SSMetricsController__serialQueueInsertEvents_withCompletionHandler___block_invoke_44(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 112, 0, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (void)_handleFlushTimer
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD block[4];
  id v17;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  LODWORD(location[0]) = 138412290;
  *(id *)((char *)location + 4) = (id)objc_opt_class();
  v7 = *(id *)((char *)location + 4);
  LODWORD(v15) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, location, v15);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v3, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v6);
LABEL_11:

  }
  objc_initWeak(location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SSMetricsController__handleFlushTimer__block_invoke;
  block[3] = &unk_1E47BA068;
  objc_copyWeak(&v17, location);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v17);
  objc_destroyWeak(location);
}

void __40__SSMetricsController__handleFlushTimer__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  id v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  _BYTE *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v2 = objc_alloc_init(MEMORY[0x1E0CFE2F0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v2, "applicationStateForApplication:", v4);

    if ((v5 & 8) != 0
      || (SSUIApplication(),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "applicationState"),
          v6,
          !v7))
    {
      objc_msgSend(v8, "_flushUnreportedEventsIfEnabled");
    }
    else
    {
      v8[49] = 1;
    }

    WeakRetained = v8;
  }

}

- (void)_flushUnreportedEventsIfEnabled
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *flushSerialQueue;
  NSObject *v16;
  uint64_t v17;
  _QWORD block[5];
  _QWORD v19[5];
  id v20;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  if (!self->_flushTimerEnabled || -[SSMetricsController isDisabled](self, "isDisabled"))
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    objc_msgSend(v3, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      v5 &= 2u;
    if (v5)
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = (id)objc_opt_class();
      v7 = *(id *)((char *)location + 4);
      LODWORD(v17) = 12;
      v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_14:

        flushSerialQueue = self->_flushSerialQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __54__SSMetricsController__flushUnreportedEventsIfEnabled__block_invoke_49;
        block[3] = &unk_1E47B8790;
        block[4] = self;
        dispatch_async(flushSerialQueue, block);
        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, location, v17);
      v6 = objc_claimAutoreleasedReturnValue();
      free(v8);
      SSFileLog(v3, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v6);
    }

    goto LABEL_14;
  }
  objc_initWeak(location, self);
  v16 = self->_flushSerialQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __54__SSMetricsController__flushUnreportedEventsIfEnabled__block_invoke;
  v19[3] = &unk_1E47BA0B8;
  objc_copyWeak(&v20, location);
  v19[4] = self;
  dispatch_async(v16, v19);
  objc_destroyWeak(&v20);
  objc_destroyWeak(location);
}

void __54__SSMetricsController__flushUnreportedEventsIfEnabled__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  _QWORD v4[5];

  +[SSTransactionStore defaultStore](SSTransactionStore, "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "takeKeepAliveWithTransactionID:", CFSTR("com.apple.storeservices.metricsFlushTransactionID"));

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__SSMetricsController__flushUnreportedEventsIfEnabled__block_invoke_2;
  v4[3] = &unk_1E47B9F78;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "flushUnreportedEventsWithCompletionHandler:", v4);

}

void __54__SSMetricsController__flushUnreportedEventsIfEnabled__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  id v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _BYTE v20[22];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2)
  {
    if (!v3)
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
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      v6 &= 2u;
    if (!v6)
      goto LABEL_22;
    *(_DWORD *)v20 = 138412546;
    *(_QWORD *)&v20[4] = objc_opt_class();
    *(_WORD *)&v20[12] = 2112;
    *(_QWORD *)&v20[14] = v2;
    v8 = *(id *)&v20[4];
    LODWORD(v19) = 22;
  }
  else
  {
    if (!v3)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v4, "shouldLog");
    if (objc_msgSend(v4, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v4, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      v10 &= 2u;
    if (!v10)
      goto LABEL_22;
    *(_DWORD *)v20 = 138412290;
    *(_QWORD *)&v20[4] = objc_opt_class();
    v8 = *(id *)&v20[4];
    LODWORD(v19) = 12;
  }
  v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, v20, v19, *(_OWORD *)v20);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v11);
    SSFileLog(v4, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v7);
LABEL_22:

  }
  +[SSTransactionStore defaultStore](SSTransactionStore, "defaultStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "releaseKeepAliveWithTransactionID:", CFSTR("com.apple.storeservices.metricsFlushTransactionID"));

}

void __54__SSMetricsController__flushUnreportedEventsIfEnabled__block_invoke_49(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (v2)
  {
    dispatch_block_cancel(v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 56);
    *(_QWORD *)(v3 + 56) = 0;

  }
}

void __39__SSMetricsController__setupFlushTimer__block_invoke_50(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 56);
    *(_QWORD *)(v2 + 56) = 0;

    objc_msgSend(WeakRetained, "_handleFlushTimer");
    objc_msgSend(WeakRetained, "_setupFlushTimer");
  }

}

- (void)flushUnreportedEventsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
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
  NSObject *v33;
  id *v34;
  uint64_t v35;
  _QWORD v36[5];
  id v37;
  id v38;
  _QWORD block[4];
  id v40;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SSMetricsController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSendDisabled");

  if (!v6)
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
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      v10 &= 2u;
    if (v10)
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = (id)objc_opt_class();
      v12 = *(id *)((char *)location + 4);
      LODWORD(v35) = 12;
      v34 = location;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, location, v35);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        free(v13);
        SSFileLog(v8, CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v14);

      }
    }
    else
    {

    }
    if (!SSIsInternalBuild() || !_os_feature_enabled_impl())
      goto LABEL_30;
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = objc_msgSend(v21, "shouldLog", v34);
    if (objc_msgSend(v21, "shouldLogToDisk"))
      v23 = v22 | 2;
    else
      v23 = v22;
    objc_msgSend(v21, "OSLogObject");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      v25 = v23;
    else
      v25 = v23 & 2;
    if (v25)
    {
      LODWORD(location[0]) = 136446210;
      *(id *)((char *)location + 4) = "-[SSMetricsController flushUnreportedEventsWithCompletionHandler:]";
      LODWORD(v35) = 12;
      v26 = (void *)_os_log_send_and_compose_impl();

      if (!v26)
      {
LABEL_29:

LABEL_30:
        objc_initWeak(location, self);
        -[SSMetricsController serialQueue](self, "serialQueue");
        v33 = objc_claimAutoreleasedReturnValue();
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __66__SSMetricsController_flushUnreportedEventsWithCompletionHandler___block_invoke_51;
        v36[3] = &unk_1E47BB6A0;
        objc_copyWeak(&v38, location);
        v36[4] = self;
        v37 = v4;
        dispatch_async(v33, v36);

        objc_destroyWeak(&v38);
        objc_destroyWeak(location);
        goto LABEL_31;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v26, 4, location, v35);
      v24 = objc_claimAutoreleasedReturnValue();
      free(v26);
      SSFileLog(v21, CFSTR("%@"), v27, v28, v29, v30, v31, v32, (uint64_t)v24);
    }

    goto LABEL_29;
  }
  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__SSMetricsController_flushUnreportedEventsWithCompletionHandler___block_invoke;
    block[3] = &unk_1E47BA738;
    v40 = v4;
    dispatch_async(v7, block);

  }
LABEL_31:

}

uint64_t __66__SSMetricsController_flushUnreportedEventsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__SSMetricsController_flushUnreportedEventsWithCompletionHandler___block_invoke_51(uint64_t a1)
{
  id WeakRetained;
  xpc_object_t v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "0", 114);
  objc_msgSend(WeakRetained, "_connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__SSMetricsController_flushUnreportedEventsWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E47B8630;
  v5 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v4, "sendMessage:withReply:", v3, v6);

}

void __66__SSMetricsController_flushUnreportedEventsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  int v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  _QWORD block[4];
  id v34;
  id v35;
  int v36;
  id v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!*(_QWORD *)(a1 + 40))
  {
    v6 = objc_opt_class();
    v7 = (id)SSXPCDictionaryCopyObjectWithClass(v4, "0", v6);
    v8 = objc_msgSend(v7, "intValue");
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8)
    {
      if (!v9)
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
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        v12 &= 2u;
      if (!v12)
        goto LABEL_30;
      v14 = (void *)objc_opt_class();
      v15 = v14;
      v36 = 138412546;
      v37 = v14;
      v38 = 1024;
      v39 = objc_msgSend(v7, "intValue");
      LODWORD(v32) = 18;
    }
    else
    {
      if (!v9)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v19 = objc_msgSend(v10, "shouldLog");
      if (objc_msgSend(v10, "shouldLogToDisk"))
        v20 = v19 | 2;
      else
        v20 = v19;
      objc_msgSend(v10, "OSLogObject");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        v20 &= 2u;
      if (!v20)
        goto LABEL_30;
      v36 = 138412290;
      v37 = (id)objc_opt_class();
      v15 = v37;
      LODWORD(v32) = 12;
    }
    v21 = (void *)_os_log_send_and_compose_impl();

    if (!v21)
      goto LABEL_31;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v21, 4, &v36, v32);
    v13 = objc_claimAutoreleasedReturnValue();
    free(v21);
    SSFileLog(v10, CFSTR("%@"), v22, v23, v24, v25, v26, v27, (uint64_t)v13);
LABEL_30:

    goto LABEL_31;
  }
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    v5 = 121;
  }
  else
  {
    if (v3 && MEMORY[0x1A85863E4](v3) == MEMORY[0x1E0C812F8])
    {
      v28 = objc_opt_class();
      v29 = (void *)SSXPCDictionaryCopyObjectWithClass(v4, "0", v28);
      if (objc_msgSend(v29, "intValue"))
      {
        v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
        xpc_dictionary_get_value(v4, "1");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v30, "initWithXPCEncoding:", v31);

      }
      else
      {
        v16 = 0;
      }

      goto LABEL_18;
    }
    v5 = 111;
  }
  SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
  dispatch_get_global_queue(0, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__SSMetricsController_flushUnreportedEventsWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E47B8A98;
  v18 = *(id *)(a1 + 40);
  v34 = v16;
  v35 = v18;
  v7 = v16;
  dispatch_async(v17, block);

  v10 = v35;
LABEL_31:

}

uint64_t __66__SSMetricsController_flushUnreportedEventsWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __58__SSMetricsController_insertEvents_withCompletionHandler___block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__SSMetricsController_insertEvents_withCompletionHandler___block_invoke_54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__SSMetricsController_insertEvents_withCompletionHandler___block_invoke_55(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)locationWithPosition:(int64_t)a3 type:(id)a4 fieldData:(id)a5
{
  id v8;
  id v9;
  SSMetricsEventLocation *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  SSMetricsEventLocation *v34;
  _QWORD v35[4];
  SSMetricsEventLocation *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(SSMetricsEventLocation);
  -[SSMetricsEventLocation setLocationPosition:](v10, "setLocationPosition:", a3);
  -[SSMetricsEventLocation setLocationType:](v10, "setLocationType:", v8);
  -[SSMetricsConfiguration fieldsMap](self->_configuration, "fieldsMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("single"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v14 = MEMORY[0x1E0C809B0];
  if ((isKindOfClass & 1) != 0)
  {
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __59__SSMetricsController_locationWithPosition_type_fieldData___block_invoke;
    v35[3] = &unk_1E47BAEA8;
    v36 = v10;
    -[SSMetricsController _enumerateFieldValuesWithMap:fieldData:block:](self, "_enumerateFieldValuesWithMap:fieldData:block:", v12, v9, v35);

  }
  objc_msgSend(v11, "objectForKey:", CFSTR("multi"));
  v15 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v28 = (void *)v15;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33[0] = v14;
    v33[1] = 3221225472;
    v33[2] = __59__SSMetricsController_locationWithPosition_type_fieldData___block_invoke_2;
    v33[3] = &unk_1E47BAEA8;
    v34 = v10;
    -[SSMetricsController _enumerateFieldValuesWithMap:fieldData:block:](self, "_enumerateFieldValuesWithMap:fieldData:block:", v15, v9, v33);

  }
  objc_msgSend(v11, "objectForKey:", CFSTR("custom"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = v12;
    v26 = v11;
    v27 = v8;
    objc_msgSend(v16, "objectForKey:", CFSTR("location"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v30 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[SSMetricsController _valueForField:withFieldData:](self, "_valueForField:withFieldData:", v22, v9);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
              -[SSMetricsEventLocation setValue:forLocationKey:](v10, "setValue:forLocationKey:", v23, v22);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v19);
    }

    v11 = v26;
    v8 = v27;
    v12 = v25;
  }

  return v10;
}

uint64_t __59__SSMetricsController_locationWithPosition_type_fieldData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setValue:forLocationKey:", a3, a2);
  *a4 = 1;
  return result;
}

uint64_t __59__SSMetricsController_locationWithPosition_type_fieldData___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forLocationKey:", a3, a2);
}

- (id)pingURLs
{
  return -[SSMetricsConfiguration pingURLs](self->_configuration, "pingURLs");
}

- (void)recordAnalyticsForMetricsDialogEvent:(id)a3 withTopic:(id)a4
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
  void *v21;
  uint64_t v22;
  id v23;
  _QWORD v24[5];
  int v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  if (SSIsDaemon())
  {
    v23 = objc_alloc_init(NSClassFromString(CFSTR("MetricsController")));
    objc_msgSend(v23, "recordAnalyticsWithMetricsDialogEvent:forTopic:", v7, v6);

    return;
  }
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
      v25 = 136446210;
      v26 = "-[SSMetricsController recordAnalyticsForMetricsDialogEvent:withTopic:]";
      LODWORD(v22) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v25, v22);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_17;
  }
LABEL_18:
  v20 = SSXPCCreateMessageDictionary(197);
  SSXPCDictionarySetObject(v20, "1", v7);

  SSXPCDictionarySetObject(v20, "2", v6);
  -[SSMetricsController _connection](self, "_connection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __70__SSMetricsController_recordAnalyticsForMetricsDialogEvent_withTopic___block_invoke;
  v24[3] = &unk_1E47BB6F0;
  v24[4] = self;
  objc_msgSend(v21, "sendMessage:withReply:", v20, v24);

}

void __70__SSMetricsController_recordAnalyticsForMetricsDialogEvent_withTopic___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  int v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  int v19;
  int v20;
  void *v21;
  const __CFString *v22;
  id v23;
  uint64_t v24;
  _BYTE v25[22];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = v2;
  if (v2 == (id)MEMORY[0x1E0C81258])
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v4, "shouldLog");
    if (objc_msgSend(v4, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v4, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      v9 &= 2u;
    if (!v9)
      goto LABEL_24;
LABEL_21:
    *(_DWORD *)v25 = 138412290;
    *(_QWORD *)&v25[4] = objc_opt_class();
    v10 = *(id *)&v25[4];
    LODWORD(v24) = 12;
    v11 = (void *)_os_log_send_and_compose_impl();

    goto LABEL_22;
  }
  if (!v2 || MEMORY[0x1A85863E4](v2) != MEMORY[0x1E0C812F8])
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
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      v6 &= 2u;
    if (!v6)
      goto LABEL_24;
    goto LABEL_21;
  }
  v18 = xpc_dictionary_get_BOOL(v3, "0");
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v20 = v19 | 2;
  else
    v20 = v19;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    v20 &= 2u;
  if (!v20)
    goto LABEL_24;
  v21 = (void *)objc_opt_class();
  v22 = CFSTR("NO");
  if (v18)
    v22 = CFSTR("YES");
  *(_DWORD *)v25 = 138412546;
  *(_QWORD *)&v25[4] = v21;
  *(_WORD *)&v25[12] = 2112;
  *(_QWORD *)&v25[14] = v22;
  v23 = v21;
  LODWORD(v24) = 22;
  v11 = (void *)_os_log_send_and_compose_impl();

LABEL_22:
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, v25, v24, *(_OWORD *)v25);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v11);
    SSFileLog(v4, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v7);
LABEL_24:

  }
}

- (void)setPageConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[SSMetricsController serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SSMetricsController_setPageConfiguration___block_invoke;
  block[3] = &unk_1E47B8768;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __44__SSMetricsController_setPageConfiguration___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 24))
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 24), "setChildConfiguration:", *(_QWORD *)(result + 40));
  return result;
}

- (void)_applicationWillEnterForeground
{
  if (self->_flushOnForeground)
  {
    -[SSMetricsController _flushUnreportedEventsIfEnabled](self, "_flushUnreportedEventsIfEnabled");
    self->_flushOnForeground = 0;
  }
}

- (void)_enumerateFieldValuesWithMap:(id)a3 fieldData:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__SSMetricsController__enumerateFieldValuesWithMap_fieldData_block___block_invoke;
  v12[3] = &unk_1E47BB718;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v12);

}

void __68__SSMetricsController__enumerateFieldValuesWithMap_fieldData_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(*(id *)(a1 + 32), "_valueForField:withFieldData:", v12, *(_QWORD *)(a1 + 40));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (v13)
                (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v9);
      }

    }
  }

}

- (id)_valueForField:(id)a3 withFieldData:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  -[SSMetricsConfiguration valueForConfigurationKey:](self->_configuration, "valueForConfigurationKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "valueForMetricsField:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)isFlushTimerEnabled
{
  return self->_flushTimerEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flushTimerQueue, 0);
  objc_storeStrong(&self->_flushTimerBlock, 0);
  objc_storeStrong((id *)&self->_flushSerialQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_engagement, 0);
}

@end
