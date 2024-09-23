@implementation HKSPLimitingScheduler

- (HKSPLimitingScheduler)initWithScheduler:(id)a3 mutexGenerator:(id)a4 ignoreDelays:(BOOL)a5
{
  id v8;
  void (**v9)(_QWORD);
  HKSPLimitingScheduler *v10;
  void *v11;
  uint64_t v12;
  NAScheduler *orderPreservingScheduler;
  uint64_t v14;
  HKSPMutexProvider *mutexProvider;
  NSMutableSet *v16;
  NSMutableSet *identifiers;
  HKSPLimitingScheduler *v18;
  objc_super v20;

  v8 = a3;
  v9 = (void (**)(_QWORD))a4;
  v20.receiver = self;
  v20.super_class = (Class)HKSPLimitingScheduler;
  v10 = -[HKSPLimitingScheduler init](&v20, sel_init);
  if (v10)
  {
    v9[2](v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HKSPOrderPreservingScheduler(v8, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    orderPreservingScheduler = v10->_orderPreservingScheduler;
    v10->_orderPreservingScheduler = (NAScheduler *)v12;

    v9[2](v9);
    v14 = objc_claimAutoreleasedReturnValue();
    mutexProvider = v10->_mutexProvider;
    v10->_mutexProvider = (HKSPMutexProvider *)v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    identifiers = v10->_identifiers;
    v10->_identifiers = v16;

    v10->_ignoreDelays = a5;
    v18 = v10;
  }

  return v10;
}

- (HKSPLimitingScheduler)initWithScheduler:(id)a3 mutexGenerator:(id)a4
{
  return -[HKSPLimitingScheduler initWithScheduler:mutexGenerator:ignoreDelays:](self, "initWithScheduler:mutexGenerator:ignoreDelays:", a3, a4, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_storeStrong((id *)&self->_orderPreservingScheduler, 0);
}

- (HKSPLimitingScheduler)initWithScheduler:(id)a3
{
  id v4;
  id v5;
  HKSPLimitingScheduler *v6;

  v4 = a3;
  v5 = &__block_literal_global_21;
  v6 = -[HKSPLimitingScheduler initWithScheduler:mutexGenerator:](self, "initWithScheduler:mutexGenerator:", v4, &__block_literal_global_21);

  return v6;
}

- (void)_withLock:(id)a3
{
  -[HKSPMutexProvider performBlock:](self->_mutexProvider, "performBlock:", a3);
}

- (void)scheduleTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    HKSPLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543618;
      v18 = (id)objc_opt_class();
      v19 = 2112;
      v20 = v5;
      v13 = v18;
      _os_log_debug_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEBUG, "[%{public}@] generating identifier %@ for task", buf, 0x16u);

    }
  }
  HKSPLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v18 = v11;
    v19 = 2112;
    v20 = v5;
    v12 = v11;
    _os_log_debug_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_DEBUG, "[%{public}@] request to perform %@ task", buf, 0x16u);

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __38__HKSPLimitingScheduler_scheduleTask___block_invoke;
  v14[3] = &unk_1E4E3CB08;
  v14[4] = self;
  v15 = v5;
  v16 = v4;
  v9 = v4;
  v10 = v5;
  -[HKSPLimitingScheduler _withLock:](self, "_withLock:", v14);

}

void __38__HKSPLimitingScheduler_scheduleTask___block_invoke(uint64_t a1)
{
  char v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", *(_QWORD *)(a1 + 40));
  HKSPLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if ((v2 & 1) != 0)
  {
    if (v4)
    {
      v10 = (void *)objc_opt_class();
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v22 = v10;
      v23 = 2112;
      v24 = v11;
      v12 = v10;
      _os_log_debug_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] %@ task already in progress", buf, 0x16u);

    }
  }
  else
  {
    if (v4)
    {
      v13 = (void *)objc_opt_class();
      v15 = *(_QWORD *)(a1 + 40);
      v14 = *(void **)(a1 + 48);
      v16 = v13;
      objc_msgSend(v14, "delay");
      *(_DWORD *)buf = 138543874;
      v22 = v13;
      v23 = 2112;
      v24 = v15;
      v25 = 2048;
      v26 = v17;
      _os_log_debug_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEBUG, "[%{public}@] enqueuing %@ task with %f second delay", buf, 0x20u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 8);
    if (*(_BYTE *)(v5 + 32))
    {
      v7 = 0.0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "delay");
      v7 = v8;
      v5 = *(_QWORD *)(a1 + 32);
    }
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __38__HKSPLimitingScheduler_scheduleTask___block_invoke_184;
    v18[3] = &unk_1E4E3CB08;
    v18[4] = v5;
    v19 = *(id *)(a1 + 40);
    v20 = *(id *)(a1 + 48);
    v9 = (id)objc_msgSend(v6, "afterDelay:performBlock:", v18, v7);

  }
}

void __38__HKSPLimitingScheduler_scheduleTask___block_invoke_184(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  HKSPLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v5 = (void *)objc_opt_class();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    v7 = v5;
    _os_log_debug_impl(&dword_1A4F0E000, v2, OS_LOG_TYPE_DEBUG, "[%{public}@] performing %@ task", buf, 0x16u);

  }
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __38__HKSPLimitingScheduler_scheduleTask___block_invoke_185;
  v14 = &unk_1E4E3A760;
  v3 = *(void **)(a1 + 40);
  v15 = *(id *)(a1 + 32);
  v16 = v3;
  objc_msgSend(v15, "_withLock:", &v11);
  objc_msgSend(*(id *)(a1 + 48), "execute", v11, v12, v13, v14, v15);
  HKSPLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v8 = (void *)objc_opt_class();
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v10 = v8;
    _os_log_debug_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] finished %@ task", buf, 0x16u);

  }
}

uint64_t __38__HKSPLimitingScheduler_scheduleTask___block_invoke_185(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

@end
