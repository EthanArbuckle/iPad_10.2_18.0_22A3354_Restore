@implementation SSItemLookupRequest

- (SSItemLookupRequest)init
{
  SSItemLookupRequest *v2;
  SSItemLookupRequest *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSItemLookupRequest;
  v2 = -[SSRequest init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SSRequest setShouldCancelAfterTaskExpiration:](v2, "setShouldCancelAfterTaskExpiration:", 1);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSItemLookupRequest;
  -[SSRequest dealloc](&v3, sel_dealloc);
}

- (void)setValue:(id)a3 forParameter:(id)a4
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  if (a3 && !-[SSItemLookupRequest _convertedValueForValue:](self, "_convertedValueForValue:", a3))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Value type not supported"));
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SSItemLookupRequest_setValue_forParameter___block_invoke;
  block[3] = &unk_1E47B9E88;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(dispatchQueue, block);
}

void __45__SSItemLookupRequest_setValue_forParameter___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96))
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    if ((objc_msgSend(v2, "conformsToProtocol:", &unk_1EE6724F0) & 1) != 0)
    {
      v3 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKey:", v3, *(_QWORD *)(a1 + 48));

    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeObjectForKey:", *(_QWORD *)(a1 + 48));
  }
}

- (void)startWithItemLookupBlock:(id)a3
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
  int *v18;
  uint64_t v19;
  _QWORD v20[6];
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
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
      v21 = 136446210;
      v22 = "-[SSItemLookupRequest startWithItemLookupBlock:]";
      LODWORD(v19) = 12;
      v18 = &v21;
      v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v21, v19);
        free(v10);
        SSFileLog(v5, CFSTR("%@"), v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __48__SSItemLookupRequest_startWithItemLookupBlock___block_invoke;
  v20[3] = &unk_1E47B8EE0;
  v20[4] = self;
  v20[5] = a3;
  -[SSRequest _startWithMessageID:messageBlock:](self, "_startWithMessageID:messageBlock:", 54, v20, v18);
}

uint64_t __48__SSItemLookupRequest_startWithItemLookupBlock___block_invoke(uint64_t a1, void *a2)
{
  CFArrayRef v4;
  CFArrayRef v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  CFArrayRef v10;

  if (!*(_QWORD *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest");
  if (a2 == (void *)MEMORY[0x1E0C81258])
  {
    v9 = (id)SSError((uint64_t)CFSTR("SSErrorDomain"), 121, 0, 0);
  }
  else
  {
    objc_opt_class();
    v4 = SSXPCDictionaryCopyCFObjectWithClass(a2, "1");
    if (v4)
    {
      v5 = v4;
      v6 = (void *)-[__CFArray objectForKey:](v4, "objectForKey:", CFSTR("status-code"));
      if (v6)
      {
        v7 = (unint64_t)(id)objc_msgSend(*(id *)(a1 + 32), "_errorForStatusCode:", objc_msgSend(v6, "integerValue"));
        v8 = 0;
      }
      else
      {
        objc_opt_class();
        v10 = SSXPCDictionaryCopyCFObjectWithClass(a2, "2");
        if (!v10)
          v10 = (CFArrayRef)objc_alloc_init(MEMORY[0x1E0C99D68]);
        v8 = objc_msgSend(*(id *)(a1 + 32), "_copyItemsFromResponse:expirationDate:", v5, v10);

        v7 = 0;
      }

      goto LABEL_13;
    }
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "3"));
  }
  v7 = (unint64_t)v9;
  v8 = 0;
LABEL_13:
  if (!(v8 | v7))
    v7 = (unint64_t)(id)SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return objc_msgSend(*(id *)(a1 + 32), "_shutdownRequest");
}

- (id)valueForParameter:(id)a3
{
  NSObject *dispatchQueue;
  id v4;
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
  v10 = __Block_byref_object_copy__13;
  v11 = __Block_byref_object_dispose__13;
  v12 = 0;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SSItemLookupRequest_valueForParameter___block_invoke;
  block[3] = &unk_1E47BA7E8;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __41__SSItemLookupRequest_valueForParameter___block_invoke(_QWORD *a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1[4] + 96), "objectForKey:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

- (BOOL)start
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__SSItemLookupRequest_start__block_invoke;
  v3[3] = &unk_1E47BA810;
  v3[4] = self;
  -[SSItemLookupRequest startWithItemLookupBlock:](self, "startWithItemLookupBlock:", v3);
  return 1;
}

void __28__SSItemLookupRequest_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD block[7];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__SSItemLookupRequest_start__block_invoke_2;
  block[3] = &unk_1E47B9E88;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = a2;
  block[6] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __28__SSItemLookupRequest_start__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
  if (*(_QWORD *)(a1 + 40))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "itemLookupRequest:didFindItems:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(v2, "requestDidFinish:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(v2, "request:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  return result;
}

- (void)startWithCompletionBlock:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__SSItemLookupRequest_startWithCompletionBlock___block_invoke;
  v3[3] = &unk_1E47BA860;
  v3[4] = a3;
  -[SSItemLookupRequest startWithItemLookupBlock:](self, "startWithItemLookupBlock:", v3);
}

void __48__SSItemLookupRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  NSObject *global_queue;
  _QWORD block[7];

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__SSItemLookupRequest_startWithCompletionBlock___block_invoke_2;
    block[3] = &unk_1E47BA838;
    block[4] = a3;
    block[5] = a2;
    block[6] = v3;
    dispatch_async(global_queue, block);
  }
}

uint64_t __48__SSItemLookupRequest_startWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  if (*(_OWORD *)(a1 + 32) == 0)
    SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  NSObject *dispatchQueue;
  _QWORD v6[6];

  v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->super._dispatchQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__SSItemLookupRequest_copyXPCEncoding__block_invoke;
  v6[3] = &unk_1E47B8BB8;
  v6[4] = v3;
  v6[5] = self;
  dispatch_sync(dispatchQueue, v6);
  return v3;
}

void __38__SSItemLookupRequest_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "0", *(__CFString **)(*(_QWORD *)(a1 + 40) + 96));
}

- (SSItemLookupRequest)initWithXPCEncoding:(id)a3
{
  SSItemLookupRequest *v5;
  CFArrayRef v7;
  CFArrayRef v8;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v5 = -[SSItemLookupRequest init](self, "init");
    if (v5)
    {
      objc_opt_class();
      v7 = SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
      if (v7)
      {
        v8 = v7;

        v5->_parameters = (NSMutableDictionary *)-[__CFArray mutableCopy](v8, "mutableCopy");
      }
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)copyQueryStringParameters
{
  id v3;
  NSMutableDictionary *parameters;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __CFString *v9;
  void *v10;
  id v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  parameters = self->_parameters;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](parameters, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(parameters);
        v9 = *(__CFString **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v10 = (void *)-[NSMutableDictionary objectForKey:](self->_parameters, "objectForKey:", v9);
        v11 = -[SSItemLookupRequest _convertedValueForValue:](self, "_convertedValueForValue:", v10);
        if (v11)
        {
          v12 = v11;
          if (-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("id")))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)objc_msgSend(v10, "count") > 1)
              v9 = CFSTR("ids");
          }
          objc_msgSend(v3, "setObject:forKey:", v12, v9);
        }
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](parameters, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  return v3;
}

- (NSDictionary)parameters
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
  v9 = __Block_byref_object_copy__13;
  v10 = __Block_byref_object_dispose__13;
  v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__SSItemLookupRequest_parameters__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSDictionary *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__SSItemLookupRequest_parameters__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_copyItemsFromResponse:(id)a3 expirationDate:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SSItem *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_msgSend(a3, "objectForKey:", CFSTR("item-metadata"));
  if (v7 || (v7 = objc_msgSend(a3, "objectForKey:", CFSTR("album-metadata"))) != 0)
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v7, 0);
LABEL_4:
    v9 = v8;
    goto LABEL_5;
  }
  v16 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("items"));
  if (v16)
  {
    v8 = v16;
    goto LABEL_4;
  }
  v9 = 0;
LABEL_5:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = -[SSItem initWithItemDictionary:]([SSItem alloc], "initWithItemDictionary:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13));
        if (-[SSItem ITunesStoreIdentifier](v14, "ITunesStoreIdentifier"))
        {
          -[SSItem _setExpirationDate:](v14, "_setExpirationDate:", a4);
          objc_msgSend(v6, "addObject:", v14);
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  return v6;
}

- (id)_convertedValueForValue:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((id)*MEMORY[0x1E0C9AE50] == a3)
    {
      return CFSTR("yes");
    }
    else if ((id)*MEMORY[0x1E0C9AE40] == a3)
    {
      return CFSTR("no");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
        objc_msgSend(v5, "setNumberStyle:", 1);
        objc_msgSend(v5, "setUsesGroupingSeparator:", 0);
        a3 = (id)objc_msgSend(v5, "stringFromNumber:", a3);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v13 = 0u;
          v14 = 0u;
          v15 = 0u;
          v16 = 0u;
          v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v7)
          {
            v8 = v7;
            v9 = *(_QWORD *)v14;
            do
            {
              v10 = 0;
              do
              {
                if (*(_QWORD *)v14 != v9)
                  objc_enumerationMutation(a3);
                v11 = -[SSItemLookupRequest _convertedValueForValue:](self, "_convertedValueForValue:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
                if (v11)
                  objc_msgSend(v6, "addObject:", v11);
                ++v10;
              }
              while (v8 != v10);
              v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
            }
            while (v8);
          }
          a3 = (id)objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));

        }
        else
        {
          return 0;
        }
      }
    }
  }
  return a3;
}

- (id)_errorForStatusCode:(int64_t)a3
{
  uint64_t v3;

  if (a3 == 2000)
    v3 = 301;
  else
    v3 = 100;
  return (id)SSError((uint64_t)CFSTR("SSErrorDomain"), v3, 0, 0);
}

@end
