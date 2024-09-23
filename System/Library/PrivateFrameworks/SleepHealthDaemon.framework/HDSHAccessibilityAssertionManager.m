@implementation HDSHAccessibilityAssertionManager

- (HDSHAccessibilityAssertionManager)initWithProfile:(id)a3
{
  id v4;
  HDSHAccessibilityAssertionManager *v5;
  HDSHAccessibilityAssertionManager *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  id WeakRetained;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDSHAccessibilityAssertionManager;
  v5 = -[HDSHAccessibilityAssertionManager init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v6, 0);

  }
  return v6;
}

- (void)profileDidBecomeReady:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)v7 = 138543362;
    *(_QWORD *)&v7[4] = objc_opt_class();
    v6 = *(id *)&v7[4];
    _os_log_impl(&dword_21AB9E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] profileDidBecomeReady", v7, 0xCu);

  }
  -[HDSHAccessibilityAssertionManager _restoreContentProtectionObservingState](self, "_restoreContentProtectionObservingState", *(_OWORD *)v7);
}

- (BOOL)shouldBeObservingContentProtectionState
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE40AD0]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = (void *)objc_msgSend(v3, "initWithCategory:domainName:profile:", 0, CFSTR("SleepTracking"), WeakRetained);

  v15 = 0;
  objc_msgSend(v5, "dateForKey:error:", CFSTR("SleepTrackingSessionStartDate"), &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  if (v7)
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x24BDD3060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_ERROR))
    {
      v11 = v8;
      v12 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v17 = v12;
      v18 = 2114;
      v19 = v7;
      v13 = v12;
      _os_log_error_impl(&dword_21AB9E000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] failed to read observing protection state key: %{public}@", buf, 0x16u);

      if (v6)
        goto LABEL_4;
LABEL_6:
      v10 = 0;
      goto LABEL_7;
    }
  }
  if (!v6)
    goto LABEL_6;
LABEL_4:
  objc_msgSend(v6, "timeIntervalSinceNow");
  v10 = v9 > -86400.0;
LABEL_7:

  return v10;
}

- (void)setShouldBeObservingContentProtectionState:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc(MEMORY[0x24BE40AD0]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v7 = (void *)objc_msgSend(v5, "initWithCategory:domainName:profile:", 0, CFSTR("SleepTracking"), WeakRetained);

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v15 = 0;
  v9 = objc_msgSend(v7, "setDate:forKey:error:", v8, CFSTR("SleepTrackingSessionStartDate"), &v15);
  v10 = v15;
  if (v3)

  if ((v9 & 1) == 0)
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x24BDD3060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = v10;
      v14 = v13;
      _os_log_error_impl(&dword_21AB9E000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] failed to set observing protection state key: %{public}@", buf, 0x16u);

    }
  }

}

- (void)_restoreContentProtectionObservingState
{
  void *v3;
  NSObject *v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (-[HDSHAccessibilityAssertionManager shouldBeObservingContentProtectionState](self, "shouldBeObservingContentProtectionState"))
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x24BDD3060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      v9 = 138543362;
      v10 = (id)objc_opt_class();
      v5 = v10;
      _os_log_impl(&dword_21AB9E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] should be observing content protection state", (uint8_t *)&v9, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentProtectionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addContentProtectionObserver:withQueue:", self, self->_queue);

  }
}

- (void)beginObservingContentProtectionState
{
  void *v3;
  NSObject *v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)v9 = 138543362;
    *(_QWORD *)&v9[4] = objc_opt_class();
    v5 = *(id *)&v9[4];
    _os_log_impl(&dword_21AB9E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] beginObservingContentProtectionState", v9, 0xCu);

  }
  -[HDSHAccessibilityAssertionManager setShouldBeObservingContentProtectionState:](self, "setShouldBeObservingContentProtectionState:", 1, *(_OWORD *)v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentProtectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addContentProtectionObserver:withQueue:", self, self->_queue);

}

- (void)stopObservingContentProtectionState
{
  void *v3;
  NSObject *v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)v9 = 138543362;
    *(_QWORD *)&v9[4] = objc_opt_class();
    v5 = *(id *)&v9[4];
    _os_log_impl(&dword_21AB9E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] stopObservingContentProtectionState", v9, 0xCu);

  }
  -[HDSHAccessibilityAssertionManager setShouldBeObservingContentProtectionState:](self, "setShouldBeObservingContentProtectionState:", 0, *(_OWORD *)v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentProtectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeContentProtectionObserver:", self);

}

- (void)invalidateAccessibilityAssertion
{
  void *v3;
  NSObject *v4;
  id v5;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 138543362;
    v9 = (id)objc_opt_class();
    v5 = v9;
    _os_log_impl(&dword_21AB9E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] invalidateAccessibilityAssertion", buf, 0xCu);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__HDSHAccessibilityAssertionManager_invalidateAccessibilityAssertion__block_invoke;
  block[3] = &unk_24DDB8B88;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __69__HDSHAccessibilityAssertionManager_invalidateAccessibilityAssertion__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

}

- (HDAssertion)accessibilityAssertion
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__HDSHAccessibilityAssertionManager_accessibilityAssertion__block_invoke;
  v5[3] = &unk_24DDB8BB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (HDAssertion *)v3;
}

void __59__HDSHAccessibilityAssertionManager_accessibilityAssertion__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a3 == 3
    && -[HDSHAccessibilityAssertionManager shouldBeObservingContentProtectionState](self, "shouldBeObservingContentProtectionState"))
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      *(_DWORD *)v9 = 138543362;
      *(_QWORD *)&v9[4] = objc_opt_class();
      v8 = *(id *)&v9[4];
      _os_log_impl(&dword_21AB9E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] database is locking, taking assertion", v9, 0xCu);

    }
    -[HDSHAccessibilityAssertionManager _queue_takeAccessibilityAssertion](self, "_queue_takeAccessibilityAssertion", *(_OWORD *)v9);
  }
}

- (void)_queue_takeAccessibilityAssertion
{
  os_log_t *v3;
  os_log_t v4;
  NSObject *v5;
  id v6;
  id WeakRetained;
  void *v8;
  objc_class *v9;
  void *v10;
  HDAssertion *v11;
  id v12;
  HDAssertion *accessibilityAssertion;
  os_log_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BDD3060];
  if (self->_accessibilityAssertion)
  {
    _HKInitializeLogging();
    v4 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      *(_DWORD *)buf = 138543362;
      v20 = (id)objc_opt_class();
      v6 = v20;
      _os_log_impl(&dword_21AB9E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] invalidating existing assertion", buf, 0xCu);

    }
    -[HDAssertion invalidate](self->_accessibilityAssertion, "invalidate");
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v8, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v10, &v18, 600.0);
  v11 = (HDAssertion *)objc_claimAutoreleasedReturnValue();
  v12 = v18;
  accessibilityAssertion = self->_accessibilityAssertion;
  self->_accessibilityAssertion = v11;

  if (!self->_accessibilityAssertion)
  {
    _HKInitializeLogging();
    v14 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      v15 = v14;
      v16 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v20 = v16;
      v21 = 2114;
      v22 = v12;
      v17 = v16;
      _os_log_error_impl(&dword_21AB9E000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] failed to take assertion with error: %{public}@", buf, 0x16u);

    }
  }

}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  void *v5;
  objc_super v6;

  -[HDAssertion invalidate](self->_accessibilityAssertion, "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentProtectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeContentProtectionObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)HDSHAccessibilityAssertionManager;
  -[HDSHAccessibilityAssertionManager dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accessibilityAssertion, 0);
}

@end
