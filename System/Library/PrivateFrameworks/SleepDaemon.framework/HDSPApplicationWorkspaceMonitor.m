@implementation HDSPApplicationWorkspaceMonitor

- (HDSPApplicationWorkspaceMonitor)init
{
  HDSPApplicationWorkspaceMonitor *v2;
  HKSPObserverSet *v3;
  HKSPObserverSet *observers;
  HDSPApplicationWorkspaceMonitor *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDSPApplicationWorkspaceMonitor;
  v2 = -[HDSPApplicationWorkspaceMonitor init](&v7, sel_init);
  if (v2)
  {
    v3 = (HKSPObserverSet *)objc_alloc_init(MEMORY[0x24BEA98C8]);
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = v2;
  }

  return v2;
}

- (void)addObserver:(id)a3
{
  void *v4;
  char v5;

  v5 = 0;
  -[HKSPObserverSet addObserver:wasFirst:](self->_observers, "addObserver:wasFirst:", a3, &v5);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:", self);

  }
}

- (void)removeObserver:(id)a3
{
  void *v4;
  char v5;

  v5 = 0;
  -[HKSPObserverSet removeObserver:wasLast:](self->_observers, "removeObserver:wasLast:", a3, &v5);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self);

  }
}

- (BOOL)isApplicationInstalled:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDC1540];
  v4 = a3;
  v14 = 0;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, &v14);

  v6 = v14;
  if (!v5)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2114;
      v18 = v6;
      v13 = v12;
      _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to create application record: %{public}@.", buf, 0x16u);

    }
    goto LABEL_7;
  }
  objc_msgSend(v5, "applicationState");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject isValid](v7, "isValid"))
  {
LABEL_7:
    v9 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v5, "applicationState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isInstalled") & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v5, "applicationState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isPlaceholder");

  }
LABEL_10:

  return v9;
}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  HKSPObserverSet *observers;
  id v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = MEMORY[0x24BDAC760];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        observers = self->_observers;
        v13[0] = v8;
        v13[1] = 3221225472;
        v13[2] = __58__HDSPApplicationWorkspaceMonitor_applicationsDidInstall___block_invoke;
        v13[3] = &unk_24D4E4AF8;
        v14 = v10;
        v12 = v10;
        -[HKSPObserverSet enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v13);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

void __58__HDSPApplicationWorkspaceMonitor_applicationsDidInstall___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "observedApplicationBundleIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v4)
    objc_msgSend(v5, "observedApplicationDidInstall:", *(_QWORD *)(a1 + 32));

}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  HKSPObserverSet *observers;
  id v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = MEMORY[0x24BDAC760];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        observers = self->_observers;
        v13[0] = v8;
        v13[1] = 3221225472;
        v13[2] = __60__HDSPApplicationWorkspaceMonitor_applicationsDidUninstall___block_invoke;
        v13[3] = &unk_24D4E4AF8;
        v14 = v10;
        v12 = v10;
        -[HKSPObserverSet enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v13);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

void __60__HDSPApplicationWorkspaceMonitor_applicationsDidUninstall___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "observedApplicationBundleIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v4)
    objc_msgSend(v5, "observedApplicationDidUninstall:", *(_QWORD *)(a1 + 32));

}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
