@implementation ICURLBagMonitor

- (id)_init
{
  ICURLBagMonitor *v2;
  uint64_t v3;
  ICUserIdentityStore *identityStore;
  NSMutableDictionary *v5;
  NSMutableDictionary *observers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICURLBagMonitor;
  v2 = -[ICURLBagMonitor init](&v8, sel_init);
  if (v2)
  {
    +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
    v3 = objc_claimAutoreleasedReturnValue();
    identityStore = v2->_identityStore;
    v2->_identityStore = (ICUserIdentityStore *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observers = v2->_observers;
    v2->_observers = v5;

  }
  return v2;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  objc_super v4;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  -[ICURLBagMonitor _endObservingBag](self, "_endObservingBag");
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)ICURLBagMonitor;
  -[ICURLBagMonitor dealloc](&v4, sel_dealloc);
}

- (id)_description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  os_unfair_lock_assert_owner(&self->_lock);
  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  v7 = -[NSMutableDictionary count](self->_observers, "count");
  if (v7)
    objc_msgSend(v6, "appendFormat:", CFSTR("; observersCount = %lu"), v7);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  -[ICURLBagMonitor _description](self, "_description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (ICURLBag)bag
{
  os_unfair_lock_s *p_lock;
  ICURLBag *v4;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  v4 = self->_bag;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)beginObservingBagWithHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  NSMutableDictionary *observers;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(p_lock);
  observers = self->_observers;
  v8 = (void *)objc_msgSend(v5, "copy");

  v9 = (void *)MEMORY[0x1A1AFA8D0](v8);
  -[NSMutableDictionary setObject:forKey:](observers, "setObject:forKey:", v9, v6);

  v10 = -[NSMutableDictionary count](self->_observers, "count");
  v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[ICURLBagMonitor _description](self, "_description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v12;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Registered new bag observer with token: %{public}@.", buf, 0x16u);

  }
  if (v10 == 1)
  {
    -[ICURLBagMonitor _beginObservingBag](self, "_beginObservingBag");
    os_unfair_lock_unlock(p_lock);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __48__ICURLBagMonitor_beginObservingBagWithHandler___block_invoke;
    v14[3] = &unk_1E43913D8;
    v14[4] = self;
    -[ICURLBagMonitor _requestBagWithPolicy:completionHandler:](self, "_requestBagWithPolicy:completionHandler:", 0, v14);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
  return v6;
}

- (void)endObservingBagWithToken:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary removeObjectForKey:](self->_observers, "removeObjectForKey:", v4);
  v5 = -[NSMutableDictionary count](self->_observers, "count");
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[ICURLBagMonitor _description](self, "_description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Removed bag observer with token: %{public}@.", (uint8_t *)&v8, 0x16u);

  }
  if (!v5)
    -[ICURLBagMonitor _endObservingBag](self, "_endObservingBag");
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_invalidateBagExpirationTimer
{
  NSObject *bagExpirationTimer;
  OS_dispatch_source *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  bagExpirationTimer = self->_bagExpirationTimer;
  if (bagExpirationTimer)
  {
    dispatch_source_cancel(bagExpirationTimer);
    v4 = self->_bagExpirationTimer;
    self->_bagExpirationTimer = 0;

    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[ICURLBagMonitor _description](self, "_description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidated timer for bag expiration.", (uint8_t *)&v7, 0xCu);

    }
  }
}

- (void)_scheduleBagExpirationTimerForDate:(id)a3
{
  id v4;
  double v5;
  double v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  NSObject *v11;
  OS_dispatch_source *v12;
  OS_dispatch_source *bagExpirationTimer;
  NSObject *v14;
  dispatch_time_t v15;
  NSObject *v16;
  _QWORD handler[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[ICURLBagMonitor _invalidateBagExpirationTimer](self, "_invalidateBagExpirationTimer");
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6 >= 0.00000011920929)
  {
    if (v8)
    {
      -[ICURLBagMonitor _description](self, "_description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v10;
      v21 = 2114;
      v22 = v4;
      v23 = 2048;
      v24 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Scheduling timer for bag expiration for date %{public}@; i.e. for %.1f seconds.",
        buf,
        0x20u);

    }
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v11);
    bagExpirationTimer = self->_bagExpirationTimer;
    self->_bagExpirationTimer = v12;

    v14 = self->_bagExpirationTimer;
    v15 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    objc_initWeak((id *)buf, self);
    v16 = self->_bagExpirationTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __54__ICURLBagMonitor__scheduleBagExpirationTimerForDate___block_invoke;
    handler[3] = &unk_1E4391400;
    objc_copyWeak(&v18, (id *)buf);
    dispatch_source_set_event_handler(v16, handler);
    dispatch_resume((dispatch_object_t)self->_bagExpirationTimer);
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v8)
    {
      -[ICURLBagMonitor _description](self, "_description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v9;
      v21 = 2114;
      v22 = v4;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Bag expiration date is in the past: %{public}@. Not scheduling timer for bag expiration.", buf, 0x16u);

    }
  }

}

- (void)_handleBagExpirationTimerFired
{
  -[ICURLBagMonitor _requestBagWithPolicy:completionHandler:](self, "_requestBagWithPolicy:completionHandler:", 1, 0);
}

- (void)_beginObservingBag
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ICURLBagMonitor _description](self, "_description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning to observe bag.", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleUserIdentityStoreDidChange_, CFSTR("ICUserIdentityStoreDidChangeNotification"), self->_identityStore);
  -[ICURLBag expirationDate](self->_bag, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[ICURLBagMonitor _scheduleBagExpirationTimerForDate:](self, "_scheduleBagExpirationTimerForDate:", v6);
  +[ICEnvironmentMonitor sharedMonitor](ICEnvironmentMonitor, "sharedMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerObserver:", self);

}

- (void)_endObservingBag
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("ICUserIdentityStoreDidChangeNotification"), self->_identityStore);
  -[ICURLBagMonitor _invalidateBagExpirationTimer](self, "_invalidateBagExpirationTimer");
  +[ICEnvironmentMonitor sharedMonitor](ICEnvironmentMonitor, "sharedMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterObserver:", self);

  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ICURLBagMonitor _description](self, "_description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopped observing bag.", (uint8_t *)&v7, 0xCu);

  }
}

- (void)_handleUserIdentityStoreDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  ICURLBagMonitor *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Handling %{public}@.", (uint8_t *)&v7, 0x16u);

  }
  -[ICURLBagMonitor _requestBagWithPolicy:completionHandler:](self, "_requestBagWithPolicy:completionHandler:", 1, 0);

}

- (void)_requestBagWithPolicy:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  char v7;
  const __CFString *v8;
  ICStoreRequestContext *v9;
  uint64_t v10;
  ICStoreRequestContext *v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  char v18;
  uint8_t buf[4];
  ICURLBagMonitor *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  if (a3 == 1)
  {
    v7 = 0;
    v8 = CFSTR("requireValidBag");
  }
  else if (a3)
  {
    v8 = 0;
    v7 = 0;
  }
  else
  {
    v7 = 1;
    v8 = CFSTR("allowExpiredBag");
  }
  v9 = [ICStoreRequestContext alloc];
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__ICURLBagMonitor__requestBagWithPolicy_completionHandler___block_invoke;
  v17[3] = &unk_1E438D280;
  v17[4] = self;
  v18 = v7;
  v11 = -[ICStoreRequestContext initWithBlock:](v9, "initWithBlock:", v17);
  v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2114;
    v22 = v8;
    _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting bag with policy %{public}@.", buf, 0x16u);
  }

  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __59__ICURLBagMonitor__requestBagWithPolicy_completionHandler___block_invoke_25;
  v15[3] = &unk_1E438D3F8;
  v15[4] = self;
  v16 = v6;
  v14 = v6;
  objc_msgSend(v13, "getBagForRequestContext:withCompletionHandler:", v11, v15);

}

- (void)_updateWithBag:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (!-[ICURLBag isEqual:](self->_bag, "isEqual:", v5))
  {
    objc_storeStrong((id *)&self->_bag, a3);
    v11 = (void *)-[NSMutableDictionary copy](self->_observers, "copy");
    v13 = objc_msgSend(v11, "count");
    v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[ICURLBagMonitor _description](self, "_description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serverCorrelationKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serverEnvironment");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      *(_DWORD *)buf = 138544642;
      v19 = "s";
      v25 = v15;
      if (v13 == 1)
        v19 = "";
      v26 = 2114;
      v27 = v5;
      v28 = 2114;
      v29 = v16;
      v30 = 2114;
      v31 = v17;
      v32 = 2048;
      v33 = v13;
      v34 = 2080;
      v35 = v19;
      _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Bag did change: %{public}@ (serverCorrelationKey: %{public}@; serverEnvironment: %{public}@). About "
        "to invoke %llu observation handler%s.",
        buf,
        0x3Eu);

    }
    goto LABEL_11;
  }
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[ICURLBagMonitor _description](self, "_description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v7;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Bag did not change. Skipping invoking observation handlers.", buf, 0xCu);

  }
  -[ICURLBag expirationDate](self->_bag, "expirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "expirationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "compare:", v9);

  v11 = 0;
  v12 = 0;
  if (v10 == -1)
  {
LABEL_11:
    objc_msgSend(v5, "expirationDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICURLBagMonitor _scheduleBagExpirationTimerForDate:](self, "_scheduleBagExpirationTimerForDate:", v20);

    v12 = v11;
  }
  os_unfair_lock_unlock(&self->_lock);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __34__ICURLBagMonitor__updateWithBag___block_invoke;
  v22[3] = &unk_1E438D2A8;
  v22[4] = self;
  v23 = v5;
  v21 = v5;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v22);

}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  int v6;
  NSObject *v7;
  int v8;
  ICURLBagMonitor *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  v6 = objc_msgSend(v5, "isRemoteServerLikelyReachable");

  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = self;
    v10 = 1024;
    v11 = v6;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Handling network reachability change; isRemoteServerLikelyReachable = %{BOOL}u.",
      (uint8_t *)&v8,
      0x12u);
  }

  if (v6)
    -[ICURLBagMonitor _requestBagWithPolicy:completionHandler:](self, "_requestBagWithPolicy:completionHandler:", 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_identityStore, 0);
  objc_storeStrong((id *)&self->_bagExpirationTimer, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

void __34__ICURLBagMonitor__updateWithBag___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, _QWORD);
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = 138543874;
    v11 = v8;
    v12 = 2114;
    v13 = v5;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Invoking observation handler with token %{public}@; bag = %{public}@.",
      (uint8_t *)&v10,
      0x20u);
  }

  v6[2](v6, *(_QWORD *)(a1 + 40));
}

void __59__ICURLBagMonitor__requestBagWithPolicy_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  ICURLResponseAuthenticationProvider *v6;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v4 = a2;
  objc_msgSend(v4, "setIdentityStore:", v3);
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentity:", v5);

  objc_msgSend(v4, "setAllowsExpiredBags:", *(unsigned __int8 *)(a1 + 40));
  v6 = -[ICURLResponseAuthenticationProvider initWithUserInteractionLevel:]([ICURLResponseAuthenticationProvider alloc], "initWithUserInteractionLevel:", 1);
  objc_msgSend(v4, "setAuthenticationProvider:", v6);

}

void __59__ICURLBagMonitor__requestBagWithPolicy_completionHandler___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateWithBag:", v5);
  }
  else
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch bag with error: %{public}@.", (uint8_t *)&v10, 0x16u);
    }

  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(void))(v9 + 16))();

}

void __54__ICURLBagMonitor__scheduleBagExpirationTimerForDate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138543362;
    v4 = WeakRetained;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Bag expiration timer did fire.", (uint8_t *)&v3, 0xCu);
  }

  objc_msgSend(WeakRetained, "_handleBagExpirationTimerFired");
}

uint64_t __48__ICURLBagMonitor_beginObservingBagWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestBagWithPolicy:completionHandler:", 1, 0);
}

+ (ICURLBagMonitor)sharedBagMonitor
{
  if (sharedBagMonitor_sSharedBagMonitorOnceToken != -1)
    dispatch_once(&sharedBagMonitor_sSharedBagMonitorOnceToken, &__block_literal_global_21652);
  return (ICURLBagMonitor *)(id)sharedBagMonitor_sSharedBagMonitor;
}

void __35__ICURLBagMonitor_sharedBagMonitor__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ICURLBagMonitor _init]([ICURLBagMonitor alloc], "_init");
  v1 = (void *)sharedBagMonitor_sSharedBagMonitor;
  sharedBagMonitor_sSharedBagMonitor = (uint64_t)v0;

}

@end
