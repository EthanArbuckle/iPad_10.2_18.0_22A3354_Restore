@implementation TRINamespaceFactorSubscriptionSettings

+ (id)settingsWithKeyValueStore:(id)a3
{
  id v3;
  TRINamespaceFactorSubscriptionSettings *v4;

  v3 = a3;
  v4 = -[TRINamespaceFactorSubscriptionSettings initWithKeyValueStore:]([TRINamespaceFactorSubscriptionSettings alloc], "initWithKeyValueStore:", v3);

  return v4;
}

+ (id)keyForNamespaceSubscription:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.triald.namespace.assetSubscription"), a3);
}

- (TRINamespaceFactorSubscriptionSettings)initWithKeyValueStore:(id)a3
{
  id v5;
  TRINamespaceFactorSubscriptionSettings *v6;
  TRINamespaceFactorSubscriptionSettings *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRINamespaceFactorSubscriptionSettings;
  v6 = -[TRINamespaceFactorSubscriptionSettings init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_keyValueStore, a3);

  return v7;
}

- (id)subscribedFactorsForNamespaceName:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceFactorSubscriptionSettings.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

  }
  -[TRINamespaceFactorSubscriptionSettings keyValueStore](self, "keyValueStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRINamespaceFactorSubscriptionSettings keyForNamespaceSubscription:](TRINamespaceFactorSubscriptionSettings, "keyForNamespaceSubscription:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "blobForKey:usingTransaction:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3710];
    v10 = (void *)MEMORY[0x1D8232A5C]();
    v11 = objc_alloc(MEMORY[0x1E0C99E60]);
    v12 = objc_opt_class();
    v13 = (void *)objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v10);
    v20 = 0;
    objc_msgSend(v9, "unarchivedObjectOfClasses:fromData:error:", v13, v8, &v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v20;

    if (v14)
    {
      v16 = v14;
    }
    else
    {
      TRILogCategory_Server();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v15;
        _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "Unable to unarchive subscription object. Return empty array instead. Error: %{public}@", buf, 0xCu);
      }

      v16 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v16 = (id)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

- (BOOL)setSubscriptionWithFactorNames:(id)a3 inNamespaceName:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceFactorSubscriptionSettings.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorNames"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRINamespaceFactorSubscriptionSettings.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("namespaceName"));

LABEL_3:
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 0, &v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v24;
  TRILogCategory_Server();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR(","));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v18;
      v27 = 2114;
      v28 = v11;
      _os_log_impl(&dword_1D207F000, v17, OS_LOG_TYPE_DEFAULT, "Set subscription [%{public}@] in namespace '%{public}@'", buf, 0x16u);

    }
    -[TRINamespaceFactorSubscriptionSettings keyValueStore](self, "keyValueStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRINamespaceFactorSubscriptionSettings keyForNamespaceSubscription:](TRINamespaceFactorSubscriptionSettings, "keyForNamespaceSubscription:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBlob:forKey:usingTransaction:", v14, v20, 0);

  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v15;
      _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "Unable to archive subscription object. Error: %{public}@", buf, 0xCu);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v15);
  }

  return v14 != 0;
}

- (TRIKVStore)keyValueStore
{
  return self->_keyValueStore;
}

- (void)setKeyValueStore:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueStore, 0);
}

@end
