@implementation HKSPDiagnostics

- (HKSPDiagnostics)initWithLabel:(id)a3
{
  id v4;
  HKSPDiagnostics *v5;
  uint64_t v6;
  NSString *label;
  HKSPObserverSet *v8;
  void *v9;
  uint64_t v10;
  HKSPObserverSet *providers;
  HKSPDiagnostics *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKSPDiagnostics;
  v5 = -[HKSPDiagnostics init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v8 = [HKSPObserverSet alloc];
    objc_msgSend(MEMORY[0x1E0D519E8], "immediateScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HKSPObserverSet initWithCallbackScheduler:](v8, "initWithCallbackScheduler:", v9);
    providers = v5->_providers;
    v5->_providers = (HKSPObserverSet *)v10;

    -[HKSPDiagnostics _registerStateHandler](v5, "_registerStateHandler");
    v12 = v5;
  }

  return v5;
}

- (void)addProvider:(id)a3
{
  if (a3)
    -[HKSPObserverSet addObserver:](self->_providers, "addObserver:");
}

- (void)removeProvider:(id)a3
{
  if (a3)
    -[HKSPObserverSet removeObserver:](self->_providers, "removeObserver:");
}

- (void)_registerStateHandler
{
  void *v2;
  id v3;
  id location;

  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_copyWeak(&v3, &location);
  os_state_add_handler();

  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

_DWORD *__40__HKSPDiagnostics__registerStateHandler__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  unsigned int v13;
  NSObject *v14;
  _DWORD *v15;
  unsigned int v16;
  size_t v17;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(_DWORD *)(a2 + 16) == 3)
  {
    v5 = (void *)MEMORY[0x1A85ABB98]();
    HKSPLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = (id)objc_opt_class();
      v7 = v25;
      _os_log_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] processing os_state handler", buf, 0xCu);

    }
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = (void *)WeakRetained[2];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __40__HKSPDiagnostics__registerStateHandler__block_invoke_185;
    v22[3] = &unk_1E4E3A998;
    v10 = v8;
    v23 = v10;
    objc_msgSend(v9, "enumerateObserversWithBlock:", v22);
    v21 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v10, 200, 0, &v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v21;
    v13 = objc_msgSend(v11, "length");
    if (v12)
    {
      HKSPLogForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v19 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v25 = v19;
        v26 = 2114;
        v27 = v12;
        v20 = v19;
        _os_log_error_impl(&dword_1A4F0E000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] error serializing state data: %{public}@", buf, 0x16u);

      }
      v15 = 0;
    }
    else
    {
      v16 = v13;
      v17 = v13;
      v15 = malloc_type_calloc(1uLL, v13 + 200, 0x9D6632C7uLL);
      *v15 = 1;
      v15[1] = v16;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "UTF8String");
      __strlcpy_chk();
      memcpy(v15 + 50, (const void *)objc_msgSend(objc_retainAutorelease(v11), "bytes"), v17);
    }

    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __40__HKSPDiagnostics__registerStateHandler__block_invoke_185(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  void *v8;
  id v9;

  v9 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "diagnosticInfo");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = v3;
    else
      v5 = MEMORY[0x1E0C9AA70];
    v6 = *(void **)(a1 + 32);
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v8);

  }
}

- (NSString)label
{
  return self->_label;
}

- (HKSPObserverSet)providers
{
  return self->_providers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
