@implementation PXUbiquitousKeyValueStoreValueAccessor

uint64_t __64__PXUbiquitousKeyValueStoreValueAccessor_loadValueAsyncIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storeQueue_handleLoadValueAsync");
}

- (void)loadValueAsyncIfNeeded
{
  void *v3;
  PXUbiquitousKeyValueStoreValueAccessor *v4;
  NSObject *v5;
  _QWORD block[5];

  -[PXUbiquitousKeyValueStoreValueAccessor currentValueIfLoaded](self, "currentValueIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = self;
    -[PXUbiquitousKeyValueStoreValueAccessor storeQueue](v4, "storeQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__PXUbiquitousKeyValueStoreValueAccessor_loadValueAsyncIfNeeded__block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = v4;
    dispatch_async(v5, block);

  }
}

- (OS_dispatch_queue)storeQueue
{
  return self->_storeQueue;
}

- (id)currentValueIfLoaded
{
  return -[PXUbiquitousKeyValueStoreValueAccessor _currentValueLoadIfNeeded:](self, "_currentValueLoadIfNeeded:", 0);
}

void __74__PXUbiquitousKeyValueStoreValueAccessor__storeQueue_handleLoadValueAsync__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = v1[4];
  objc_msgSend(v1, "currentValue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (id)currentValue
{
  return -[PXUbiquitousKeyValueStoreValueAccessor _currentValueLoadIfNeeded:](self, "_currentValueLoadIfNeeded:", 1);
}

- (void)_storeQueue_handleLoadValueAsync
{
  id v3;
  _QWORD block[5];

  v3 = -[PXUbiquitousKeyValueStoreValueAccessor _currentValueLoadIfNeeded:](self, "_currentValueLoadIfNeeded:", 1);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PXUbiquitousKeyValueStoreValueAccessor__storeQueue_handleLoadValueAsync__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (id)_currentValueLoadIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  PXUbiquitousKeyValueStoreValueAccessor *v5;
  id cachedValue;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id defaultValueFuture;
  id v14;
  void *v16;

  v3 = a3;
  v5 = self;
  objc_sync_enter(v5);
  cachedValue = v5->_cachedValue;
  if (cachedValue)
    v7 = 1;
  else
    v7 = !v3;
  if (!v7)
  {
    -[PXUbiquitousKeyValueStoreValueAccessor ubiquitousKeyValueStore](v5, "ubiquitousKeyValueStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUbiquitousKeyValueStoreValueAccessor key](v5, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v5->_cachedValue;
    v5->_cachedValue = (id)v10;

    cachedValue = v5->_cachedValue;
    if (!cachedValue)
    {
      (*((void (**)(void))v5->_defaultValueFuture + 2))();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXUbiquitousKeyValueStoreValueAccessor _setCurrentValue:updateUbiquitousKeyValueStore:notifyChange:](v5, "_setCurrentValue:updateUbiquitousKeyValueStore:notifyChange:", v12, 1, 0);
      defaultValueFuture = v5->_defaultValueFuture;
      v5->_defaultValueFuture = 0;

      cachedValue = v5->_cachedValue;
      if (!cachedValue)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("PXUbiquitousKeyValueStoreValueAccessor.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_cachedValue != nil"));

        cachedValue = v5->_cachedValue;
      }
    }
  }
  v14 = cachedValue;
  objc_sync_exit(v5);

  return v14;
}

- (NSUbiquitousKeyValueStore)ubiquitousKeyValueStore
{
  return self->_ubiquitousKeyValueStore;
}

- (NSString)key
{
  return self->_key;
}

- (PXUbiquitousKeyValueStoreValueAccessor)initWithUbiquitousKeyValueStore:(id)a3 key:(id)a4 defaultValueFuture:(id)a5 valueFilter:(id)a6 changeHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PXUbiquitousKeyValueStoreValueAccessor *v18;
  PXUbiquitousKeyValueStoreValueAccessor *v19;
  uint64_t v20;
  NSString *key;
  uint64_t v22;
  id defaultValueFuture;
  uint64_t v24;
  id valueFilter;
  uint64_t v26;
  id changeHandler;
  uint64_t v28;
  OS_dispatch_queue *storeQueue;
  void *v30;
  objc_super v32;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v32.receiver = self;
  v32.super_class = (Class)PXUbiquitousKeyValueStoreValueAccessor;
  v18 = -[PXUbiquitousKeyValueStoreValueAccessor init](&v32, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_ubiquitousKeyValueStore, a3);
    v20 = objc_msgSend(v14, "copy");
    key = v19->_key;
    v19->_key = (NSString *)v20;

    v22 = objc_msgSend(v15, "copy");
    defaultValueFuture = v19->_defaultValueFuture;
    v19->_defaultValueFuture = (id)v22;

    v24 = objc_msgSend(v16, "copy");
    valueFilter = v19->_valueFilter;
    v19->_valueFilter = (id)v24;

    v26 = objc_msgSend(v17, "copy");
    changeHandler = v19->_changeHandler;
    v19->_changeHandler = (id)v26;

    objc_msgSend((id)objc_opt_class(), "_defaultQueue");
    v28 = objc_claimAutoreleasedReturnValue();
    storeQueue = v19->_storeQueue;
    v19->_storeQueue = (OS_dispatch_queue *)v28;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v19, sel__keyValueStoreDidChangeExternally_, *MEMORY[0x1E0CB3368], v19->_ubiquitousKeyValueStore);

  }
  return v19;
}

+ (id)_defaultQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PXUbiquitousKeyValueStoreValueAccessor__defaultQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_defaultQueue_onceToken != -1)
    dispatch_once(&_defaultQueue_onceToken, block);
  return (id)_defaultQueue_defaultQueue;
}

void __55__PXUbiquitousKeyValueStoreValueAccessor__defaultQueue__block_invoke(uint64_t a1)
{
  const char *v1;
  NSObject *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  id v6;

  NSStringFromClass(*(Class *)(a1 + 32));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = (const char *)objc_msgSend(v6, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_BACKGROUND, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create(v1, v3);
  v5 = (void *)_defaultQueue_defaultQueue;
  _defaultQueue_defaultQueue = (uint64_t)v4;

}

- (PXUbiquitousKeyValueStoreValueAccessor)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUbiquitousKeyValueStoreValueAccessor.m"), 23, CFSTR("%s is not available as initializer"), "-[PXUbiquitousKeyValueStoreValueAccessor init]");

  abort();
}

- (void)setCurrentValue:(id)a3
{
  -[PXUbiquitousKeyValueStoreValueAccessor _setCurrentValue:updateUbiquitousKeyValueStore:notifyChange:](self, "_setCurrentValue:updateUbiquitousKeyValueStore:notifyChange:", a3, 1, 1);
}

- (void)_setCurrentValue:(id)a3 updateUbiquitousKeyValueStore:(BOOL)a4 notifyChange:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v10;
  PXUbiquitousKeyValueStoreValueAccessor *v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD block[5];
  id v16;

  v5 = a5;
  v6 = a4;
  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUbiquitousKeyValueStoreValueAccessor.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("currentValue != nil"));

  }
  v11 = self;
  objc_sync_enter(v11);
  if (v11->_cachedValue && !(*((unsigned int (**)(void))v11->_valueFilter + 2))())
  {
    objc_sync_exit(v11);

  }
  else
  {
    objc_storeStrong(&v11->_cachedValue, a3);
    if (v6)
    {
      -[PXUbiquitousKeyValueStoreValueAccessor storeQueue](v11, "storeQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __102__PXUbiquitousKeyValueStoreValueAccessor__setCurrentValue_updateUbiquitousKeyValueStore_notifyChange___block_invoke;
      block[3] = &unk_1E5148D08;
      block[4] = v11;
      v16 = v10;
      dispatch_async(v12, block);

    }
    objc_sync_exit(v11);

    if (v5)
    {
      v14 = v10;
      px_dispatch_on_main_queue();

    }
  }

}

- (void)_keyValueStoreDidChangeExternally:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3360]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PXUbiquitousKeyValueStoreValueAccessor key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "containsObject:", v5))
  {
    -[PXUbiquitousKeyValueStoreValueAccessor ubiquitousKeyValueStore](self, "ubiquitousKeyValueStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[PXUbiquitousKeyValueStoreValueAccessor _setCurrentValue:updateUbiquitousKeyValueStore:notifyChange:](self, "_setCurrentValue:updateUbiquitousKeyValueStore:notifyChange:", v7, 0, 1);
    else
      NSLog(CFSTR("%@ unexpectedly returned nil for %@, ignoring"), v6, v5);

  }
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUbiquitousKeyValueStoreValueAccessor key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p, key: %@>"), v5, self, v6);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeQueue, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_ubiquitousKeyValueStore, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong(&self->_valueFilter, 0);
  objc_storeStrong(&self->_defaultValueFuture, 0);
  objc_storeStrong(&self->_cachedValue, 0);
}

void __102__PXUbiquitousKeyValueStoreValueAccessor__setCurrentValue_updateUbiquitousKeyValueStore_notifyChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "ubiquitousKeyValueStore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v2, v3);

}

uint64_t __102__PXUbiquitousKeyValueStoreValueAccessor__setCurrentValue_updateUbiquitousKeyValueStore_notifyChange___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
}

@end
