@implementation PBUIReplicaSourceObserverBox

- (id)registerSourceObserver:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "succinctDescriptionForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSCompoundAssertion acquireForReason:withContext:](self->_sharedUpdateAssertion, "acquireForReason:withContext:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (PBUIReplicaSourceObserverBox)init
{
  return -[PBUIReplicaSourceObserverBox initWithIdentifier:](self, "initWithIdentifier:", CFSTR("unknown ReplicaSourceObserverBox"));
}

- (PBUIReplicaSourceObserverBox)initWithIdentifier:(id)a3 activeStateDidChangeHandler:(id)a4
{
  id v6;
  id v7;
  PBUIReplicaSourceObserverBox *v8;
  PBUIReplicaSourceObserverBox *v9;
  void *v10;
  uint64_t v11;
  BSCompoundAssertion *sharedUpdateAssertion;
  uint64_t v13;
  BSCompoundAssertion *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PBUIReplicaSourceObserverBox;
  v8 = -[PBUIReplicaSourceObserverBox init](&v20, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_wasLastActive = 0;
    if (v7)
    {
      objc_initWeak(&location, v8);
      v10 = (void *)MEMORY[0x1E0D01718];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __79__PBUIReplicaSourceObserverBox_initWithIdentifier_activeStateDidChangeHandler___block_invoke;
      v16[3] = &unk_1E6B967D0;
      objc_copyWeak(&v18, &location);
      v17 = v7;
      objc_msgSend(v10, "assertionWithIdentifier:stateDidChangeHandler:", v6, v16);
      v11 = objc_claimAutoreleasedReturnValue();
      sharedUpdateAssertion = v9->_sharedUpdateAssertion;
      v9->_sharedUpdateAssertion = (BSCompoundAssertion *)v11;

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D01718], "assertionWithIdentifier:", v6);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v9->_sharedUpdateAssertion;
      v9->_sharedUpdateAssertion = (BSCompoundAssertion *)v13;

    }
  }

  return v9;
}

void __79__PBUIReplicaSourceObserverBox_initWithIdentifier_activeStateDidChangeHandler___block_invoke(uint64_t a1, void *a2)
{
  _BYTE *WeakRetained;
  _BYTE *v4;
  int v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[8];
    if (v5 != objc_msgSend(v6, "isActive"))
    {
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "isActive"));
      v4[8] = 1;
    }
  }

}

- (void)dealloc
{
  BSCompoundAssertion *sharedUpdateAssertion;
  BSCompoundAssertion *v4;
  objc_super v5;

  sharedUpdateAssertion = self->_sharedUpdateAssertion;
  if (sharedUpdateAssertion)
  {
    -[BSCompoundAssertion invalidate](sharedUpdateAssertion, "invalidate");
    v4 = self->_sharedUpdateAssertion;
    self->_sharedUpdateAssertion = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)PBUIReplicaSourceObserverBox;
  -[PBUIReplicaSourceObserverBox dealloc](&v5, sel_dealloc);
}

- (PBUIReplicaSourceObserverBox)initWithIdentifier:(id)a3
{
  return -[PBUIReplicaSourceObserverBox initWithIdentifier:activeStateDidChangeHandler:](self, "initWithIdentifier:activeStateDidChangeHandler:", a3, 0);
}

- (int64_t)effectiveStyle
{
  return 0;
}

- (void)invalidate
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  BSCompoundAssertion *sharedUpdateAssertion;
  int v7;
  void *v8;
  __int16 v9;
  PBUIReplicaSourceObserverBox *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PBUILogSnapshot();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1B71C0000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Invalidating", (uint8_t *)&v7, 0x16u);

  }
  -[BSCompoundAssertion invalidate](self->_sharedUpdateAssertion, "invalidate");
  sharedUpdateAssertion = self->_sharedUpdateAssertion;
  self->_sharedUpdateAssertion = 0;

}

- (void)setNeedsSourceUpdate
{
  PBUIReplicaSourceObserverBox *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  PBUIReplicaSourceObserverBox *v18;
  __int16 v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = self;
  v3 = -[PBUIReplicaSourceObserverBox countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        PBUILogSnapshot();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = (objc_class *)objc_opt_class();
          NSStringFromClass(v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v16 = v10;
          v17 = 2048;
          v18 = v2;
          v19 = 2114;
          v20 = v7;
          _os_log_impl(&dword_1B71C0000, v8, OS_LOG_TYPE_INFO, "<%{public}@:%p> Set source needs update for observer: %{public}@", buf, 0x20u);

        }
        objc_msgSend(v7, "setNeedsSourceUpdate");
      }
      v4 = -[PBUIReplicaSourceObserverBox countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v21, 16);
    }
    while (v4);
  }

}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  -[BSCompoundAssertion context](self->_sharedUpdateAssertion, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedUpdateAssertion, 0);
}

@end
