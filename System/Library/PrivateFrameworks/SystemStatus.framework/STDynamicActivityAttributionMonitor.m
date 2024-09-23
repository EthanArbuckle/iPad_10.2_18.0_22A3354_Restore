@implementation STDynamicActivityAttributionMonitor

- (STDynamicActivityAttributionMonitor)init
{
  void *v3;
  STDynamicActivityAttributionMonitor *v4;

  +[STDynamicAttributionXPCServerHandle sharedMachServiceServerHandle](STDynamicAttributionXPCServerHandle, "sharedMachServiceServerHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[STDynamicActivityAttributionMonitor initWithServerHandle:](self, "initWithServerHandle:", v3);

  return v4;
}

- (STDynamicActivityAttributionMonitor)initWithServerHandle:(id)a3
{
  id v5;
  STDynamicActivityAttributionMonitor *v6;
  STDynamicActivityAttributionMonitor *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *lock_attributions;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STDynamicActivityAttributionMonitor;
  v6 = -[STDynamicActivityAttributionMonitor init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_lock_server, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lock_attributions = v7->_lock_attributions;
    v7->_lock_attributions = v8;

  }
  return v7;
}

- (void)dealloc
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  STDynamicActivityAttributionMonitor *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->_lock_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalidate must be called before this object is released"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v10 = v5;
      v11 = 2114;
      v12 = v7;
      v13 = 2048;
      v14 = self;
      v15 = 2114;
      v16 = CFSTR("STDynamicActivityAttributionMonitor.m");
      v17 = 1024;
      v18 = 47;
      v19 = 2114;
      v20 = v4;
      _os_log_error_impl(&dword_1D12C7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D12FE93CLL);
  }
  v8.receiver = self;
  v8.super_class = (Class)STDynamicActivityAttributionMonitor;
  -[STDynamicActivityAttributionMonitor dealloc](&v8, sel_dealloc);
}

- (void)activate
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  STDynamicActivityAttributionServerHandle *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  STDynamicActivityAttributionMonitor *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("can't re-activate an invalidated monitor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v11 = v6;
      v12 = 2114;
      v13 = v8;
      v14 = 2048;
      v15 = self;
      v16 = 2114;
      v17 = CFSTR("STDynamicActivityAttributionMonitor.m");
      v18 = 1024;
      v19 = 52;
      v20 = 2114;
      v21 = v5;
      _os_log_error_impl(&dword_1D12C7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D12FEABCLL);
  }
  v9 = self->_lock_server;
  os_unfair_lock_unlock(p_lock);
  -[STDynamicActivityAttributionServerHandle subscribeToUpdates:](v9, "subscribeToUpdates:", self);

}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *lock_attributions;
  id lock_handler;
  STDynamicActivityAttributionServerHandle *lock_server;
  STDynamicActivityAttributionServerHandle *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    v7 = 0;
  }
  else
  {
    v7 = self->_lock_server;
    self->_lock_invalidated = 1;
    lock_attributions = self->_lock_attributions;
    self->_lock_attributions = 0;

    lock_handler = self->_lock_handler;
    self->_lock_handler = 0;

    lock_server = self->_lock_server;
    self->_lock_server = 0;

  }
  os_unfair_lock_unlock(p_lock);
  -[STDynamicActivityAttributionServerHandle unsubscribeFromUpdates:](v7, "unsubscribeFromUpdates:", self);

}

- (id)handler
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)MEMORY[0x1D17E6508](self->_lock_handler);
  os_unfair_lock_unlock(p_lock);
  v5 = (void *)MEMORY[0x1D17E6508](v4);

  return v5;
}

- (void)setHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  id lock_handler;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (void *)objc_msgSend(v5, "copy");

  lock_handler = self->_lock_handler;
  self->_lock_handler = v6;

  os_unfair_lock_unlock(p_lock);
}

- (id)currentAttributions
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary allValues](self->_lock_attributions, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)attributionForClient:(id *)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *lock_attributions;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_attributions = self->_lock_attributions;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", BSVersionedPIDForAuditToken(), *(_QWORD *)a3->var0, *(_QWORD *)&a3->var0[2], *(_QWORD *)&a3->var0[4], *(_QWORD *)&a3->var0[6]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](lock_attributions, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)attributionForAttribution:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD v20[2];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "auditToken");
  else
    memset(v20, 0, sizeof(v20));
  -[STDynamicActivityAttributionMonitor attributionForClient:](self, "attributionForClient:", v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = objc_msgSend(v5, "pid");
    if (v7 < 1)
    {
      v6 = 0;
    }
    else
    {
      v8 = v7;
      os_unfair_lock_lock(&self->_lock);
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      -[NSMutableDictionary allKeys](self->_lock_attributions, "allKeys", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            if (v8 == objc_msgSend(v14, "unsignedLongLongValue"))
            {
              -[NSMutableDictionary objectForKey:](self->_lock_attributions, "objectForKey:", v14);
              v6 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_16;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
          if (v11)
            continue;
          break;
        }
      }
      v6 = 0;
LABEL_16:

      os_unfair_lock_unlock(&self->_lock);
    }
  }

  return v6;
}

- (void)currentAttributionsDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  os_unfair_lock_s *p_lock;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSMutableDictionary *lock_attributions;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  STDynamicActivityAttributionMonitor *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1)
    dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_34);
  if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
  {
    STSystemStatusLogDynamicAttribution();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = self;
      v25 = 2112;
      v26 = v4;
      _os_log_impl(&dword_1D12C7000, v5, OS_LOG_TYPE_DEFAULT, "%@: Attributions did change: %@", buf, 0x16u);
    }

  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary removeAllObjects](self->_lock_attributions, "removeAllObjects");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        lock_attributions = self->_lock_attributions;
        v14 = (void *)MEMORY[0x1E0CB37E8];
        if (v12)
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "clientAuditToken");
        objc_msgSend(v14, "numberWithLongLong:", BSVersionedPIDForAuditToken());
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](lock_attributions, "setObject:forKey:", v12, v15);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v16 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E6508](self->_lock_handler);
  -[NSMutableDictionary allValues](self->_lock_attributions, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (v16)
    ((void (**)(_QWORD, void *))v16)[2](v16, v17);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_attributions, 0);
  objc_storeStrong((id *)&self->_lock_server, 0);
  objc_storeStrong(&self->_lock_handler, 0);
}

@end
