@implementation SBFAlwaysOnLiveRenderingBLSAssertionProvider

- (SBFAlwaysOnLiveRenderingBLSAssertionProvider)init
{
  SBFAlwaysOnLiveRenderingBLSAssertionProvider *v2;
  uint64_t v3;
  NSMapTable *assertions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFAlwaysOnLiveRenderingBLSAssertionProvider;
  v2 = -[SBFAlwaysOnLiveRenderingBLSAssertionProvider init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    assertions = v2->_assertions;
    v2->_assertions = (NSMapTable *)v3;

  }
  return v2;
}

- (id)acquireWithExplanation:(id)a3 attributes:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D00F48], "acquireWithExplanation:observer:attributes:", v6, self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogLiveRendering();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v10;
    v14 = 2048;
    v15 = v7;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_18AB69000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> live-rendering assertion created with reason '%@'", (uint8_t *)&v12, 0x20u);

  }
  return v7;
}

- (int64_t)acquiredAssertionsCount
{
  void *v2;
  void *v3;
  int64_t v4;
  uint64_t v5;

  -[NSMapTable keyEnumerator](self->_assertions, "keyEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v4 = -1;
  do
  {
    objc_msgSend(v2, "nextObject");
    v5 = objc_claimAutoreleasedReturnValue();

    ++v4;
    v3 = (void *)v5;
  }
  while (v5);

  return v4;
}

- (void)assertionWasAcquired:(id)a3
{
  id v4;
  NSMapTable *assertions;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  assertions = self->_assertions;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](assertions, "setObject:forKey:", v6, v7);

  objc_msgSend(v4, "explanation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBFAlwaysOnLiveRenderingBLSAssertionProvider acquiredAssertionsCount](self, "acquiredAssertionsCount");
  SBLogLiveRendering();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544130;
    v14 = v12;
    v15 = 2048;
    v16 = v4;
    v17 = 2112;
    v18 = v8;
    v19 = 1024;
    v20 = v9;
    _os_log_impl(&dword_18AB69000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> live-rendering assertion acquired with reason '%@' (activeCount: %d)", (uint8_t *)&v13, 0x26u);

  }
}

- (void)assertion:(id)a3 didCancelWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  double v24;
  __int16 v25;
  NSObject *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_assertions, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[NSMapTable removeObjectForKey:](self->_assertions, "removeObjectForKey:", v8);
    objc_msgSend(v6, "explanation");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[SBFAlwaysOnLiveRenderingBLSAssertionProvider acquiredAssertionsCount](self, "acquiredAssertionsCount");
    objc_msgSend(v7, "debugDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceNow");
    v14 = v13;
    SBLogLiveRendering();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (v14 < 0.0)
        v14 = -v14;
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138544642;
      v20 = v17;
      v21 = 2048;
      v22 = v6;
      v23 = 2048;
      v24 = v14;
      v25 = 2112;
      v26 = v10;
      v27 = 2112;
      v28 = v12;
      v29 = 1024;
      v30 = v11;
      _os_log_impl(&dword_18AB69000, v15, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> live-rendering assertion released after %.2f seconds with reason '%@' (error: %@, activeCount: %d)", (uint8_t *)&v19, 0x3Au);

    }
    goto LABEL_8;
  }
  SBLogLiveRendering();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "explanation");
    v15 = objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v12;
    v21 = 2048;
    v22 = v6;
    v23 = 2112;
    v24 = *(double *)&v15;
    _os_log_impl(&dword_18AB69000, v10, OS_LOG_TYPE_INFO, "<%{public}@: %p> live-rendering assertion release ignored because is not ours (reason: '%@')", (uint8_t *)&v19, 0x20u);
LABEL_8:

  }
}

- (BLSAssertionObserving)assertionObserver
{
  return (BLSAssertionObserving *)objc_loadWeakRetained((id *)&self->_assertionObserver);
}

- (void)setAssertionObserver:(id)a3
{
  objc_storeWeak((id *)&self->_assertionObserver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_assertionObserver);
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end
