@implementation SSDownload

- (SSDownload)initWithPersistentIdentifier:(int64_t)a3
{
  SSDownload *v3;
  SSDownload *v4;

  v3 = -[SSEntity _initWithPersistentIdentifier:](self, "_initWithPersistentIdentifier:", a3);
  v4 = v3;
  if (v3 && !v3->super._connection)
  {
    if (initWithPersistentIdentifier__sOnce != -1)
      dispatch_once(&initWithPersistentIdentifier__sOnce, &__block_literal_global_1);
    v4->super._connection = (SSXPCConnection *)(id)initWithPersistentIdentifier__sConnection;
  }
  return v4;
}

SSXPCConnection *__43__SSDownload_initWithPersistentIdentifier___block_invoke()
{
  SSXPCConnection *result;

  result = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  initWithPersistentIdentifier__sConnection = (uint64_t)result;
  return result;
}

- (id)_initWithLocalPropertyValues:(id)a3
{
  CFArrayRef v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;

  v4 = SSXPCCreateCFObjectFromXPCObject((const __CFDictionary *)a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = (void *)-[__CFArray objectForKey:](v4, "objectForKey:", CFSTR("0"))) != 0)
  {
    v6 = -[SSEntity _initWithPersistentIdentifier:](self, "_initWithPersistentIdentifier:", objc_msgSend(v5, "longLongValue"));
    if (v6)
    {
      v7 = -[__CFArray objectForKey:](v4, "objectForKey:", CFSTR("1"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (id)v6[4];
        if (!v8)
        {
          v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v6[4] = v8;
        }
        objc_msgSend(v8, "addEntriesFromDictionary:", v7);
      }
      v9 = -[__CFArray objectForKey:](v4, "objectForKey:", CFSTR("2"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = (id)v6[3];
        if (!v10)
        {
          v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v6[3] = v10;
        }
        objc_msgSend(v10, "addEntriesFromDictionary:", v9);
      }
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSDownload;
  -[SSEntity dealloc](&v3, sel_dealloc);
}

- (BOOL)addAsset:(id)a3 forType:(id)a4
{
  NSObject *dispatchQueue;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  char v11;
  _QWORD v13[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __31__SSDownload_addAsset_forType___block_invoke;
  v13[3] = &unk_1E47B8CE8;
  v13[4] = self;
  v13[5] = a4;
  v13[6] = a3;
  v13[7] = &v14;
  dispatch_sync(dispatchQueue, v13);
  if (*((_BYTE *)v15 + 24))
  {
    v8 = objc_msgSend(a3, "_legacyAssetType");
    if (v8)
    {
      if (objc_msgSend(a4, "isEqualToString:", CFSTR("media"))
        && !-[SSEntity valueForProperty:](self, "valueForProperty:", CFSTR("1")))
      {
        v9 = 0;
        v10 = CFSTR("other");
        while (__DownloadKindMapping[v9] != v8)
        {
          v9 += 2;
          if (v9 == 28)
            goto LABEL_10;
        }
        v10 = (const __CFString *)__DownloadKindMapping[v9 + 1];
LABEL_10:
        -[SSEntity setValue:forProperty:](self, "setValue:forProperty:", v10, CFSTR("1"));
      }
    }
  }
  v11 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v11;
}

void __31__SSDownload_addAsset_forType___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1[4];
  if (!*(_QWORD *)(v1 + 8))
  {
    v3 = *(void **)(v1 + 64);
    if (!v3)
    {
      *(_QWORD *)(a1[4] + 64) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v3 = *(void **)(a1[4] + 64);
    }
    v4 = (void *)objc_msgSend(v3, "objectForKey:", a1[5]);
    if (v4)
    {
      objc_msgSend(v4, "addObject:", a1[6]);
    }
    else
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", a1[6], 0);
      objc_msgSend(*(id *)(a1[4] + 64), "setObject:forKey:", v5, a1[5]);

    }
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }
}

- (id)assetsForType:(id)a3
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
  NSObject *dispatchQueue;
  uint64_t v19;
  xpc_object_t v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v27;
  _QWORD v28[7];
  _QWORD block[8];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
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
      LODWORD(v36) = 136446210;
      *(_QWORD *)((char *)&v36 + 4) = "-[SSDownload assetsForType:]";
      LODWORD(v27) = 12;
      v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v36, v27);
        free(v10);
        SSFileLog(v5, CFSTR("%@"), v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  *(_QWORD *)&v36 = 0;
  *((_QWORD *)&v36 + 1) = &v36;
  v37 = 0x3052000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  v40 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3052000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  v35 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v19 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__SSDownload_assetsForType___block_invoke;
  block[3] = &unk_1E47B8D18;
  block[6] = &v30;
  block[7] = &v36;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(dispatchQueue, block);
  if (v31[5])
  {
    v20 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v20, "0", 11);
    xpc_dictionary_set_int64(v20, "1", self->super._pid);
    SSXPCDictionarySetCFObject(v20, "2", (__CFString *)a3);
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = dispatch_semaphore_create(0);
    v23 = (void *)v31[5];
    v28[0] = v19;
    v28[1] = 3221225472;
    v28[2] = __28__SSDownload_assetsForType___block_invoke_2;
    v28[3] = &unk_1E47B8D40;
    v28[5] = v22;
    v28[6] = &v30;
    v28[4] = v21;
    objc_msgSend(v23, "sendMessage:withReply:", v20, v28);
    dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v22);
    v24 = v21;
    *(_QWORD *)(*((_QWORD *)&v36 + 1) + 40) = v24;

    xpc_release(v20);
  }
  v25 = *(id *)(*((_QWORD *)&v36 + 1) + 40);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);
  return v25;
}

id __28__SSDownload_assetsForType___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id result;
  uint64_t v5;

  v2 = a1[4];
  v3 = *(void **)(v2 + 8);
  if (v3)
  {
    result = v3;
    v5 = a1[6];
  }
  else
  {
    result = (id)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 64), "objectForKey:", a1[5]), "copy");
    v5 = a1[7];
  }
  *(_QWORD *)(*(_QWORD *)(v5 + 8) + 40) = result;
  return result;
}

intptr_t __28__SSDownload_assetsForType___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t value;
  void *v6;
  size_t count;
  size_t v8;
  size_t i;
  id v10;

  if (MEMORY[0x1A85863E4](a2) == MEMORY[0x1E0C812F8])
  {
    value = xpc_dictionary_get_value(a2, "0");
    if (value)
    {
      v6 = value;
      count = xpc_array_get_count(value);
      if (count)
      {
        v8 = count;
        for (i = 0; i != v8; ++i)
        {
          v10 = -[SSEntity _initWithPersistentIdentifier:]([SSDownloadAsset alloc], "_initWithPersistentIdentifier:", xpc_array_get_int64(v6, i));
          objc_msgSend(v10, "_becomeManagedOnConnection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);

        }
      }
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)backgroundNetworkingJobGroupName
{
  return -[SSEntity valueForProperty:](self, "valueForProperty:", CFSTR("s"));
}

- (int64_t)bytesDownloaded
{
  int64_t result;

  result = -[SSEntity valueForExternalProperty:](self, "valueForExternalProperty:", CFSTR("0"));
  if (result)
    return objc_msgSend((id)result, "longLongValue");
  return result;
}

- (int64_t)bytesTotal
{
  int64_t result;

  result = -[SSEntity valueForExternalProperty:](self, "valueForExternalProperty:", CFSTR("1"));
  if (result)
    return objc_msgSend((id)result, "longLongValue");
  return result;
}

- (id)downloadPhaseIdentifier
{
  return -[SSEntity valueForProperty:](self, "valueForProperty:", CFSTR("I"));
}

- (SSDownloadPolicy)downloadPolicy
{
  id v2;
  objc_class *v3;

  v2 = -[SSEntity valueForExternalProperty:](self, "valueForExternalProperty:", CFSTR("7"));
  v3 = (objc_class *)objc_opt_class();
  return (SSDownloadPolicy *)(id)SSCodingCreateObjectWithArchivedData((uint64_t)v2, v3);
}

- (int64_t)downloadSizeLimit
{
  id v2;

  v2 = -[SSEntity valueForExternalProperty:](self, "valueForExternalProperty:", CFSTR("8"));
  if (v2)
    return objc_msgSend(v2, "longLongValue");
  else
    return 0;
}

- (double)estimatedSecondsRemaining
{
  id v2;
  double result;

  v2 = -[SSEntity valueForExternalProperty:](self, "valueForExternalProperty:", CFSTR("2"));
  if (!v2)
    return -1.0;
  objc_msgSend(v2, "doubleValue");
  return result;
}

- (id)failureError
{
  return -[SSDownload _errorWithData:](self, "_errorWithData:", -[SSEntity valueForProperty:](self, "valueForProperty:", CFSTR("J")));
}

- (BOOL)isCancelable
{
  int v3;
  id v5[2];
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v3 = -[SSEntity _isManaged](self, "_isManaged");
  if (v3)
  {
    v9[0] = CFSTR("AA");
    v9[1] = CFSTR("P");
    v9[2] = CFSTR("M");
    v9[3] = CFSTR("I");
    v9[4] = CFSTR("9");
    -[SSEntity getValues:forProperties:count:](self, "getValues:forProperties:count:", v5, v9, 5);
    if (!v5[0] || (v3 = objc_msgSend(v5[0], "BOOLValue")) != 0)
    {
      if (v8 && !v5[1] || v6 && (objc_msgSend(v6, "BOOLValue") & 1) != 0)
      {
        LOBYTE(v3) = 0;
      }
      else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SSDownloadPhaseWaiting")) & 1) != 0
             || (objc_msgSend(v7, "isEqualToString:", CFSTR("SSDownloadPhaseDataRestore")) & 1) != 0
             || (objc_msgSend(v7, "isEqualToString:", CFSTR("SSDownloadPhaseDownloading")) & 1) != 0
             || (objc_msgSend(v7, "isEqualToString:", CFSTR("SSDownloadPhasePaused")) & 1) != 0
             || (objc_msgSend(v7, "isEqualToString:", CFSTR("SSDownloadPhasePreflight")) & 1) != 0)
      {
        LOBYTE(v3) = 1;
      }
      else
      {
        LOBYTE(v3) = objc_msgSend(v7, "isEqualToString:", CFSTR("SSDownloadPhaseFailed"));
      }
    }
  }
  return v3;
}

- (BOOL)isEligibleForRestore:(id *)a3
{
  SSRestoreContentItem *v4;

  v4 = -[SSRestoreContentItem initWithRestoreDownload:]([SSRestoreContentItem alloc], "initWithRestoreDownload:", self);
  LOBYTE(a3) = -[SSRestoreContentItem isEligibleForRestore:](v4, "isEligibleForRestore:", a3);

  return (char)a3;
}

- (id)networkConstraints
{
  SSNetworkConstraints *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(SSNetworkConstraints);
  v4 = -[SSDownloadPolicy policyRules](-[SSDownload downloadPolicy](self, "downloadPolicy"), "policyRules");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v10 = (void *)objc_msgSend(v9, "networkTypes");
        v11 = objc_msgSend(v9, "downloadSizeLimit");
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v18;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v18 != v14)
                objc_enumerationMutation(v10);
              -[SSNetworkConstraints setSizeLimit:forNetworkType:](v3, "setSizeLimit:forNetworkType:", v11, objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "integerValue"));
            }
            v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v13);
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }
  return v3;
}

- (void)pause
{
  id v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *dispatchQueue;
  xpc_object_t v17;
  xpc_object_t v18;
  uint64_t v19;
  _QWORD block[6];
  __int128 v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v3 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v3)
      v3 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_FAULT))
      v6 = v5;
    else
      v6 = v5 & 2;
    if (v6)
    {
      LODWORD(v21) = 136446210;
      *(_QWORD *)((char *)&v21 + 4) = "-[SSDownload pause]";
      LODWORD(v19) = 12;
      v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v21, v19);
        free(v8);
        SSFileLog(v3, CFSTR("%@"), v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  *(_QWORD *)&v21 = 0;
  *((_QWORD *)&v21 + 1) = &v21;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __19__SSDownload_pause__block_invoke;
  block[3] = &unk_1E47B8DF8;
  block[4] = self;
  block[5] = &v21;
  dispatch_sync(dispatchQueue, block);
  if (*(_QWORD *)(*((_QWORD *)&v21 + 1) + 40))
  {
    v17 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v17, "0", 17);
    v18 = xpc_array_create(0, 0);
    xpc_array_set_int64(v18, 0xFFFFFFFFFFFFFFFFLL, self->super._pid);
    xpc_dictionary_set_value(v17, "1", v18);
    xpc_release(v18);
    objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 40), "sendMessage:withReply:", v17, &__block_literal_global_83);
    xpc_release(v17);

  }
  else
  {
    -[SSEntity setValue:forProperty:](self, "setValue:forProperty:", CFSTR("SSDownloadPhasePaused"), CFSTR("I"));
  }
  _Block_object_dispose(&v21, 8);
}

id __19__SSDownload_pause__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (double)percentComplete
{
  double result;

  objc_msgSend(-[SSEntity valueForExternalProperty:](self, "valueForExternalProperty:", CFSTR("4")), "doubleValue");
  return result;
}

- (int64_t)persistentIdentifier
{
  return self->super._pid;
}

- (void)prioritizeAboveDownload:(id)a3 completionBlock:(id)a4
{
  id v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *dispatchQueue;
  uint64_t v21;
  xpc_object_t v22;
  void *v23;
  NSObject *global_queue;
  uint64_t v25;
  _QWORD v26[6];
  _QWORD v27[5];
  _QWORD block[7];
  __int128 v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v7 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v7)
      v7 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v10 = v9;
    else
      v10 = v9 & 2;
    if (v10)
    {
      LODWORD(v29) = 136446210;
      *(_QWORD *)((char *)&v29 + 4) = "-[SSDownload prioritizeAboveDownload:completionBlock:]";
      LODWORD(v25) = 12;
      v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        v12 = (void *)v11;
        v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v29, v25);
        free(v12);
        SSFileLog(v7, CFSTR("%@"), v14, v15, v16, v17, v18, v19, v13);
      }
    }
  }
  *(_QWORD *)&v29 = 0;
  *((_QWORD *)&v29 + 1) = &v29;
  v30 = 0x3052000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  v33 = 0;
  if (a3)
    a3 = (id)objc_msgSend(a3, "persistentIdentifier");
  dispatchQueue = self->super._dispatchQueue;
  v21 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SSDownload_prioritizeAboveDownload_completionBlock___block_invoke;
  block[3] = &unk_1E47B8E68;
  block[4] = self;
  block[5] = &v29;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  if (*(_QWORD *)(*((_QWORD *)&v29 + 1) + 40))
  {
    v22 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v22, "0", 28);
    xpc_dictionary_set_int64(v22, "1", self->super._pid);
    xpc_dictionary_set_int64(v22, "2", (int64_t)a3);
    v23 = *(void **)(*((_QWORD *)&v29 + 1) + 40);
    v26[0] = v21;
    v26[1] = 3221225472;
    v26[2] = __54__SSDownload_prioritizeAboveDownload_completionBlock___block_invoke_3;
    v26[3] = &unk_1E47B8EE0;
    v26[4] = self;
    v26[5] = a4;
    objc_msgSend(v23, "sendMessage:withReply:", v22, v26);
    xpc_release(v22);

  }
  else if (a4)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v27[0] = v21;
    v27[1] = 3221225472;
    v27[2] = __54__SSDownload_prioritizeAboveDownload_completionBlock___block_invoke_2;
    v27[3] = &unk_1E47B8E90;
    v27[4] = a4;
    dispatch_async(global_queue, v27);
  }
  _Block_object_dispose(&v29, 8);
}

uint64_t __54__SSDownload_prioritizeAboveDownload_completionBlock___block_invoke(_QWORD *a1)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = *(id *)(a1[4] + 8);

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", a1[6]);
  *(_QWORD *)(a1[4] + 80) = result;
  return result;
}

uint64_t __54__SSDownload_prioritizeAboveDownload_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__SSDownload_prioritizeAboveDownload_completionBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  if (*(_QWORD *)(a1 + 40))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "_errorWithXPCReply:", a2);
    global_queue = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__SSDownload_prioritizeAboveDownload_completionBlock___block_invoke_4;
    v6[3] = &unk_1E47B8EB8;
    v5 = *(_QWORD *)(a1 + 40);
    v6[4] = v3;
    v6[5] = v5;
    dispatch_async(global_queue, v6);
  }
}

uint64_t __54__SSDownload_prioritizeAboveDownload_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)removeAsset:(id)a3
{
  NSObject *dispatchQueue;
  char v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__SSDownload_removeAsset___block_invoke;
  block[3] = &unk_1E47B8F30;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  dispatch_sync(dispatchQueue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __26__SSDownload_removeAsset___block_invoke(int8x16_t *a1)
{
  uint64_t v1;
  id v3;
  _QWORD v4[4];
  int8x16_t v5;
  uint64_t v6;

  v1 = a1[2].i64[0];
  if (!*(_QWORD *)(v1 + 8))
  {
    v3 = (id)objc_msgSend(*(id *)(v1 + 64), "copy");
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __26__SSDownload_removeAsset___block_invoke_2;
    v4[3] = &unk_1E47B8F08;
    v5 = vextq_s8(a1[2], a1[2], 8uLL);
    v6 = a1[3].i64[0];
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

  }
}

uint64_t __26__SSDownload_removeAsset___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "indexOfObjectIdenticalTo:", a1[4]);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a3, "removeObjectAtIndex:", result);
    result = objc_msgSend(a3, "count");
    if (!result)
      result = objc_msgSend(*(id *)(a1[5] + 64), "removeObjectForKey:", a2);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)resume
{
  NSObject *dispatchQueue;
  xpc_object_t v4;
  xpc_object_t v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __20__SSDownload_resume__block_invoke;
  v6[3] = &unk_1E47B8DF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(dispatchQueue, v6);
  if (v8[5])
  {
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v4, "0", 19);
    v5 = xpc_array_create(0, 0);
    xpc_array_set_int64(v5, 0xFFFFFFFFFFFFFFFFLL, self->super._pid);
    xpc_dictionary_set_value(v4, "1", v5);
    xpc_release(v5);
    objc_msgSend((id)v8[5], "sendMessage:withReply:", v4, &__block_literal_global_86);
    xpc_release(v4);

  }
  else
  {
    -[SSEntity setValue:forProperty:](self, "setValue:forProperty:", 0, CFSTR("I"));
  }
  _Block_object_dispose(&v7, 8);
}

id __20__SSDownload_resume__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)restart
{
  NSObject *dispatchQueue;
  xpc_object_t v4;
  xpc_object_t v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __21__SSDownload_restart__block_invoke;
  v6[3] = &unk_1E47B8DF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(dispatchQueue, v6);
  if (v8[5])
  {
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v4, "0", 20);
    v5 = xpc_array_create(0, 0);
    xpc_array_set_int64(v5, 0xFFFFFFFFFFFFFFFFLL, self->super._pid);
    xpc_dictionary_set_value(v4, "1", v5);
    xpc_release(v5);
    objc_msgSend((id)v8[5], "sendMessage:withReply:", v4, &__block_literal_global_87);
    xpc_release(v4);

  }
  _Block_object_dispose(&v7, 8);
}

id __21__SSDownload_restart__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setBackgroundNetworkingJobGroupName:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[SSEntity setValue:forProperty:](self, "setValue:forProperty:", v4, CFSTR("s"));

}

- (void)setDownloadHandler:(id)a3 completionBlock:(id)a4
{
  id v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *dispatchQueue;
  uint64_t v21;
  xpc_object_t v22;
  void *v23;
  NSObject *global_queue;
  __int128 *v25;
  uint64_t v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD block[6];
  __int128 v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v7 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v7)
      v7 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_FAULT))
      v10 = v9;
    else
      v10 = v9 & 2;
    if (v10)
    {
      LODWORD(v30) = 136446210;
      *(_QWORD *)((char *)&v30 + 4) = "-[SSDownload setDownloadHandler:completionBlock:]";
      LODWORD(v26) = 12;
      v25 = &v30;
      v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        v12 = (void *)v11;
        v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v30, v26);
        free(v12);
        SSFileLog(v7, CFSTR("%@"), v14, v15, v16, v17, v18, v19, v13);
      }
    }
  }
  *(_QWORD *)&v30 = 0;
  *((_QWORD *)&v30 + 1) = &v30;
  v31 = 0x3052000000;
  v32 = __Block_byref_object_copy__0;
  v33 = __Block_byref_object_dispose__0;
  v34 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v21 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SSDownload_setDownloadHandler_completionBlock___block_invoke;
  block[3] = &unk_1E47B8DF8;
  block[4] = self;
  block[5] = &v30;
  dispatch_sync(dispatchQueue, block);
  if (*(_QWORD *)(*((_QWORD *)&v30 + 1) + 40))
  {
    v22 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v22, "0", 23);
    xpc_dictionary_set_int64(v22, "1", self->super._pid);
    if (a3)
      xpc_dictionary_set_int64(v22, "2", objc_msgSend(a3, "handlerIdentifier"));
    v23 = *(void **)(*((_QWORD *)&v30 + 1) + 40);
    v27[0] = v21;
    v27[1] = 3221225472;
    v27[2] = __49__SSDownload_setDownloadHandler_completionBlock___block_invoke_3;
    v27[3] = &unk_1E47B8FA0;
    v27[4] = a4;
    objc_msgSend(v23, "sendMessage:withReply:", v22, v27, v25);
    xpc_release(v22);

  }
  else
  {
    -[SSEntity setValue:forProperty:](self, "setValue:forProperty:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a3, "handlerIdentifier")), CFSTR("O"));
    if (a4)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v28[0] = v21;
      v28[1] = 3221225472;
      v28[2] = __49__SSDownload_setDownloadHandler_completionBlock___block_invoke_2;
      v28[3] = &unk_1E47B8E90;
      v28[4] = a4;
      dispatch_async(global_queue, v28);
    }
  }
  _Block_object_dispose(&v30, 8);
}

id __49__SSDownload_setDownloadHandler_completionBlock___block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __49__SSDownload_setDownloadHandler_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__SSDownload_setDownloadHandler_completionBlock___block_invoke_3(uint64_t a1, xpc_object_t xdict)
{
  CFArrayRef v4;
  NSObject *global_queue;
  uint64_t v6;
  _QWORD v7[6];

  if (*(_QWORD *)(a1 + 32))
  {
    if (xpc_dictionary_get_BOOL(xdict, "0"))
      v4 = 0;
    else
      v4 = SSXPCDictionaryCopyCFObject(xdict, "1");
    global_queue = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__SSDownload_setDownloadHandler_completionBlock___block_invoke_4;
    v7[3] = &unk_1E47B8EB8;
    v6 = *(_QWORD *)(a1 + 32);
    v7[4] = v4;
    v7[5] = v6;
    dispatch_async(global_queue, v7);

  }
}

uint64_t __49__SSDownload_setDownloadHandler_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setDownloadPolicy:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id ArchivableData;

  ArchivableData = SSCodingCreateArchivableData(a3);
  v4 = objc_alloc(MEMORY[0x1E0C99D80]);
  v5 = (uint64_t)ArchivableData;
  if (!ArchivableData)
    v5 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_msgSend(v4, "initWithObjectsAndKeys:", v5, CFSTR("7"), 0);
  -[SSEntity setExternalValuesWithDictionary:](self, "setExternalValuesWithDictionary:", v6);

}

- (void)setNetworkConstraints:(id)a3
{
  SSDownloadPolicy *v4;

  if (a3)
  {
    v4 = -[SSDownloadPolicy initWithNetworkConstraints:]([SSDownloadPolicy alloc], "initWithNetworkConstraints:", a3);
    -[SSDownload setDownloadPolicy:](self, "setDownloadPolicy:", v4);

  }
  else
  {
    -[SSDownload setDownloadPolicy:](self, "setDownloadPolicy:");
  }
}

- (void)setValuesWithStoreDownloadMetadata:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "newDownloadProperties");
  -[SSEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v4);

}

+ (int64_t)_existsMessage
{
  return 52;
}

+ (int64_t)_getExternalValuesMessage
{
  return 27;
}

+ (int64_t)_getValueMessage
{
  return 13;
}

+ (int64_t)_setExternalValuesMessage
{
  return 32;
}

+ (int64_t)_setValuesMessage
{
  return 24;
}

- (void)_addCachedExternalValues:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__SSDownload__addCachedExternalValues___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

void *__39__SSDownload__addCachedExternalValues___block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  result = (void *)objc_msgSend(v2, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88))
  {
    result = (void *)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("4"));
    if (result)
    {
      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
      objc_msgSend(result, "floatValue");
      return (void *)objc_msgSend(v4, "setPercentComplete:");
    }
  }
  return result;
}

- (void)_addCachedPropertyValues:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__SSDownload__addCachedPropertyValues___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __39__SSDownload__addCachedPropertyValues___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  int v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  result = objc_msgSend(v2, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88))
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("K"));
    v5 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("I"));
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "_applyPhase:toStatus:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
    }
    else if (!v4)
    {
      goto LABEL_13;
    }
    v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", CFSTR("I"));
    v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", CFSTR("K"));
    if (v7)
    {
      v8 = objc_msgSend(v7, "BOOLValue");
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
      if ((v8 & 1) != 0)
      {
LABEL_9:
        v10 = objc_msgSend(v6, "isEqualToString:", CFSTR("SSDownloadPhaseDownloading"));
LABEL_12:
        objc_msgSend(v9, "setPausable:", v10);
LABEL_13:
        result = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("J"));
        if (result)
          return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setError:", objc_msgSend(*(id *)(a1 + 32), "_errorWithData:", result));
        return result;
      }
    }
    else
    {
      v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "isPausable");
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
      if (v11)
        goto LABEL_9;
    }
    v10 = 0;
    goto LABEL_12;
  }
  return result;
}

- (void)_resetLocalIVars
{
  objc_super v3;

  self->_localAssets = 0;
  self->_prioritizeAboveDownload = 0;
  v3.receiver = self;
  v3.super_class = (Class)SSDownload;
  -[SSEntity _resetLocalIVars](&v3, sel__resetLocalIVars);
}

- (id)_newAssetWithURL:(id)a3 assetType:(id)a4
{
  SSMutableURLRequestProperties *v5;
  SSDownloadAsset *v6;

  v5 = -[SSURLRequestProperties initWithURL:]([SSMutableURLRequestProperties alloc], "initWithURL:", a3);
  -[SSMutableURLRequestProperties setITunesStoreRequest:](v5, "setITunesStoreRequest:", 1);
  v6 = -[SSDownloadAsset initWithURLRequestProperties:]([SSDownloadAsset alloc], "initWithURLRequestProperties:", v5);
  -[SSEntity setValue:forProperty:](v6, "setValue:forProperty:", a4, CFSTR("e"));

  return v6;
}

- (SSDownload)initWithDownloadMetadata:(id)a3
{
  SSDownload *v4;
  SSDownload *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SSDownload;
  v4 = -[SSEntity init](&v16, sel_init);
  v5 = v4;
  if (v4)
  {
    -[SSDownload setValuesWithStoreDownloadMetadata:](v4, "setValuesWithStoreDownloadMetadata:", a3);
    v6 = objc_msgSend(a3, "sinfs");
    if (v6)
      v7 = objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v6, 200, 0, 0);
    else
      v7 = 0;
    v8 = (void *)objc_msgSend(a3, "primaryAssetURL");
    if (objc_msgSend((id)objc_msgSend(v8, "host"), "length"))
    {
      v9 = -[SSDownload _newAssetWithURL:assetType:](v5, "_newAssetWithURL:assetType:", v8, CFSTR("media"));
      v10 = v9;
      if (v7)
        objc_msgSend(v9, "setValue:forProperty:", v7, CFSTR("B"));
      -[SSDownload addAsset:forType:](v5, "addAsset:forType:", v10, CFSTR("media"));

    }
    v11 = (void *)objc_msgSend(a3, "fullSizeImageURL");
    if (objc_msgSend((id)objc_msgSend(v11, "host"), "length"))
    {
      v12 = -[SSDownload _newAssetWithURL:assetType:](v5, "_newAssetWithURL:assetType:", v11, CFSTR("artwork"));
      -[SSDownload addAsset:forType:](v5, "addAsset:forType:", v12, CFSTR("artwork"));

    }
    v13 = (void *)objc_msgSend(a3, "podcastFeedURL");
    if (objc_msgSend((id)objc_msgSend(v13, "host"), "length"))
    {
      v14 = -[SSDownload _newAssetWithURL:assetType:](v5, "_newAssetWithURL:assetType:", v13, CFSTR("xmlfeed"));
      -[SSDownload addAsset:forType:](v5, "addAsset:forType:", v14, CFSTR("xmlfeed"));

    }
  }
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  NSObject *dispatchQueue;
  _QWORD v6[6];

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "0", self->super._pid);
  dispatchQueue = self->super._dispatchQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__SSDownload_copyXPCEncoding__block_invoke;
  v6[3] = &unk_1E47B8BB8;
  v6[4] = v3;
  v6[5] = self;
  dispatch_sync(dispatchQueue, v6);
  return v3;
}

void __29__SSDownload_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "1", *(__CFString **)(*(_QWORD *)(a1 + 40) + 32));
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "2", *(__CFString **)(*(_QWORD *)(a1 + 40) + 64));
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "3", *(__CFString **)(*(_QWORD *)(a1 + 40) + 80));
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "4", *(__CFString **)(*(_QWORD *)(a1 + 40) + 24));
}

- (NSArray)assets
{
  return 0;
}

- (id)downloadIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->super._pid);
}

- (BOOL)isBackgroundNetworkingUserInitiated
{
  id v2;

  v2 = -[SSEntity valueForProperty:](self, "valueForProperty:", CFSTR("W"));
  return (objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v2, "intValue") != -1;
}

- (BOOL)isExternal
{
  return -[SSEntity valueForProperty:](self, "valueForProperty:", CFSTR("9")) == 0;
}

- (SSDownloadMetadata)metadata
{
  SSDownloadMetadata *result;
  SSDownloadMetadata *v4;

  result = self->_metadata;
  if (!result)
  {
    v4 = objc_alloc_init(SSDownloadMetadata);
    self->_metadata = v4;
    -[SSDownloadMetadata setValuesFromDownload:](v4, "setValuesFromDownload:", self);
    return self->_metadata;
  }
  return result;
}

- (void)setBackgroundNetworkingUserInitiated:(BOOL)a3
{
  -[SSDownload setValue:forKey:](self, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (a3 - 1)), CFSTR("W"));
}

- (void)setMetadata:(id)a3
{
  SSDownloadMetadata *metadata;
  BOOL v6;

  -[SSDownload setValuesWithStoreDownloadMetadata:](self, "setValuesWithStoreDownloadMetadata:");
  metadata = self->_metadata;
  if (metadata)
    v6 = metadata == a3;
  else
    v6 = 1;
  if (!v6)
  {

    self->_metadata = (SSDownloadMetadata *)a3;
  }
}

- (SSDownloadStatus)status
{
  NSObject *dispatchQueue;
  uint64_t v4;
  void *v5;
  SSDownloadStatus *v6;
  SSOperationProgress *v7;
  double v8;
  id v9;
  uint64_t i;
  id v11;
  NSObject *v12;
  SSDownloadStatus *v13;
  _QWORD v15[7];
  _QWORD block[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  id v23[4];
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __20__SSDownload_status__block_invoke;
  block[3] = &unk_1E47B8DF8;
  block[4] = self;
  block[5] = &v17;
  dispatch_sync(dispatchQueue, block);
  v5 = (void *)v18[5];
  if (!v5)
  {
    v6 = objc_alloc_init(SSDownloadStatus);
    v18[5] = (uint64_t)v6;
    v24[0] = CFSTR("I");
    v24[1] = CFSTR("J");
    v24[2] = CFSTR("a");
    v24[3] = CFSTR("K");
    -[SSEntity getValues:forProperties:count:](self, "getValues:forProperties:count:", v23, v24, 4);
    objc_msgSend((id)v18[5], "setContentRestricted:", objc_msgSend(v23[2], "BOOLValue"));
    objc_msgSend((id)v18[5], "setError:", -[SSDownload _errorWithData:](self, "_errorWithData:", v23[1]));
    v7 = objc_alloc_init(SSOperationProgress);
    if (objc_msgSend(v23[0], "isEqualToString:", CFSTR("SSDownloadPhaseDownloading")))
      -[SSOperationProgress setCanPause:](v7, "setCanPause:", objc_msgSend(v23[3], "BOOLValue"));
    -[SSDownload percentComplete](self, "percentComplete");
    -[SSOperationProgress setNormalizedCurrentValue:](v7, "setNormalizedCurrentValue:", (uint64_t)(v8 * 100.0));
    -[SSOperationProgress setNormalizedMaxValue:](v7, "setNormalizedMaxValue:", 100);
    objc_msgSend((id)v18[5], "setOperationProgress:", v7);

    -[SSDownload _applyPhase:toStatus:](self, "_applyPhase:toStatus:", v23[0], v18[5]);
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    for (i = 0; i != 4; ++i)
    {
      v11 = v23[i];
      if (v11)
        objc_msgSend(v9, "setObject:forKey:", v11, v24[i]);
    }
    v12 = self->super._dispatchQueue;
    v15[0] = v4;
    v15[1] = 3221225472;
    v15[2] = __20__SSDownload_status__block_invoke_2;
    v15[3] = &unk_1E47B8F30;
    v15[4] = self;
    v15[5] = v9;
    v15[6] = &v17;
    dispatch_sync(v12, v15);

    v5 = (void *)v18[5];
  }
  v13 = v5;
  _Block_object_dispose(&v17, 8);
  return v13;
}

id __20__SSDownload_status__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __20__SSDownload_status__block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id result;

  v2 = a1[4];
  v3 = *(void **)(v2 + 32);
  if (v3)
  {
    objc_msgSend(v3, "addEntriesFromDictionary:", a1[5]);
    v2 = a1[4];
  }

  result = *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
  *(_QWORD *)(a1[4] + 88) = result;
  return result;
}

- (NSDictionary)_localAssets
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_localAssets, "copy");
}

- (void)_resetStatus
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__SSDownload__resetStatus__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

void __26__SSDownload__resetStatus__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 88))
  {
    objc_msgSend(*(id *)(v1 + 24), "removeObjectForKey:", CFSTR("4"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", CFSTR("K"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", CFSTR("I"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", CFSTR("J"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", CFSTR("a"));

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = 0;
  }
}

- (SSXPCConnection)_XPCConnection
{
  return self->super._connection;
}

- (void)_applyPhase:(id)a3 toStatus:(id)a4
{
  uint64_t v6;

  objc_msgSend(a4, "setFailed:", objc_msgSend(a3, "isEqualToString:", CFSTR("SSDownloadPhaseFailed")));
  objc_msgSend(a4, "setPaused:", objc_msgSend(a3, "isEqualToString:", CFSTR("SSDownloadPhasePaused")));
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("SSDownloadPhaseInstalling")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("SSDownloadPhaseDownloading")) & 1) != 0)
  {
    v6 = 2;
  }
  else
  {
    if (!objc_msgSend(a3, "isEqualToString:", CFSTR("SSDownloadPhaseUploading")))
      return;
    v6 = 3;
  }
  objc_msgSend(a4, "setOperationType:", v6);
}

- (id)_errorWithData:(id)a3
{
  objc_class *v4;
  void *ObjectWithArchivedData;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (objc_class *)objc_opt_class();
    ObjectWithArchivedData = (void *)SSCodingCreateObjectWithArchivedData((uint64_t)a3, v4);
  }
  else
  {
    ObjectWithArchivedData = 0;
  }
  return ObjectWithArchivedData;
}

- (id)_errorWithXPCReply:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id result;
  xpc_object_t value;
  xpc_object_t v8;

  if (!a3)
    return (id)SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
  v4 = MEMORY[0x1A85863E4](a3, a2);
  v5 = MEMORY[0x1E0C812F8];
  if (v4 != MEMORY[0x1E0C812F8])
    return (id)SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
  if (xpc_dictionary_get_BOOL(a3, "0"))
    return 0;
  value = xpc_dictionary_get_value(a3, "1");
  if (!value)
    return (id)SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
  v8 = value;
  if (MEMORY[0x1A85863E4]() != v5)
    return (id)SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
  result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", v8);
  if (!result)
    return (id)SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
  return result;
}

@end
