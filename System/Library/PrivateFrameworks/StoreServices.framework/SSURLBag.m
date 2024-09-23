@implementation SSURLBag

- (SSURLBag)init
{
  SSURLBagContext *v3;
  SSURLBag *v4;

  v3 = objc_alloc_init(SSURLBagContext);
  v4 = -[SSURLBag initWithURLBagContext:](self, "initWithURLBagContext:", v3);

  return v4;
}

- (SSURLBag)initWithURLBagContext:(id)a3
{
  SSURLBag *v4;
  objc_super v6;

  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SSURLBag;
    v4 = -[SSURLBag init](&v6, sel_init);
    if (v4)
    {
      v4->_context = (SSURLBagContext *)objc_msgSend(a3, "copy");
      v4->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.storeservices.SSURLBag", 0);
      v4->_expirationTime = -1.79769313e308;
    }
  }
  else
  {

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil bagContext"));
    return 0;
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
  v4.super_class = (Class)SSURLBag;
  -[SSURLBag dealloc](&v4, sel_dealloc);
}

+ (id)URLBagForContext:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  SSURLBag *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  pthread_mutex_lock(&__URLBagsLock);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)__URLBags;
  v5 = objc_msgSend((id)__URLBags, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
LABEL_4:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v6)
        objc_enumerationMutation(v4);
      v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
      if (objc_msgSend((id)objc_msgSend(v8, "URLBagContext"), "isEqual:", a3))
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          goto LABEL_4;
        goto LABEL_12;
      }
    }
    v9 = v8;
    if (v9)
      goto LABEL_15;
  }
LABEL_12:
  if (!__URLBags)
    __URLBags = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = -[SSURLBag initWithURLBagContext:]([SSURLBag alloc], "initWithURLBagContext:", a3);
  objc_msgSend((id)__URLBags, "addObject:", v9);
LABEL_15:
  pthread_mutex_unlock(&__URLBagsLock);
  return v9;
}

- (void)getTrustForURL:(id)a3 completionBlock:(id)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__SSURLBag_getTrustForURL_completionBlock___block_invoke;
  v4[3] = &unk_1E47BD360;
  v4[4] = a3;
  v4[5] = a4;
  -[SSURLBag loadValueForKey:completionBlock:](self, "loadValueForKey:completionBlock:", CFSTR("trustedDomains"), v4);
}

uint64_t __43__SSURLBag_getTrustForURL_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "host");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v14;
LABEL_6:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(a2);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v12, "length"))
        {
          if (objc_msgSend(v12, "hasPrefix:", CFSTR(".")))
            v9 = objc_msgSend(v6, "hasSuffix:", v12);
          else
            v9 = objc_msgSend(v6, "caseInsensitiveCompare:", v12) == 0;
        }
        if ((v9 & 1) != 0)
          break;
        if (v8 == ++v11)
        {
          v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v8)
            goto LABEL_6;
          return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        }
      }
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__SSURLBag_invalidate__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

void __22__SSURLBag_invalidate__block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
}

- (void)loadValueForKey:(id)a3 completionBlock:(id)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__SSURLBag_loadValueForKey_completionBlock___block_invoke;
  v4[3] = &unk_1E47BD388;
  v4[4] = a3;
  v4[5] = a4;
  -[SSURLBag _loadWithCompletionBlock:](self, "_loadWithCompletionBlock:", v4);
}

uint64_t __44__SSURLBag_loadValueForKey_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, void *, uint64_t);
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    a2 = (void *)objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
    v4 = *(uint64_t (**)(uint64_t, void *, uint64_t))(v3 + 16);
    v5 = v3;
    a3 = 0;
  }
  else
  {
    v4 = *(uint64_t (**)(uint64_t, void *, uint64_t))(v3 + 16);
    v5 = *(_QWORD *)(a1 + 40);
  }
  return v4(v5, a2, a3);
}

- (SSURLBagContext)URLBagContext
{
  return (SSURLBagContext *)(id)-[SSURLBagContext copy](self->_context, "copy");
}

- (id)valueForKey:(id)a3 error:(id *)a4
{
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__34;
  v22 = __Block_byref_object_dispose__34;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__34;
  v16 = __Block_byref_object_dispose__34;
  v17 = 0;
  v7 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __30__SSURLBag_valueForKey_error___block_invoke;
  v11[3] = &unk_1E47BD3B0;
  v11[5] = &v18;
  v11[6] = &v12;
  v11[4] = v7;
  -[SSURLBag loadValueForKey:completionBlock:](self, "loadValueForKey:completionBlock:", a3, v11);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v7);
  v8 = (id)v13[5];
  if (a4)
    *a4 = (id)v13[5];
  v9 = (id)v19[5];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

intptr_t __30__SSURLBag_valueForKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSDictionary)existingBagDictionary
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
  v9 = __Block_byref_object_copy__34;
  v10 = __Block_byref_object_dispose__34;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__SSURLBag_existingBagDictionary__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSDictionary *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __33__SSURLBag_existingBagDictionary__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (void)setURLBag:(id)a3 forContext:(id)a4
{
  id v6;
  uint64_t v7;
  _QWORD v8[5];

  pthread_mutex_lock(&__URLBagsLock);
  v6 = (id)__URLBags;
  if (!__URLBags)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    __URLBags = (uint64_t)v6;
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__SSURLBag_setURLBag_forContext___block_invoke;
  v8[3] = &unk_1E47BD3D8;
  v8[4] = a4;
  v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", v8);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend((id)__URLBags, "removeObjectAtIndex:", v7);
  if (a3)
    objc_msgSend((id)__URLBags, "addObject:", a3);
  pthread_mutex_unlock(&__URLBagsLock);
}

uint64_t __33__SSURLBag_setURLBag_forContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "URLBagContext"), "isEqual:", *(_QWORD *)(a1 + 32));
}

- (void)dispatchAsync:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __26__SSURLBag_dispatchAsync___block_invoke;
  v4[3] = &unk_1E47B8EB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __26__SSURLBag_dispatchAsync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)dispatchSync:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __25__SSURLBag_dispatchSync___block_invoke;
  v4[3] = &unk_1E47B8EB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __25__SSURLBag_dispatchSync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (id)_connection
{
  id result;

  result = self->_connection;
  if (!result)
  {
    result = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    self->_connection = (SSXPCConnection *)result;
  }
  return result;
}

- (void)_drainPendingLookupsWithError:(id)a3
{
  void *v5;
  void *v6;
  NSObject *global_queue;
  _QWORD v8[8];

  v5 = (void *)-[NSMutableArray copy](self->_pendingLookups, "copy");
  -[NSMutableArray removeAllObjects](self->_pendingLookups, "removeAllObjects");
  v6 = (void *)-[NSDictionary copy](self->_dictionary, "copy");
  global_queue = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__SSURLBag__drainPendingLookupsWithError___block_invoke;
  v8[3] = &unk_1E47BD400;
  v8[4] = self;
  v8[5] = v5;
  v8[6] = v6;
  v8[7] = a3;
  dispatch_async(global_queue, v8);

}

uint64_t __42__SSURLBag__drainPendingLookupsWithError___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(void **)(a1 + 40);
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

- (void)_loadURLBag
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
  xpc_object_t v16;
  __CFString *v17;
  id v18;
  int *v19;
  uint64_t v20;
  _QWORD v21[5];
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
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
    if (os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v6 = v5;
    else
      v6 = v5 & 2;
    if (v6)
    {
      v22 = 136446210;
      v23 = "-[SSURLBag _loadURLBag]";
      LODWORD(v20) = 12;
      v19 = &v22;
      v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v22, v20);
        free(v8);
        SSFileLog(v3, CFSTR("%@"), v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  v16 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v16, "0", 25);
  if (self->_ignoreCacheForNextLookup)
  {
    v17 = (__CFString *)-[SSURLBagContext copy](self->_context, "copy");
    -[__CFString setIgnoresCaches:](v17, "setIgnoresCaches:", 1);
    SSXPCDictionarySetCFObject(v16, "1", v17);
    self->_ignoreCacheForNextLookup = 0;

  }
  else
  {
    SSXPCDictionarySetCFObject(v16, "1", (__CFString *)self->_context);
  }
  v18 = -[SSURLBag _connection](self, "_connection", v19);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __23__SSURLBag__loadURLBag__block_invoke;
  v21[3] = &unk_1E47BBC08;
  v21[4] = self;
  objc_msgSend(v18, "sendMessage:withReply:", v16, v21);
  xpc_release(v16);
}

void __23__SSURLBag__loadURLBag__block_invoke(uint64_t a1, void *a2)
{
  CFArrayRef v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v10[7];
  _QWORD block[6];

  if (a2 && MEMORY[0x1A85863E4](a2) == MEMORY[0x1E0C812F8])
  {
    v4 = SSXPCDictionaryCopyCFObject(a2, "0");
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    xpc_retain(a2);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(NSObject **)(v6 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __23__SSURLBag__loadURLBag__block_invoke_3;
    v10[3] = &unk_1E47B9E88;
    v10[4] = a2;
    v10[5] = v6;
    v10[6] = v4;
    v8 = v10;
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v7 = *(NSObject **)(v9 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __23__SSURLBag__loadURLBag__block_invoke_2;
    block[3] = &unk_1E47B8BB8;
    block[4] = v9;
    block[5] = v5;
    v8 = block;
  }
  dispatch_async(v7, v8);

}

uint64_t __23__SSURLBag__loadURLBag__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  if (!v1)
    v1 = SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
  return objc_msgSend(v2, "_drainPendingLookupsWithError:", v1);
}

void __23__SSURLBag__loadURLBag__block_invoke_3(xpc_object_t *a1)
{
  xpc_object_t value;
  void *v3;
  double Current;
  double v5;
  double v6;
  double *v7;
  xpc_object_t v8;
  double v9;

  value = xpc_dictionary_get_value(a1[4], "1");
  if (value && (v3 = value, MEMORY[0x1A85863E4]() == MEMORY[0x1E0C81300]))
  {
    *((double *)a1[5] + 5) = xpc_double_get_value(v3);
    v9 = *((double *)a1[5] + 5);
    if (v9 > CFAbsoluteTimeGetCurrent() + 60.0)
    {
      v7 = (double *)a1[5];
      v6 = v7[5];
      goto LABEL_5;
    }
    Current = CFAbsoluteTimeGetCurrent();
    v5 = 60.0;
  }
  else
  {
    Current = CFAbsoluteTimeGetCurrent();
    v5 = 86400.0;
  }
  v6 = Current + v5;
  v7 = (double *)a1[5];
LABEL_5:
  v7[5] = v6;

  *((_QWORD *)a1[5] + 3) = objc_msgSend(a1[6], "copy");
  v8 = a1[4];
  objc_opt_class();
  *((_QWORD *)a1[5] + 8) = SSXPCDictionaryCopyCFObjectWithClass(v8, "3");
  objc_msgSend(a1[5], "_drainPendingLookupsWithError:", 0);
  xpc_release(a1[4]);
}

- (void)_loadWithCompletionBlock:(id)a3
{
  NSObject *dispatchQueue;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[6];
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__34;
  v15 = __Block_byref_object_dispose__34;
  v16 = 0;
  dispatchQueue = self->_dispatchQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SSURLBag__loadWithCompletionBlock___block_invoke;
  block[3] = &unk_1E47BBA20;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(dispatchQueue, block);
  v7 = v12[5];
  if (v7)
  {
    (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, v7, 0);

  }
  else
  {
    v8 = self->_dispatchQueue;
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __37__SSURLBag__loadWithCompletionBlock___block_invoke_2;
    v9[3] = &unk_1E47BBC58;
    v9[4] = self;
    v9[5] = a3;
    dispatch_sync(v8, v9);
  }
  _Block_object_dispose(&v11, 8);
}

void __37__SSURLBag__loadWithCompletionBlock___block_invoke(uint64_t a1)
{
  double v2;
  CFAbsoluteTime Current;
  void *v4;

  v2 = *(double *)(*(_QWORD *)(a1 + 32) + 40);
  Current = CFAbsoluteTimeGetCurrent();
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2 <= Current)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v4;
  }
}

uint64_t __37__SSURLBag__loadWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", v2);

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count");
  if (result == 1)
    return objc_msgSend(*(id *)(a1 + 32), "_loadURLBag");
  return result;
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

@end
