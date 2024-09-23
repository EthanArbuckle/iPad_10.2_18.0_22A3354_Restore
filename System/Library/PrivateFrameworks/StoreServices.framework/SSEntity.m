@implementation SSEntity

- (SSEntity)init
{
  const __CFUUID *v3;
  uint64_t v4;

  v3 = CFUUIDCreate(0);
  v4 = *(_OWORD *)&CFUUIDGetUUIDBytes(v3);
  CFRelease(v3);
  return (SSEntity *)-[SSEntity _initWithPersistentIdentifier:](self, "_initWithPersistentIdentifier:", v4);
}

- (id)_initWithPersistentIdentifier:(int64_t)a3
{
  SSEntity *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSEntity;
  v4 = -[SSEntity init](&v6, sel_init);
  if (v4)
  {
    v4->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.storeservices.SSEntity", 0);
    v4->_pid = a3;
  }
  return v4;
}

- (void)dealloc
{
  NSObject *dispatchQueue;
  objc_super v4;

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);

  v4.receiver = self;
  v4.super_class = (Class)SSEntity;
  -[SSEntity dealloc](&v4, sel_dealloc);
}

- (BOOL)exists
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
  uint64_t v17;
  int64_t v18;
  xpc_object_t v19;
  NSObject *v20;
  void *v21;
  char v22;
  uint64_t v24;
  _QWORD v25[6];
  _QWORD block[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  __int128 v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
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
      LODWORD(v31) = 136446210;
      *(_QWORD *)((char *)&v31 + 4) = "-[SSEntity exists]";
      LODWORD(v24) = 12;
      v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v31, v24);
        free(v8);
        SSFileLog(v3, CFSTR("%@"), v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  *(_QWORD *)&v31 = 0;
  *((_QWORD *)&v31 + 1) = &v31;
  v32 = 0x3052000000;
  v33 = __Block_byref_object_copy__32;
  v34 = __Block_byref_object_dispose__32;
  v35 = 0;
  dispatchQueue = self->_dispatchQueue;
  v17 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __18__SSEntity_exists__block_invoke;
  block[3] = &unk_1E47B8DF8;
  block[4] = self;
  block[5] = &v31;
  dispatch_sync(dispatchQueue, block);
  if (*(_QWORD *)(*((_QWORD *)&v31 + 1) + 40))
  {
    v18 = objc_msgSend((id)objc_opt_class(), "_existsMessage");
    if (v18)
    {
      v19 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v19, "0", v18);
      xpc_dictionary_set_int64(v19, "1", self->_pid);
      v20 = dispatch_semaphore_create(0);
      v21 = *(void **)(*((_QWORD *)&v31 + 1) + 40);
      v25[0] = v17;
      v25[1] = 3221225472;
      v25[2] = __18__SSEntity_exists__block_invoke_2;
      v25[3] = &unk_1E47BD0D8;
      v25[4] = v20;
      v25[5] = &v27;
      objc_msgSend(v21, "sendMessage:withReply:", v19, v25);
      dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v20);
      xpc_release(v19);
    }

  }
  v22 = *((_BYTE *)v28 + 24);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v27, 8);
  return v22;
}

id __18__SSEntity_exists__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

intptr_t __18__SSEntity_exists__block_invoke_2(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x1A85863E4](a2) == MEMORY[0x1E0C812F8])
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_BOOL(a2, "0");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)getValues:(id *)a3 forProperties:(const void *)a4 count:(unint64_t)a5
{
  -[SSEntity _getValues:forProperties:count:message:](self, "_getValues:forProperties:count:message:", a3, a4, a5, objc_msgSend((id)objc_opt_class(), "_getValueMessage"));
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v7;
  void *v8;
  BOOL v9;

  v7 = objc_alloc(MEMORY[0x1E0C99D80]);
  if (!a3)
    a3 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", a3, a4, 0);
  v9 = -[SSEntity setValuesWithDictionary:](self, "setValuesWithDictionary:", v8);

  return v9;
}

- (BOOL)setValuesWithDictionary:(id)a3
{
  NSObject *dispatchQueue;
  uint64_t v6;
  xpc_object_t v7;
  int64_t v8;
  NSObject *v9;
  void *v10;
  char v11;
  _QWORD v13[6];
  _QWORD block[8];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__32;
  v19 = __Block_byref_object_dispose__32;
  v20 = 0;
  dispatchQueue = self->_dispatchQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SSEntity_setValuesWithDictionary___block_invoke;
  block[3] = &unk_1E47BD100;
  block[4] = self;
  block[5] = a3;
  block[6] = &v15;
  block[7] = &v21;
  dispatch_sync(dispatchQueue, block);
  if (v16[5])
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    v8 = objc_msgSend((id)objc_opt_class(), "_setValuesMessage");
    xpc_dictionary_set_int64(v7, "0", v8);
    xpc_dictionary_set_int64(v7, "1", self->_pid);
    SSXPCDictionarySetCFObject(v7, "2", (__CFString *)a3);
    v9 = dispatch_semaphore_create(0);
    v10 = (void *)v16[5];
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __36__SSEntity_setValuesWithDictionary___block_invoke_2;
    v13[3] = &unk_1E47BD0D8;
    v13[4] = v9;
    v13[5] = &v21;
    objc_msgSend(v10, "sendMessage:withReply:", v7, v13);
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v9);
    xpc_release(v7);

  }
  v11 = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v11;
}

id __36__SSEntity_setValuesWithDictionary___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id result;
  void *v5;

  v2 = a1[4];
  v3 = *(void **)(v2 + 8);
  if (v3)
  {
    result = v3;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  }
  else
  {
    v5 = *(void **)(v2 + 32);
    if (!v5)
    {
      *(_QWORD *)(a1[4] + 32) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v5 = *(void **)(a1[4] + 32);
    }
    result = (id)objc_msgSend(v5, "addEntriesFromDictionary:", a1[5]);
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }
  return result;
}

intptr_t __36__SSEntity_setValuesWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x1A85863E4](a2) == MEMORY[0x1E0C812F8])
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_BOOL(a2, "0");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)valueForProperty:(id)a3
{
  void *v4;
  id v5;

  v4 = 0;
  v5 = a3;
  -[SSEntity getValues:forProperties:count:](self, "getValues:forProperties:count:", &v4, &v5, 1);
  return v4;
}

- (void)getValues:(id *)a3 forExternalProperties:(const void *)a4 count:(unint64_t)a5
{
  -[SSEntity _getValues:forProperties:count:message:](self, "_getValues:forProperties:count:message:", a3, a4, a5, objc_msgSend((id)objc_opt_class(), "_getExternalValuesMessage"));
}

- (void)resetCachedExternalProperties:(const void *)a3 count:(unint64_t)a4
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SSEntity_resetCachedExternalProperties_count___block_invoke;
  block[3] = &unk_1E47BBA48;
  block[4] = self;
  block[5] = a4;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __48__SSEntity_resetCachedExternalProperties_count___block_invoke(uint64_t result)
{
  _QWORD *v1;
  unint64_t v2;

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = (_QWORD *)result;
    if (*(_QWORD *)(result + 40))
    {
      v2 = 0;
      do
        result = objc_msgSend(*(id *)(v1[4] + 24), "removeObjectForKey:", *(_QWORD *)(v1[6] + 8 * v2++));
      while (v2 < v1[5]);
    }
  }
  return result;
}

- (void)resetCachedProperties:(const void *)a3 count:(unint64_t)a4
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SSEntity_resetCachedProperties_count___block_invoke;
  block[3] = &unk_1E47BBA48;
  block[4] = self;
  block[5] = a4;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __40__SSEntity_resetCachedProperties_count___block_invoke(uint64_t result)
{
  _QWORD *v1;
  unint64_t v2;

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = (_QWORD *)result;
    if (*(_QWORD *)(result + 40))
    {
      v2 = 0;
      do
        result = objc_msgSend(*(id *)(v1[4] + 32), "removeObjectForKey:", *(_QWORD *)(v1[6] + 8 * v2++));
      while (v2 < v1[5]);
    }
  }
  return result;
}

- (BOOL)setExternalValuesWithDictionary:(id)a3
{
  NSObject *dispatchQueue;
  uint64_t v6;
  xpc_object_t v7;
  int64_t v8;
  NSObject *v9;
  void *v10;
  char v11;
  _QWORD v13[6];
  _QWORD block[8];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__32;
  v19 = __Block_byref_object_dispose__32;
  v20 = 0;
  dispatchQueue = self->_dispatchQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SSEntity_setExternalValuesWithDictionary___block_invoke;
  block[3] = &unk_1E47BD100;
  block[4] = self;
  block[5] = a3;
  block[6] = &v15;
  block[7] = &v21;
  dispatch_sync(dispatchQueue, block);
  if (v16[5])
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    v8 = objc_msgSend((id)objc_opt_class(), "_setExternalValuesMessage");
    xpc_dictionary_set_int64(v7, "0", v8);
    xpc_dictionary_set_int64(v7, "1", self->_pid);
    SSXPCDictionarySetCFObject(v7, "2", (__CFString *)a3);
    v9 = dispatch_semaphore_create(0);
    v10 = (void *)v16[5];
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __44__SSEntity_setExternalValuesWithDictionary___block_invoke_2;
    v13[3] = &unk_1E47BD0D8;
    v13[4] = v9;
    v13[5] = &v21;
    objc_msgSend(v10, "sendMessage:withReply:", v7, v13);
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v9);
    xpc_release(v7);

  }
  v11 = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v11;
}

id __44__SSEntity_setExternalValuesWithDictionary___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id result;
  void *v5;

  v2 = a1[4];
  v3 = *(void **)(v2 + 8);
  if (v3)
  {
    result = v3;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  }
  else
  {
    v5 = *(void **)(v2 + 24);
    if (!v5)
    {
      *(_QWORD *)(a1[4] + 24) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v5 = *(void **)(a1[4] + 24);
    }
    result = (id)objc_msgSend(v5, "addEntriesFromDictionary:", a1[5]);
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  }
  return result;
}

intptr_t __44__SSEntity_setExternalValuesWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  if (MEMORY[0x1A85863E4](a2) == MEMORY[0x1E0C812F8])
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_BOOL(a2, "0");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)valueForExternalProperty:(id)a3
{
  void *v4;
  id v5;

  v4 = 0;
  v5 = a3;
  -[SSEntity getValues:forExternalProperties:count:](self, "getValues:forExternalProperties:count:", &v4, &v5, 1);
  return v4;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSEntity;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %lld"), -[SSEntity description](&v3, sel_description), self->_pid);
}

- (unint64_t)hash
{
  return self->_pid;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  int64_t v7;

  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    return 0;
  v7 = -[SSEntity _persistentIdentifier](self, "_persistentIdentifier");
  return v7 == objc_msgSend(a3, "_persistentIdentifier");
}

+ (int64_t)_existsMessage
{
  return 0;
}

+ (int64_t)_getExternalValuesMessage
{
  return 0;
}

+ (int64_t)_getValueMessage
{
  return 0;
}

+ (int64_t)_setExternalValuesMessage
{
  return 0;
}

+ (int64_t)_setValuesMessage
{
  return 0;
}

- (void)_addCachedExternalValues:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__SSEntity__addCachedExternalValues___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __37__SSEntity__addCachedExternalValues___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__addCachedExternalValues:", *(_QWORD *)(a1 + 40));
}

- (void)_addCachedPropertyValues:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__SSEntity__addCachedPropertyValues___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __37__SSEntity__addCachedPropertyValues___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  return objc_msgSend(v2, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));
}

- (void)_becomeManagedOnConnection:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__SSEntity__becomeManagedOnConnection___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __39__SSEntity__becomeManagedOnConnection___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[1];
  if (v3 != *(void **)(a1 + 40))
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = *(id *)(a1 + 40);
    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "_resetLocalIVars");
}

- (NSDictionary)_localExternalValues
{
  NSObject *dispatchQueue;
  NSDictionary *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__32;
  v10 = __Block_byref_object_dispose__32;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__SSEntity__localExternalValues__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSDictionary *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__SSEntity__localExternalValues__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSDictionary)_localValues
{
  NSObject *dispatchQueue;
  NSDictionary *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__32;
  v10 = __Block_byref_object_dispose__32;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__SSEntity__localValues__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSDictionary *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __24__SSEntity__localValues__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)_isManaged
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __22__SSEntity__isManaged__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __22__SSEntity__isManaged__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8) != 0;
  return result;
}

- (int64_t)_persistentIdentifier
{
  return self->_pid;
}

- (void)_setDirtyCachedExternalProperties:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__SSEntity__setDirtyCachedExternalProperties___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __46__SSEntity__setDirtyCachedExternalProperties___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(result + 32) + 48);
  if (v1 != *(void **)(result + 40))
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 40), "copy");
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 48) = result;
  }
  return result;
}

- (void)_setDirtyCachedProperties:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__SSEntity__setDirtyCachedProperties___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __38__SSEntity__setDirtyCachedProperties___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(result + 32) + 56);
  if (v1 != *(void **)(result + 40))
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 40), "copy");
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 56) = result;
  }
  return result;
}

- (void)_setLocalExternalValues:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__SSEntity__setLocalExternalValues___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __36__SSEntity__setLocalExternalValues___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(result + 32) + 24);
  if (v1 != *(void **)(result + 40))
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 40), "mutableCopy");
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 24) = result;
  }
  return result;
}

- (void)_setLocalValues:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__SSEntity__setLocalValues___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __28__SSEntity__setLocalValues___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(result + 32) + 32);
  if (v1 != *(void **)(result + 40))
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 40), "mutableCopy");
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 32) = result;
  }
  return result;
}

- (void)__addCachedExternalValues:(id)a3
{
  NSMutableDictionary *localExternalValues;

  localExternalValues = self->_localExternalValues;
  if (!localExternalValues)
  {
    localExternalValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_localExternalValues = localExternalValues;
  }
  -[NSMutableDictionary addEntriesFromDictionary:](localExternalValues, "addEntriesFromDictionary:", a3);
}

- (void)__addCachedPropertyValues:(id)a3
{
  NSMutableDictionary *localValues;

  localValues = self->_localValues;
  if (!localValues)
  {
    localValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_localValues = localValues;
  }
  -[NSMutableDictionary addEntriesFromDictionary:](localValues, "addEntriesFromDictionary:", a3);
}

- (void)_getValues:(id *)a3 forProperties:(const void *)a4 count:(unint64_t)a5 message:(int64_t)a6
{
  id v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *dispatchQueue;
  xpc_object_t v25;
  xpc_object_t v26;
  __CFString **v27;
  unint64_t v28;
  int64_t v29;
  const void **v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  id v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  id v40;
  __int128 *v41;
  uint64_t v42;
  SSEntity *v43;
  _QWORD v44[10];
  _QWORD v45[9];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD block[11];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  uint64_t v56;
  _BYTE v57[128];
  __int128 v58;
  uint64_t v59;
  void (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v11 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v11)
      v11 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v12 = objc_msgSend(v11, "shouldLog");
    if (objc_msgSend(v11, "shouldLogToDisk"))
      v13 = v12 | 2;
    else
      v13 = v12;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v11, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v14 = v13;
    else
      v14 = v13 & 2;
    if (v14)
    {
      LODWORD(v58) = 136446210;
      *(_QWORD *)((char *)&v58 + 4) = "-[SSEntity _getValues:forProperties:count:message:]";
      LODWORD(v42) = 12;
      v41 = &v58;
      v15 = _os_log_send_and_compose_impl();
      if (v15)
      {
        v16 = (void *)v15;
        v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, &v58, v42);
        free(v16);
        SSFileLog(v11, CFSTR("%@"), v18, v19, v20, v21, v22, v23, v17);
      }
    }
  }
  *(_QWORD *)&v58 = 0;
  *((_QWORD *)&v58 + 1) = &v58;
  v59 = 0x3052000000;
  v60 = __Block_byref_object_copy__32;
  v61 = __Block_byref_object_dispose__32;
  v62 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3052000000;
  v54 = __Block_byref_object_copy__32;
  v55 = __Block_byref_object_dispose__32;
  v56 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SSEntity__getValues_forProperties_count_message___block_invoke;
  block[3] = &unk_1E47BD128;
  block[8] = a5;
  block[9] = a4;
  block[10] = a3;
  block[4] = self;
  block[5] = &v58;
  block[6] = &v51;
  block[7] = a6;
  dispatch_sync(dispatchQueue, block);
  if (*(_QWORD *)(*((_QWORD *)&v58 + 1) + 40))
  {
    v25 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v25, "0", a6);
    xpc_dictionary_set_int64(v25, "1", self->_pid);
    v26 = xpc_array_create(0, 0);
    if (a5)
    {
      v27 = (__CFString **)a4;
      v28 = a5;
      do
      {
        SSXPCArraySetCFObject(v26, 0xFFFFFFFFFFFFFFFFLL, *v27++);
        --v28;
      }
      while (v28);
    }
    v43 = self;
    v29 = a6;
    v30 = a4;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v31 = (void *)v52[5];
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v57, 16, v41);
    if (v32)
    {
      v33 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v47 != v33)
            objc_enumerationMutation(v31);
          SSXPCArraySetCFObject(v26, 0xFFFFFFFFFFFFFFFFLL, *(__CFString **)(*((_QWORD *)&v46 + 1) + 8 * i));
        }
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
      }
      while (v32);
    }
    xpc_dictionary_set_value(v25, "2", v26);
    v35 = MEMORY[0x1E0C809B0];
    xpc_release(v26);
    if (v52[5])
      v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v36 = 0;
    v37 = dispatch_semaphore_create(0);
    v38 = *(void **)(*((_QWORD *)&v58 + 1) + 40);
    v45[0] = v35;
    v45[1] = 3221225472;
    v45[2] = __51__SSEntity__getValues_forProperties_count_message___block_invoke_2;
    v45[3] = &unk_1E47BD150;
    v45[6] = &v51;
    v45[7] = a5;
    v45[8] = a3;
    v45[4] = v36;
    v45[5] = v37;
    objc_msgSend(v38, "sendMessage:withReply:", v25, v45);
    dispatch_semaphore_wait(v37, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v37);
    if (objc_msgSend(v36, "count"))
    {
      v39 = v43->_dispatchQueue;
      v44[0] = v35;
      v44[1] = 3221225472;
      v44[2] = __51__SSEntity__getValues_forProperties_count_message___block_invoke_3;
      v44[3] = &unk_1E47BD1A0;
      v44[8] = a5;
      v44[9] = v30;
      v44[4] = v43;
      v44[5] = v36;
      v44[6] = &v51;
      v44[7] = v29;
      dispatch_sync(v39, v44);
    }

    xpc_release(v25);
  }
  for (; a5; --a5)
    v40 = *a3++;

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v58, 8);
}

id __51__SSEntity__getValues_forProperties_count_message___block_invoke(_QWORD *a1)
{
  id v2;
  id result;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;

  v2 = (id)a1[7];
  result = (id)objc_msgSend((id)objc_opt_class(), "_getValueMessage");
  if (v2 == result)
  {
    v4 = a1[4];
    v5 = *(void **)(v4 + 32);
    if (*(_QWORD *)(v4 + 56))
    {
LABEL_3:
      result = (id)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:");
      v6 = result;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  v7 = (id)a1[7];
  result = (id)objc_msgSend((id)objc_opt_class(), "_getExternalValuesMessage");
  if (v7 == result)
  {
    v8 = a1[4];
    v5 = *(void **)(v8 + 24);
    if (*(_QWORD *)(v8 + 48))
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    goto LABEL_8;
  }
  v6 = 0;
  v5 = 0;
LABEL_8:
  if (a1[8])
  {
    v9 = 0;
    v10 = 0;
    v11 = *MEMORY[0x1E0C9B0D0];
    do
    {
      v12 = objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1[9] + 8 * v9));
      v13 = *(_QWORD *)(a1[9] + 8 * v9);
      if (v12)
      {
        objc_msgSend(v6, "removeObject:", v13);
        v14 = 0;
      }
      else
      {
        v15 = objc_msgSend(v5, "objectForKey:", v13);
        if (v15)
          ++v10;
        if (v15 == v11)
          v14 = 0;
        else
          v14 = (void *)v15;
      }
      result = v14;
      *(_QWORD *)(a1[10] + 8 * v9++) = result;
      v16 = a1[8];
    }
    while (v9 < v16);
    if (v10 < v16)
    {
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = *(id *)(a1[4] + 8);
      result = (id)objc_msgSend(v6, "allObjects");
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
    }
  }
  return result;
}

intptr_t __51__SSEntity__getValues_forProperties_count_message___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t value;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  size_t v11;
  const __CFArray *v12;
  const __CFDictionary *v13;
  CFArrayRef v14;
  CFArrayRef v15;

  if (MEMORY[0x1A85863E4](a2) == MEMORY[0x1E0C812F8])
  {
    value = xpc_dictionary_get_value(a2, "0");
    v6 = *(_QWORD *)(a1 + 56);
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
    if (value)
    {
      v8 = v7;
      if (MEMORY[0x1A85863E4](value) == MEMORY[0x1E0C812C8])
      {
        v9 = v8 + v6;
        if (xpc_array_get_count(value) == v8 + v6 && v9 != 0)
        {
          v11 = 0;
          v12 = (const __CFArray *)*MEMORY[0x1E0C9B0D0];
          do
          {
            v13 = (const __CFDictionary *)xpc_array_get_value(value, v11);
            v14 = SSXPCCreateCFObjectFromXPCObject(v13);
            v15 = v14;
            if (v11 < *(_QWORD *)(a1 + 56) && v14 != v12)
            {

              *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * v11) = v15;
            }
            objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);

            ++v11;
          }
          while (v9 != v11);
        }
      }
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __51__SSEntity__getValues_forProperties_count_message___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[7];

  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2 = *(_QWORD *)(a1 + 56);
  if (v2 == objc_msgSend((id)objc_opt_class(), "_getValueMessage"))
  {
    v3 = 56;
LABEL_5:
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + v3));

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + v3) = 0;
    goto LABEL_7;
  }
  v4 = *(_QWORD *)(a1 + 56);
  if (v4 == objc_msgSend((id)objc_opt_class(), "_getExternalValuesMessage"))
  {
    v3 = 48;
    goto LABEL_5;
  }
  v5 = 0;
LABEL_7:
  v6 = v13;
  v7 = *(_QWORD *)(a1 + 64);
  if (v7)
  {
    for (i = 0; i < v7; ++i)
    {
      if (objc_msgSend(v5, "containsObject:", *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8 * i), v13))
        objc_msgSend(v13, "setObject:forKey:", objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", i), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8 * i));
      v7 = *(_QWORD *)(a1 + 64);
    }
    v6 = v13;
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[2] = __51__SSEntity__getValues_forProperties_count_message___block_invoke_4;
  v15[3] = &unk_1E47BD178;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v15[1] = 3221225472;
  v15[4] = v6;
  v15[5] = v9;
  v15[6] = v7;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15, v13);
  if (objc_msgSend(v14, "count"))
  {
    v11 = *(_QWORD *)(a1 + 56);
    if (v11 == objc_msgSend((id)objc_opt_class(), "_getValueMessage"))
    {
      objc_msgSend(*(id *)(a1 + 32), "__addCachedPropertyValues:", v14);
    }
    else
    {
      v12 = *(_QWORD *)(a1 + 56);
      if (v12 == objc_msgSend((id)objc_opt_class(), "_getExternalValuesMessage"))
        objc_msgSend(*(id *)(a1 + 32), "__addCachedExternalValues:", v14);
    }
  }

}

uint64_t __51__SSEntity__getValues_forProperties_count_message___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", *(_QWORD *)(a1 + 48) + a3), a2);
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  NSObject *dispatchQueue;
  _QWORD v6[6];

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "0", self->_pid);
  dispatchQueue = self->_dispatchQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__SSEntity_copyXPCEncoding__block_invoke;
  v6[3] = &unk_1E47B8BB8;
  v6[4] = v3;
  v6[5] = self;
  dispatch_sync(dispatchQueue, v6);
  return v3;
}

void __27__SSEntity_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "1", *(__CFString **)(*(_QWORD *)(a1 + 40) + 32));
}

@end
