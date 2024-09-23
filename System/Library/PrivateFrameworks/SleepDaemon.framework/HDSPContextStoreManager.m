@implementation HDSPContextStoreManager

- (HDSPContextStoreManager)initWithEnvironment:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  HDSPContextStoreManager *v7;

  v4 = (void *)MEMORY[0x24BE1B170];
  v5 = a3;
  objc_msgSend(v4, "userContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDSPContextStoreManager initWithEnvironment:context:](self, "initWithEnvironment:context:", v5, v6);

  return v7;
}

- (HDSPContextStoreManager)initWithEnvironment:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  HDSPContextStoreManager *v8;
  HDSPContextStoreManager *v9;
  HDSPContextStoreManager *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDSPContextStoreManager;
  v8 = -[HDSPContextStoreManager init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_environment, v6);
    objc_storeStrong((id *)&v9->_context, a4);
    v9->_contextLock._os_unfair_lock_opaque = 0;
    v10 = v9;
  }

  return v9;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_contextLock;
  void (**v4)(_QWORD);

  p_contextLock = &self->_contextLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_contextLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_contextLock);
}

- (id)registerPredicate:(id)a3 identifier:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class();
  HKSPLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v23 = v11;
    v24 = 2114;
    v25 = v8;
    v26 = 2114;
    v27 = v9;
    _os_log_impl(&dword_21610C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] registering predicate %{public}@ for identifier %{public}@", buf, 0x20u);
  }

  v13 = (void *)MEMORY[0x24BE1B190];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __65__HDSPContextStoreManager_registerPredicate_identifier_callback___block_invoke;
  v18[3] = &unk_24D4E3D60;
  v20 = v10;
  v21 = v11;
  v19 = v9;
  v14 = v10;
  v15 = v9;
  objc_msgSend(v13, "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", v15, v8, CFSTR("com.apple.sleepd.contextstore-registration"), v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDLocalContext registerCallback:](self->_context, "registerCallback:", v16);

  return v16;
}

void __65__HDSPContextStoreManager_registerPredicate_identifier_callback___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (objc_msgSend(a2, "isEqualToString:", a1[4]))
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = a1[6];
      v8 = a1[4];
      v14 = 138543618;
      v15 = v7;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] processing callback with identifier %{public}@", (uint8_t *)&v14, 0x16u);
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE1B1E0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE1B1E8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = a1[5];
    objc_msgSend(v9, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v11 + 16))(v11, v12, v13);

  }
}

- (void)unregister:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = v4;
    v6 = v8;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] unregistering %{public}@", (uint8_t *)&v7, 0x16u);

  }
  -[_CDLocalContext deregisterCallback:](self->_context, "deregisterCallback:", v4);

}

+ (id)healthAppForegroundPredicate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE1B1A0];
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForDefaultPairedDeviceForegroundApp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateForKeyPath:equalToValue:", v3, *MEMORY[0x24BDD4608]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sleepAppForegroundPredicate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE1B1A0];
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForForegroundApp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateForKeyPath:equalToValue:", v3, *MEMORY[0x24BEA9410]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "sleepCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", self);

  objc_msgSend(v4, "sleepScheduleModelManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:", self);

  objc_msgSend(v4, "sleepModeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:", self);

  objc_msgSend(v4, "sleepScheduler");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addEventHandler:", self);
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5
{
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (a4 != a3)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      v9 = v8;
      NSStringFromHKSPSleepScheduleState();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromHKSPSleepScheduleState();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromHKSPSleepScheduleStateChangeReason();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v21 = v8;
      v22 = 2114;
      v23 = v10;
      v24 = 2114;
      v25 = v11;
      v26 = 2114;
      v27 = v12;
      _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep state changed from %{public}@ to %{public}@ (%{public}@)", buf, 0x2Au);

    }
    if (a3 == 1 && (HKSPSleepScheduleStateChangeReasonIsExpected() & 1) == 0)
    {
      HKSPLogForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v21 = v16;
        v17 = v16;
        _os_log_impl(&dword_21610C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] ignoring wake up state as it was not due to normal reason", buf, 0xCu);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE1B180], "sleepScheduleState");
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSPContextStoreManager _writeSleepInfoToContextStore:](self, "_writeSleepInfoToContextStore:", v15);

    }
  }
}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(v5, "lastModifiedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = (id)objc_opt_class();
      v12 = 2114;
      v13 = v5;
      v8 = v11;
      _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] didUpdateSleepScheduleModel: %{public}@", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(v5, "lastModifiedDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSPContextStoreManager updateForScheduleModelModifiedOnDate:](self, "updateForScheduleModelModifiedOnDate:", v9);

  }
}

- (void)updateForScheduleModelModifiedOnDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BE1B180];
  v5 = a3;
  objc_msgSend(v4, "sleepScheduleModelDateModified");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSPContextStoreManager _writeSleepInfoToContextStore:](self, "_writeSleepInfoToContextStore:", v7);
}

- (void)sleepEventIsDue:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v6;
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep event due %{public}@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BE1B180], "sleepEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPContextStoreManager _writeSleepInfoToContextStore:](self, "_writeSleepInfoToContextStore:", v11);

}

- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5
{
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (a3 != a4)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      v9 = v8;
      NSStringFromHKSPSleepMode();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromHKSPSleepMode();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromHKSPSleepModeChangeReason();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v22 = v8;
      v23 = 2114;
      v24 = v10;
      v25 = 2114;
      v26 = v11;
      v27 = 2114;
      v28 = v12;
      _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode changed from %{public}@ to %{public}@ (%{public}@)", buf, 0x2Au);

    }
    v13 = a3 != 0;
    objc_msgSend(MEMORY[0x24BE1B180], "sleepModeState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v15;
    objc_msgSend(MEMORY[0x24BE1B180], "sleepModeOn");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v16;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSPContextStoreManager _writeSleepInfoToContextStore:](self, "_writeSleepInfoToContextStore:", v18);

  }
}

- (void)_writeSleepInfoToContextStore:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = (id)objc_opt_class();
    v12 = 2114;
    v13 = v4;
    v6 = v11;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] adding %{public}@ to context", buf, 0x16u);

  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__HDSPContextStoreManager__writeSleepInfoToContextStore___block_invoke;
  v8[3] = &unk_24D4E3680;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[HDSPContextStoreManager _withLock:](self, "_withLock:", v8);

}

void __57__HDSPContextStoreManager__writeSleepInfoToContextStore___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "contextualKeyPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v15 = 138543618;
    *(_QWORD *)&v15[4] = objc_opt_class();
    *(_WORD *)&v15[12] = 2114;
    *(_QWORD *)&v15[14] = v3;
    v5 = *(id *)&v15[4];
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] previous context is %{public}@", v15, 0x16u);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (id)objc_msgSend(v3, "mutableCopy");
  }
  else
  {
    if (v3)
    {
      HKSPLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v12 = (void *)objc_opt_class();
        v13 = v12;
        v14 = objc_opt_class();
        *(_DWORD *)v15 = 138543618;
        *(_QWORD *)&v15[4] = v12;
        *(_WORD *)&v15[12] = 2114;
        *(_QWORD *)&v15[14] = v14;
        _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] previous context is of unexpected class %{public}@", v15, 0x16u);

      }
    }
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  }
  v8 = v6;
  objc_msgSend(v6, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40), *(_OWORD *)v15, *(_QWORD *)&v15[16], v16);
  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    *(_DWORD *)v15 = 138543618;
    *(_QWORD *)&v15[4] = v10;
    *(_WORD *)&v15[12] = 2114;
    *(_QWORD *)&v15[14] = v8;
    v11 = v10;
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] new context is %{public}@", v15, 0x16u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v8, v2);

}

- (_CDLocalContext)context
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2;
  v9 = __Block_byref_object_dispose__2;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__HDSPContextStoreManager_context__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPContextStoreManager _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (_CDLocalContext *)v2;
}

void __34__HDSPContextStoreManager_context__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

+ (id)contextualKeyPath
{
  return (id)objc_msgSend(MEMORY[0x24BE1B180], "keyPathForSleepStateDictionary");
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (os_unfair_lock_s)contextLock
{
  return self->_contextLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_environment);
}

@end
