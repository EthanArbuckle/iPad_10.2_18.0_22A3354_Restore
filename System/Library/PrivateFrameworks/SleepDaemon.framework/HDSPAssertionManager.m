@implementation HDSPAssertionManager

- (HDSPAssertionManager)init
{
  HDSPAssertionManager *v2;
  NSObject *v3;
  void *v4;
  id v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *assertions;
  HDSPAssertionManager *v8;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  HDSPAssertionManager *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)HDSPAssertionManager;
  v2 = -[HDSPAssertionManager init](&v10, sel_init);
  if (v2)
  {
    HKSPLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v12 = v4;
      v13 = 2048;
      v14 = v2;
      v5 = v4;
      _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);

    }
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    assertions = v2->_assertions;
    v2->_assertions = v6;

    v2->_assertionsLock._os_unfair_lock_opaque = 0;
    v8 = v2;
  }

  return v2;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_assertionsLock;
  void (**v4)(_QWORD);

  p_assertionsLock = &self->_assertionsLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_assertionsLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_assertionsLock);
}

- (void)takeAssertionWithIdentifier:(id)a3 type:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "assertionClassForType:", a4), "assertionWithIdentifier:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[HDSPAssertionManager takeAssertion:](self, "takeAssertion:", v7);
}

- (void)takeAssertionWithIdentifier:(id)a3 type:(unint64_t)a4 timeout:(double)a5
{
  id v8;
  id v9;

  v8 = a3;
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "assertionClassForType:", a4), "assertionWithIdentifier:timeout:", v8, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HDSPAssertionManager takeAssertion:](self, "takeAssertion:", v9);
}

- (void)takeIndefiniteAssertionWithIdentifier:(id)a3 type:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = a3;
  objc_msgSend(v6, "distantFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceNow");
  v10 = v9;

  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "assertionClassForType:", a4), "assertionWithIdentifier:timeout:", v7, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[HDSPAssertionManager takeAssertion:](self, "takeAssertion:", v11);
}

- (void)takeAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
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
    v13 = v6;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Taking assertion with identifier %{public}@", buf, 0x16u);

  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __38__HDSPAssertionManager_takeAssertion___block_invoke;
  v10[3] = &unk_24D4E3680;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  -[HDSPAssertionManager _withLock:](self, "_withLock:", v10);

}

void __38__HDSPAssertionManager_takeAssertion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(v1, "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v1, v3);

}

+ (Class)assertionClassForType:(unint64_t)a3
{
  if (a3 == 1 || a3 == 2)
  {
    objc_opt_class();
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (Class)a1;
}

- (void)releaseAssertionWithIdentifier:(id)a3
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
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Releasing assertion with identifier %{public}@", buf, 0x16u);

  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__HDSPAssertionManager_releaseAssertionWithIdentifier___block_invoke;
  v8[3] = &unk_24D4E3680;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[HDSPAssertionManager _withLock:](self, "_withLock:", v8);

}

void __55__HDSPAssertionManager_releaseAssertionWithIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(v2, "releaseAssertion");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (id)activeAssertionIdentifiersOfType:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[HDSPAssertionManager _assertionsOfType:](self, "_assertionsOfType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __57__HDSPAssertionManager_activeAssertionIdentifiersOfType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (id)_assertionsOfType:(unint64_t)a3
{
  id v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__16;
  v10 = __Block_byref_object_dispose__16;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__HDSPAssertionManager__assertionsOfType___block_invoke;
  v5[3] = &unk_24D4E4BA8;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  -[HDSPAssertionManager _withLock:](self, "_withLock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __42__HDSPAssertionManager__assertionsOfType___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  objc_msgSend(*(id *)(a1[4] + 16), "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__HDSPAssertionManager__assertionsOfType___block_invoke_2;
  v7[3] = &unk_24D4E5768;
  v3 = a1[6];
  v7[4] = a1[4];
  v7[5] = v3;
  objc_msgSend(v2, "na_filter:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t __42__HDSPAssertionManager__assertionsOfType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "assertionClassForType:", *(_QWORD *)(a1 + 40));
  LOBYTE(a1) = objc_opt_isKindOfClass();

  return a1 & 1;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HDSPAssertionManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPAssertionManager _assertionsOfType:](self, "_assertionsOfType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v4, CFSTR("transactions"), &stru_24D4E68A0, 1);

  -[HDSPAssertionManager _assertionsOfType:](self, "_assertionsOfType:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v5, CFSTR("assertions"), &stru_24D4E68A0, 1);

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HDSPAssertionManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)diagnosticDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HDSPAssertionManager activeAssertionIdentifiersOfType:](self, "activeAssertionIdentifiersOfType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPAssertionManager activeAssertionIdentifiersOfType:](self, "activeAssertionIdentifiersOfType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Assertions: %@\nTransactions: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (os_unfair_lock_s)assertionsLock
{
  return self->_assertionsLock;
}

- (NSMutableDictionary)assertions
{
  return self->_assertions;
}

- (void)setAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_assertions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end
