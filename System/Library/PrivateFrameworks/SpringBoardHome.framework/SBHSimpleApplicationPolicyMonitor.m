@implementation SBHSimpleApplicationPolicyMonitor

- (void)registerApplication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable addObject:](self->_registeredApplications, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHSimpleApplicationPolicyMonitor policyMonitor](self, "policyMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__SBHSimpleApplicationPolicyMonitor_registerApplication___block_invoke;
  v10[3] = &unk_1E8D86F88;
  v11 = v5;
  v12 = v4;
  v8 = v4;
  v9 = v5;
  objc_msgSend(v6, "requestPoliciesForBundleIdentifiers:completionHandler:", v7, v10);

}

- (DMFApplicationPolicyMonitor)policyMonitor
{
  return self->_policyMonitor;
}

+ (SBHSimpleApplicationPolicyMonitor)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_307);
  return (SBHSimpleApplicationPolicyMonitor *)(id)sharedInstance_sharedInstance_0;
}

uint64_t __57__SBHSimpleApplicationPolicyMonitor_registerApplication___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateDeviceManagementPolicy:", *(_QWORD *)(a1 + 40));
}

void __57__SBHSimpleApplicationPolicyMonitor_registerApplication___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "integerValue");
  v4 = *(id *)(a1 + 40);
  BSDispatchMain();

}

void __51__SBHSimpleApplicationPolicyMonitor_sharedInstance__block_invoke()
{
  SBHSimpleApplicationPolicyMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(SBHSimpleApplicationPolicyMonitor);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

- (SBHSimpleApplicationPolicyMonitor)init
{
  SBHSimpleApplicationPolicyMonitor *v2;
  uint64_t v3;
  NSHashTable *registeredApplications;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  id v8;
  SBHSimpleApplicationPolicyMonitor *v9;
  uint64_t v10;
  DMFApplicationPolicyMonitor *policyMonitor;
  _QWORD v13[4];
  SBHSimpleApplicationPolicyMonitor *v14;
  objc_super v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v15.receiver = self;
  v15.super_class = (Class)SBHSimpleApplicationPolicyMonitor;
  v2 = -[SBHSimpleApplicationPolicyMonitor init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    registeredApplications = v2->_registeredApplications;
    v2->_registeredApplications = (NSHashTable *)v3;

    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v5 = (void *)getDMFApplicationPolicyMonitorClass_softClass;
    v20 = getDMFApplicationPolicyMonitorClass_softClass;
    v6 = MEMORY[0x1E0C809B0];
    if (!getDMFApplicationPolicyMonitorClass_softClass)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __getDMFApplicationPolicyMonitorClass_block_invoke;
      v16[3] = &unk_1E8D85AF8;
      v16[4] = &v17;
      __getDMFApplicationPolicyMonitorClass_block_invoke((uint64_t)v16);
      v5 = (void *)v18[3];
    }
    v7 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v17, 8);
    v8 = [v7 alloc];
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __41__SBHSimpleApplicationPolicyMonitor_init__block_invoke;
    v13[3] = &unk_1E8D84C50;
    v9 = v2;
    v14 = v9;
    v10 = objc_msgSend(v8, "initWithPolicyChangeHandler:", v13);
    policyMonitor = v9->_policyMonitor;
    v9->_policyMonitor = (DMFApplicationPolicyMonitor *)v10;

  }
  return v2;
}

uint64_t __41__SBHSimpleApplicationPolicyMonitor_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAllPolicies");
}

- (void)unregisterApplication:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_registeredApplications, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)updateAllPolicies
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_registeredApplications, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "setObject:forKey:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHSimpleApplicationPolicyMonitor policyMonitor](self, "policyMonitor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __54__SBHSimpleApplicationPolicyMonitor_updateAllPolicies__block_invoke;
  v16[3] = &unk_1E8D86FB0;
  v17 = v5;
  v15 = v5;
  objc_msgSend(v14, "requestPoliciesForBundleIdentifiers:completionHandler:", v13, v16);

}

void __54__SBHSimpleApplicationPolicyMonitor_updateAllPolicies__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  BSDispatchMain();

}

void __54__SBHSimpleApplicationPolicyMonitor_updateAllPolicies__block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__SBHSimpleApplicationPolicyMonitor_updateAllPolicies__block_invoke_3;
  v2[3] = &unk_1E8D86C00;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v2);

}

void __54__SBHSimpleApplicationPolicyMonitor_updateAllPolicies__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "objectForKey:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v7, "updateDeviceManagementPolicy:", v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyMonitor, 0);
  objc_storeStrong((id *)&self->_registeredApplications, 0);
}

@end
