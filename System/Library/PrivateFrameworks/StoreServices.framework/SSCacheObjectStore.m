@implementation SSCacheObjectStore

- (SSCacheObjectStore)initWithSessionIdentifier:(id)a3
{
  SSCacheObjectStore *v5;
  SSDatabaseCache *v6;
  objc_class *v7;
  SSDatabaseCache *v8;
  const char *v9;
  id v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "length"))
  {
    v5 = -[SSCacheObjectStore init](self, "init");
    if (v5)
    {
      v5->_sessionIdentifier = (NSString *)a3;
      v5->_factories = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 5);
      v6 = [SSDatabaseCache alloc];
      v7 = (objc_class *)objc_opt_class();
      v8 = -[SSDatabaseCache initWithIdentifier:cacheName:](v6, "initWithIdentifier:cacheName:", NSStringFromClass(v7), a3);
      v5->_databaseCache = v8;
      -[SSDatabaseCache setMaximumInlineBlobSize:](v8, "setMaximumInlineBlobSize:", 1024);
      v9 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), objc_opt_class(), a3), "UTF8String");
      v5->_serialQueue = (OS_dispatch_queue *)dispatch_queue_create(v9, 0);
    }
  }
  else
  {
    v10 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v10)
      v10 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v11 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v10, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v12 &= 2u;
    if (v12)
    {
      v24 = 138412290;
      v25 = objc_opt_class();
      LODWORD(v23) = 12;
      v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        v14 = (void *)v13;
        v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v24, v23);
        free(v14);
        SSFileLog(v10, CFSTR("%@"), v16, v17, v18, v19, v20, v21, v15);
      }
    }

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_serialQueue);
  v3.receiver = self;
  v3.super_class = (Class)SSCacheObjectStore;
  -[SSCacheObjectStore dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSCacheObjectStore;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: [Session Identifier: %@] [Factories: %d]"), -[SSCacheObjectStore description](&v3, sel_description), self->_sessionIdentifier, -[NSMutableSet count](self->_factories, "count"));
}

- (id)_factoryForTypeIdentifier:(id)a3
{
  NSMutableSet *factories;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  int v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "length"))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    factories = self->_factories;
    v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](factories, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v27;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(factories);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
        if ((objc_msgSend(v10, "supportsTypeIdentifier:", a3) & 1) != 0)
          break;
        if (v7 == ++v9)
        {
          v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](factories, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_12;
        }
      }
      v11 = v10;
      if (v11)
        return v11;
    }
  }
LABEL_12:
  v12 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  if (!v12)
    v12 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
  v13 = objc_msgSend(v12, "shouldLog");
  if (objc_msgSend(v12, "shouldLogToDisk"))
    v14 = v13 | 2;
  else
    v14 = v13;
  if (os_log_type_enabled((os_log_t)objc_msgSend(v12, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v15 = v14;
  else
    v15 = v14 & 2;
  if (!v15)
    goto LABEL_23;
  v30 = 138412290;
  v31 = a3;
  LODWORD(v25) = 12;
  v11 = (id)_os_log_send_and_compose_impl();
  if (v11)
  {
    v16 = v11;
    v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v30, v25);
    free(v16);
    SSFileLog(v12, CFSTR("%@"), v18, v19, v20, v21, v22, v23, v17);
LABEL_23:
    v11 = 0;
  }
  return v11;
}

- (void)clearSession
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SSCacheObjectStore_clearSession__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __34__SSCacheObjectStore_clearSession__block_invoke(uint64_t a1)
{
  id v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  if (!v2)
    v2 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  if (os_log_type_enabled((os_log_t)objc_msgSend(v2, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v5 = v4;
  else
    v5 = v4 & 2;
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v19 = 138412290;
    v20 = v6;
    LODWORD(v18) = 12;
    v17 = &v19;
    v7 = _os_log_send_and_compose_impl();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v19, v18);
      free(v8);
      SSFileLog(v2, CFSTR("%@"), v10, v11, v12, v13, v14, v15, v9);
    }
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clear", v17);
}

- (BOOL)addObject:(id)a3 withItemIdentifier:(id)a4
{
  NSObject *serialQueue;
  char v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__SSCacheObjectStore_addObject_withItemIdentifier___block_invoke;
  v7[3] = &unk_1E47C0160;
  v7[4] = a3;
  v7[5] = self;
  v7[6] = a4;
  v7[7] = &v8;
  dispatch_sync(serialQueue, v7);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __51__SSCacheObjectStore_addObject_withItemIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  id v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "cacheObjectDataRepresentation");
  if (objc_msgSend(v2, "length"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v3 = objc_msgSend(*(id *)(a1 + 32), "cacheObjectTypeIdentifier");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture"), "timeIntervalSinceReferenceDate");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setData:expiring:retiring:lookupKey:userInfo:", v2, *(_QWORD *)(a1 + 48), v3, v4, v4);
  }
  else
  {
    v5 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v5)
      v5 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_INFO))
      v7 &= 2u;
    if (v7)
    {
      v8 = objc_opt_class();
      v9 = *(_QWORD *)(a1 + 48);
      v20 = 138412546;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      LODWORD(v19) = 22;
      v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        v11 = (void *)v10;
        v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v20, v19);
        free(v11);
        SSFileLog(v5, CFSTR("%@"), v13, v14, v15, v16, v17, v18, v12);
      }
    }
  }
}

- (BOOL)removeObjectWithItemIdentifier:(id)a3
{
  NSObject *serialQueue;
  _QWORD v5[6];

  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__SSCacheObjectStore_removeObjectWithItemIdentifier___block_invoke;
  v5[3] = &unk_1E47B8BB8;
  v5[4] = a3;
  v5[5] = self;
  dispatch_sync(serialQueue, v5);
  return 0;
}

void __53__SSCacheObjectStore_removeObjectWithItemIdentifier___block_invoke(uint64_t a1)
{
  id v2;
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "clearCacheForLookupKey:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v2 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v2)
      v2 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = objc_msgSend(v2, "shouldLog");
    if (objc_msgSend(v2, "shouldLogToDisk"))
      v4 = v3 | 2;
    else
      v4 = v3;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v2, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v4 &= 2u;
    if (v4)
    {
      v15 = 138412290;
      v16 = objc_opt_class();
      LODWORD(v14) = 12;
      v5 = _os_log_send_and_compose_impl();
      if (v5)
      {
        v6 = (void *)v5;
        v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v5, 4, &v15, v14);
        free(v6);
        SSFileLog(v2, CFSTR("%@"), v8, v9, v10, v11, v12, v13, v7);
      }
    }
  }
}

- (id)cacheObjectWithItemIdentifier:(id)a3
{
  NSObject *serialQueue;
  void *v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__75;
  v11 = __Block_byref_object_dispose__75;
  v12 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SSCacheObjectStore_cacheObjectWithItemIdentifier___block_invoke;
  block[3] = &unk_1E47B8F30;
  block[4] = a3;
  block[5] = self;
  block[6] = &v7;
  dispatch_sync(serialQueue, block);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __52__SSCacheObjectStore_cacheObjectWithItemIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[22];
  __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "cacheEntryForLookupKey:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_msgSend(v2, "dataBlob:", 0);
    if (objc_msgSend(v3, "length"))
    {
      v27[0] = 0;
      v26 = SSDatabaseCacheEntryUserInfo;
      objc_msgSend(v2, "getValues:forProperties:count:", v27, &v26, 1);
      if (v27[0])
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "_factoryForTypeIdentifier:", v27[0]), "cachedObjectWithDataRepresentation:typeIdentifier:", v3, v27[0]);
        return;
      }
      v4 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v4)
        v4 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v11 = objc_msgSend(v4, "shouldLog");
      if (objc_msgSend(v4, "shouldLogToDisk"))
        v12 = v11 | 2;
      else
        v12 = v11;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v4, "OSLogObject"), OS_LOG_TYPE_INFO))
        v12 &= 2u;
      if (v12)
      {
        v13 = objc_opt_class();
        v14 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v25 = 138412546;
        *(_QWORD *)&v25[4] = v13;
        *(_WORD *)&v25[12] = 2112;
        *(_QWORD *)&v25[14] = v14;
        LODWORD(v24) = 22;
LABEL_32:
        v15 = _os_log_send_and_compose_impl();
        if (v15)
        {
          v16 = (void *)v15;
          v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, v25, v24, *(_OWORD *)v25);
          free(v16);
          SSFileLog(v4, CFSTR("%@"), v18, v19, v20, v21, v22, v23, v17);
        }
      }
    }
    else
    {
      v4 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v4)
        v4 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = objc_msgSend(v4, "shouldLog");
      if (objc_msgSend(v4, "shouldLogToDisk"))
        v8 = v7 | 2;
      else
        v8 = v7;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v4, "OSLogObject"), OS_LOG_TYPE_INFO))
        v8 &= 2u;
      if (v8)
      {
        v9 = objc_opt_class();
        v10 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v25 = 138412546;
        *(_QWORD *)&v25[4] = v9;
        *(_WORD *)&v25[12] = 2112;
        *(_QWORD *)&v25[14] = v10;
        LODWORD(v24) = 22;
        goto LABEL_32;
      }
    }
  }
  else
  {
    v4 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v4)
      v4 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v5 = objc_msgSend(v4, "shouldLog");
    if (objc_msgSend(v4, "shouldLogToDisk"))
      v6 = v5 | 2;
    else
      v6 = v5;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v4, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v6 &= 2u;
    if (v6)
    {
      *(_DWORD *)v25 = 138412290;
      *(_QWORD *)&v25[4] = objc_opt_class();
      LODWORD(v24) = 12;
      goto LABEL_32;
    }
  }
}

- (void)addCacheObjectFactory:(id)a3
{
  NSObject *serialQueue;
  _QWORD v4[6];

  if (a3)
  {
    serialQueue = self->_serialQueue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __44__SSCacheObjectStore_addCacheObjectFactory___block_invoke;
    v4[3] = &unk_1E47B8BB8;
    v4[4] = self;
    v4[5] = a3;
    dispatch_sync(serialQueue, v4);
  }
}

uint64_t __44__SSCacheObjectStore_addCacheObjectFactory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeCacheObjectFactory:(id)a3
{
  NSObject *serialQueue;
  _QWORD v4[6];

  if (a3)
  {
    serialQueue = self->_serialQueue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __47__SSCacheObjectStore_removeCacheObjectFactory___block_invoke;
    v4[3] = &unk_1E47B8BB8;
    v4[4] = self;
    v4[5] = a3;
    dispatch_sync(serialQueue, v4);
  }
}

uint64_t __47__SSCacheObjectStore_removeCacheObjectFactory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

@end
