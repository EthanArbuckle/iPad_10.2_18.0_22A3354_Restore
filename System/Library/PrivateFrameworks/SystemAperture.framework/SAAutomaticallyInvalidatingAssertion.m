@implementation SAAutomaticallyInvalidatingAssertion

- (SAAutomaticallyInvalidatingAssertion)initWithInvalidationInterval:(double)a3
{
  SAAutomaticallyInvalidatingAssertion *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SAAutomaticallyInvalidatingAssertion;
  result = -[SAAssertion init](&v5, sel_init);
  if (result)
    result->_invalidationInterval = a3;
  return result;
}

- (id)_descriptionConstituents
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = objc_alloc(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_invalidationInterval);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSTimer isValid](self->_invalidationTimer, "isValid");
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBOOL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", v4, CFSTR("invalidation interval"), v5, CFSTR("timer scheduled"), v6, CFSTR("locked"), 0);

  if (-[NSString length](self->_lockReason, "length"))
    objc_msgSend(v7, "setValue:forKey:", self->_lockReason, CFSTR("lock reason"));
  v11.receiver = self;
  v11.super_class = (Class)SAAutomaticallyInvalidatingAssertion;
  -[SAAssertion _descriptionConstituents](&v11, sel__descriptionConstituents);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObject:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setAutomaticallyInvalidatable:(BOOL)a3
{
  -[SAAutomaticallyInvalidatingAssertion _setAutomaticallyInvalidatable:lockingWithKey:reason:](self, "_setAutomaticallyInvalidatable:lockingWithKey:reason:", a3, 0, 0);
}

- (void)resetAutomaticInvalidationTimer
{
  SAAutomaticallyInvalidatingAssertion *v2;
  NSObject *v3;
  int v4;
  SAAutomaticallyInvalidatingAssertion *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  if (-[SAAssertion isValid](v2, "isValid") && -[NSTimer isValid](v2->_invalidationTimer, "isValid"))
  {
    v3 = SALogSystem;
    if (os_log_type_enabled((os_log_t)SALogSystem, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_impl(&dword_247C57000, v3, OS_LOG_TYPE_DEFAULT, "Automatic invalidation timer reset: %{public}@", (uint8_t *)&v4, 0xCu);
    }
    -[SAAutomaticallyInvalidatingAssertion _invalidateInvalidationTimerIfNecessary](v2, "_invalidateInvalidationTimerIfNecessary");
    -[SAAutomaticallyInvalidatingAssertion _scheduleInvalidationTimerIfNecessary](v2, "_scheduleInvalidationTimerIfNecessary");
  }
  objc_sync_exit(v2);

}

- (BOOL)_setAutomaticallyInvalidatable:(BOOL)a3 lockingWithKey:(id)a4 reason:(id)a5
{
  int v6;
  id v8;
  id v9;
  SAAutomaticallyInvalidatingAssertion *v10;
  int automaticallyInvalidatable;
  NSString *key;
  BOOL v13;
  uint64_t v14;
  NSString *v15;
  NSObject *v16;
  const __CFString *v17;
  int v19;
  const __CFString *v20;
  __int16 v21;
  SAAutomaticallyInvalidatingAssertion *v22;
  uint64_t v23;

  v6 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  if (!-[SAAssertion isValid](v10, "isValid"))
    goto LABEL_11;
  automaticallyInvalidatable = v10->_automaticallyInvalidatable;
  key = v10->_key;
  if (automaticallyInvalidatable == v6)
  {
    v13 = 0;
    if (!v8 || key)
      goto LABEL_21;
    goto LABEL_9;
  }
  if (key)
  {
    if (-[NSString isEqualToString:](key, "isEqualToString:", v8))
    {
      automaticallyInvalidatable = v10->_automaticallyInvalidatable;
      goto LABEL_9;
    }
LABEL_11:
    v13 = 0;
    goto LABEL_21;
  }
LABEL_9:
  v13 = automaticallyInvalidatable != v6;
  v10->_automaticallyInvalidatable = v6;
  if ((v6 & 1) != 0)
    v14 = 0;
  else
    v14 = objc_msgSend(v8, "copy");
  v15 = v10->_key;
  v10->_key = (NSString *)v14;

  v16 = SALogSystem;
  if (os_log_type_enabled((os_log_t)SALogSystem, OS_LOG_TYPE_DEFAULT))
  {
    if (v10->_automaticallyInvalidatable)
      v17 = CFSTR("enabled");
    else
      v17 = CFSTR("disabled");
    v19 = 138412546;
    v20 = v17;
    v21 = 2114;
    v22 = v10;
    _os_log_impl(&dword_247C57000, v16, OS_LOG_TYPE_DEFAULT, "Automatic invalidation %@: %{public}@", (uint8_t *)&v19, 0x16u);
  }
  if (v10->_automaticallyInvalidatable)
    -[SAAutomaticallyInvalidatingAssertion _scheduleInvalidationTimerIfNecessary](v10, "_scheduleInvalidationTimerIfNecessary");
  else
    -[SAAutomaticallyInvalidatingAssertion _invalidateInvalidationTimerIfNecessary](v10, "_invalidateInvalidationTimerIfNecessary");
LABEL_21:
  objc_sync_exit(v10);

  return v13;
}

- (void)_scheduleInvalidationTimerIfNecessary
{
  SAAutomaticallyInvalidatingAssertion *v2;
  NSObject *v3;
  void *v4;
  double invalidationInterval;
  uint64_t v6;
  NSTimer *invalidationTimer;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  SAAutomaticallyInvalidatingAssertion *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  if (-[SAAssertion isValid](v2, "isValid") && !-[NSTimer isValid](v2->_invalidationTimer, "isValid"))
  {
    v3 = SALogSystem;
    if (os_log_type_enabled((os_log_t)SALogSystem, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v2;
      _os_log_impl(&dword_247C57000, v3, OS_LOG_TYPE_DEFAULT, "Scheduling automatic invalidation timer: %{public}@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, v2);
    v4 = (void *)MEMORY[0x24BDBCF40];
    invalidationInterval = v2->_invalidationInterval;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __77__SAAutomaticallyInvalidatingAssertion__scheduleInvalidationTimerIfNecessary__block_invoke;
    v8[3] = &unk_25193B710;
    objc_copyWeak(&v9, (id *)buf);
    objc_msgSend(v4, "scheduledTimerWithTimeInterval:repeats:block:", 0, v8, invalidationInterval);
    v6 = objc_claimAutoreleasedReturnValue();
    invalidationTimer = v2->_invalidationTimer;
    v2->_invalidationTimer = (NSTimer *)v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
  objc_sync_exit(v2);

}

void __77__SAAutomaticallyInvalidatingAssertion__scheduleInvalidationTimerIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*((id *)WeakRetained + 7) == v5)
    {
      *((_QWORD *)WeakRetained + 7) = 0;

    }
    objc_msgSend(v4, "invalidateWithReason:", CFSTR("automatic invalidation interval elapsed"));
  }

}

- (void)_invalidateInvalidationTimerIfNecessary
{
  SAAutomaticallyInvalidatingAssertion *v2;
  NSObject *v3;
  NSTimer *invalidationTimer;
  int v5;
  SAAutomaticallyInvalidatingAssertion *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  if (-[NSTimer isValid](v2->_invalidationTimer, "isValid"))
  {
    v3 = SALogSystem;
    if (os_log_type_enabled((os_log_t)SALogSystem, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = v2;
      _os_log_impl(&dword_247C57000, v3, OS_LOG_TYPE_DEFAULT, "Automatic invalidation timer invalidated: %{public}@", (uint8_t *)&v5, 0xCu);
    }
    -[NSTimer invalidate](v2->_invalidationTimer, "invalidate");
    invalidationTimer = v2->_invalidationTimer;
    v2->_invalidationTimer = 0;

  }
  objc_sync_exit(v2);

}

- (BOOL)isAutomaticallyInvalidatable
{
  return self->_automaticallyInvalidatable;
}

- (double)invalidationInterval
{
  return self->_invalidationInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
  objc_storeStrong((id *)&self->_lockReason, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
