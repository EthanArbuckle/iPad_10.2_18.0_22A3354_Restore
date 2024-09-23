@implementation SSPersistentCache

- (SSPersistentCache)initWithIdentifier:(id)a3 cacheName:(id)a4
{
  SSPersistentCache *v6;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *global_queue;
  uint64_t v14;
  id v15;
  int v16;
  int v17;
  uint64_t v18;
  NSString *path;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  __int16 v34;
  NSString *v35;
  __int16 v36;
  uint64_t v37;
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v6 = -[SSPersistentCache init](self, "init");
  if (v6)
  {
    if (!objc_msgSend(a3, "length") || !objc_msgSend(a4, "length"))
    {
LABEL_15:

      return 0;
    }
    v6->_identifier = (NSString *)objc_msgSend(a3, "copy");
    v6->_cacheName = (NSString *)objc_msgSend(a4, "copy");
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CPSharedResourcesDirectory(), CFSTR("Library"), CFSTR("Caches"), a3, a4, 0);
    v6->_path = (NSString *)(id)objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v7);

    v6->_fm = (NSFileManager *)objc_alloc_init(MEMORY[0x1E0CB3620]);
    v8 = objc_alloc(MEMORY[0x1E0C99D20]);
    v9 = (objc_class *)objc_opt_class();
    v10 = (void *)objc_msgSend(v8, "initWithObjects:", NSStringFromClass(v9), a3, a4, 0);
    v11 = (void *)objc_msgSend(v10, "componentsJoinedByString:", CFSTR("."));

    v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), 0);
    v6->_serialQueue = (OS_dispatch_queue *)v12;
    global_queue = dispatch_get_global_queue(0, 0);
    dispatch_set_target_queue(v12, global_queue);
    v14 = *MEMORY[0x1E0CB2A58];
    v38[0] = *MEMORY[0x1E0CB2A98];
    v38[1] = v14;
    v39[0] = CFSTR("mobile");
    v39[1] = CFSTR("mobile");
    v31 = 0;
    if (!-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v6->_fm, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6->_path, 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2), &v31))
    {
      v15 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v15)
        v15 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v16 = objc_msgSend(v15, "shouldLog");
      if (objc_msgSend(v15, "shouldLogToDisk"))
        v17 = v16 | 2;
      else
        v17 = v16;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v15, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v17 &= 2u;
      if (v17)
      {
        v18 = objc_opt_class();
        path = v6->_path;
        v32 = 138412802;
        v33 = v18;
        v34 = 2112;
        v35 = path;
        v36 = 2112;
        v37 = v31;
        LODWORD(v30) = 32;
        v20 = _os_log_send_and_compose_impl();
        if (v20)
        {
          v21 = (void *)v20;
          v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v20, 4, &v32, v30);
          free(v21);
          SSFileLog(v15, CFSTR("%@"), v23, v24, v25, v26, v27, v28, v22);
        }
      }
      goto LABEL_15;
    }
  }
  return v6;
}

- (void)dealloc
{
  NSObject *serialQueue;
  objc_super v4;

  serialQueue = self->_serialQueue;
  if (serialQueue)
    dispatch_release(serialQueue);

  v4.receiver = self;
  v4.super_class = (Class)SSPersistentCache;
  -[SSPersistentCache dealloc](&v4, sel_dealloc);
}

- (id)_pathForKey:(id)a3
{
  NSString *path;

  path = self->_path;
  if (!self->_safeKeys)
    a3 = +[SSPersistentCache safeKeyForKey:](SSPersistentCache, "safeKeyForKey:", a3);
  return -[NSString stringByAppendingPathComponent:](path, "stringByAppendingPathComponent:", a3);
}

- (BOOL)_isFileNotFound:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "code") != 4)
    return 0;
  v4 = (void *)objc_msgSend(a3, "domain");
  return objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ : %p> - [ID: %@] [Name: %@]"), objc_opt_class(), self, self->_identifier, self->_cacheName);
}

+ (id)safeKeyForKey:(id)a3
{
  void *v3;
  uint64_t i;
  unsigned __int8 md[16];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!CC_MD5((const void *)objc_msgSend(a3, "UTF8String"), objc_msgSend(a3, "length"), md))
    return 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  for (i = 0; i != 16; ++i)
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[i]);
  return v3;
}

- (void)setFilenameSafeKeys:(BOOL)a3
{
  self->_safeKeys = a3;
}

- (BOOL)setData:(id)a3 forKey:(id)a4
{
  id v7;
  NSObject *serialQueue;
  char v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  if (objc_msgSend(a4, "length") && objc_msgSend(a3, "length"))
  {
    v7 = -[SSPersistentCache _pathForKey:](self, "_pathForKey:", a4);
    serialQueue = self->_serialQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __36__SSPersistentCache_setData_forKey___block_invoke;
    v11[3] = &unk_1E47B8CE8;
    v11[4] = self;
    v11[5] = a3;
    v11[6] = v7;
    v11[7] = &v12;
    dispatch_sync(serialQueue, v11);
  }
  v9 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t __36__SSPersistentCache_setData_forKey___block_invoke(uint64_t a1)
{
  id v2;
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  int *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  if (!v2)
    v2 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v2, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v4 &= 2u;
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = objc_msgSend(*(id *)(a1 + 40), "length");
    v7 = *(_QWORD *)(a1 + 48);
    v20 = 138412802;
    v21 = v5;
    v22 = 1024;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    LODWORD(v19) = 28;
    v18 = &v20;
    v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v20, v19);
      free(v9);
      SSFileLog(v2, CFSTR("%@"), v11, v12, v13, v14, v15, v16, v10);
    }
  }
  result = objc_msgSend(*(id *)(a1 + 40), "writeToFile:atomically:", *(_QWORD *)(a1 + 48), 1, v18);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)removeDataForKey:(id)a3
{
  id v5;
  NSObject *serialQueue;
  char v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  if (objc_msgSend(a3, "length"))
  {
    v5 = -[SSPersistentCache _pathForKey:](self, "_pathForKey:", a3);
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__SSPersistentCache_removeDataForKey___block_invoke;
    block[3] = &unk_1E47BA7E8;
    block[5] = v5;
    block[6] = &v10;
    block[4] = self;
    dispatch_sync(serialQueue, block);
  }
  v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __38__SSPersistentCache_removeDataForKey___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  v3 = 0;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeItemAtPath:error:", *(_QWORD *)(a1 + 40), &v3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_isFileNotFound:", v3);
    if ((_DWORD)result)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)clear
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__SSPersistentCache_clear__block_invoke;
  v5[3] = &unk_1E47BBA20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __26__SSPersistentCache_clear__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  void *v5;
  uint64_t v6;
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
  int *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "enumeratorAtPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  result = objc_msgSend(v2, "nextObject");
  if (result)
  {
    v4 = result;
    do
    {
      v5 = (void *)MEMORY[0x1A8585BF8]();
      v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "stringByAppendingPathComponent:", v4);
      v22 = 0;
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeItemAtPath:error:", v6, &v22) & 1) == 0)
      {
        v7 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        if (!v7)
          v7 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v8 = objc_msgSend(v7, "shouldLog");
        if (objc_msgSend(v7, "shouldLogToDisk"))
          v9 = v8 | 2;
        else
          v9 = v8;
        if (os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
          v10 = v9;
        else
          v10 = v9 & 2;
        if (v10)
        {
          v23 = 138412290;
          v24 = v6;
          LODWORD(v21) = 12;
          v20 = &v23;
          v11 = _os_log_send_and_compose_impl();
          if (v11)
          {
            v12 = (void *)v11;
            v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v23, v21);
            free(v12);
            SSFileLog(v7, CFSTR("%@"), v14, v15, v16, v17, v18, v19, v13);
          }
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      }
      objc_msgSend(v2, "skipDescendents", v20);
      objc_autoreleasePoolPop(v5);
      result = objc_msgSend(v2, "nextObject");
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (id)dataForKey:(id)a3
{
  id v5;
  NSObject *serialQueue;
  id v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__73;
  v14 = __Block_byref_object_dispose__73;
  v15 = 0;
  if (objc_msgSend(a3, "length"))
  {
    v5 = -[SSPersistentCache _pathForKey:](self, "_pathForKey:", a3);
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__SSPersistentCache_dataForKey___block_invoke;
    block[3] = &unk_1E47BA7E8;
    block[5] = self;
    block[6] = &v10;
    block[4] = v5;
    dispatch_sync(serialQueue, block);
  }
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __32__SSPersistentCache_dataForKey___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A8585BF8]();
  v18 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", *(_QWORD *)(a1 + 32), 1, &v18);
  if (v18 && (objc_msgSend(*(id *)(a1 + 40), "_isFileNotFound:") & 1) == 0)
  {
    v3 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v3)
      v3 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v5 &= 2u;
    if (v5)
    {
      v6 = objc_opt_class();
      v7 = *(_QWORD *)(a1 + 32);
      v19 = 138412546;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      LODWORD(v17) = 22;
      v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v19, v17);
        free(v9);
        SSFileLog(v3, CFSTR("%@"), v11, v12, v13, v14, v15, v16, v10);
      }
    }
  }
  objc_autoreleasePoolPop(v2);
}

@end
