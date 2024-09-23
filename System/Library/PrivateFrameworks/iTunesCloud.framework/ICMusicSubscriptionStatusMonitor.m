@implementation ICMusicSubscriptionStatusMonitor

- (id)description
{
  os_unfair_lock_s *p_lock;
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v4 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("<%@: %p"), v6, self);

  -[ICUserIdentityContext identity](self->_identityContext, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("; identity = %@"), v8);

  -[ICUserIdentityContext identityStore](self->_identityContext, "identityStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "identityStoreStyle"))
    objc_msgSend(v7, "appendFormat:", CFSTR("; identityStore = %@"), v9);
  os_unfair_lock_lock(p_lock);
  v10 = -[NSMutableDictionary count](self->_observers, "count");
  os_unfair_lock_unlock(p_lock);
  if (v10)
    objc_msgSend(v7, "appendFormat:", CFSTR("; observersCount = %lu"), v10);
  objc_msgSend(v7, "appendString:", CFSTR(">"));

  return v7;
}

- (ICMusicSubscriptionStatus)subscriptionStatus
{
  return self->_subscriptionStatus;
}

void __91__ICMusicSubscriptionStatusMonitor__requestSubscriptionStatusWithCachingPolicy_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  ICStoreURLResponseAuthenticationProvider *v6;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  objc_msgSend(v3, "identityStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentityStore:", v5);

  objc_msgSend(v4, "setIdentity:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setAllowsExpiredBags:", 1);
  v6 = -[ICURLResponseAuthenticationProvider initWithUserInteractionLevel:]([ICStoreURLResponseAuthenticationProvider alloc], "initWithUserInteractionLevel:", 1);
  objc_msgSend(v4, "setAuthenticationProvider:", v6);

}

+ (id)sharedMonitorForIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sharedMonitorForIdentity:identityStore:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)endObservingSubscriptionStatusWithToken:(id)a3
{
  id v4;
  uint64_t v5;
  NSNumber *DSID;
  NSObject *v7;
  void *v8;
  int v9;
  ICMusicSubscriptionStatusMonitor *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary removeObjectForKey:](self->_observers, "removeObjectForKey:", v4);
  v5 = -[NSMutableDictionary count](self->_observers, "count");
  if (!v5)
  {
    DSID = self->_DSID;
    self->_DSID = 0;

  }
  os_unfair_lock_unlock(&self->_lock);
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543874;
    v10 = self;
    v11 = 2114;
    v12 = v4;
    v13 = 1024;
    v14 = v5 == 0;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Removed subscription status observer with token: %{public}@. wasLastObserver=%{BOOL}u", (uint8_t *)&v9, 0x1Cu);
  }

  if (!v5)
    -[ICMusicSubscriptionStatusMonitor _endObservingSubscriptionStatus](self, "_endObservingSubscriptionStatus");
  objc_msgSend((id)objc_opt_class(), "_sharedInstanceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "decrementUsageCountForKey:", self->_identityContext);

}

- (id)beginObservingSubscriptionStatusWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *observers;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSNumber *v13;
  id v14;
  NSNumber *DSID;
  NSObject *v16;
  NSObject *v17;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  ICMusicSubscriptionStatusMonitor *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_sharedInstanceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "incrementUsageCountForKey:", self->_identityContext);

  -[ICMusicSubscriptionStatusMonitor _effectiveIdentityForRequestingSubscriptionStatus](self, "_effectiveIdentityForRequestingSubscriptionStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  observers = self->_observers;
  v9 = (void *)objc_msgSend(v4, "copy");

  v10 = (void *)MEMORY[0x1A1AFA8D0](v9);
  -[NSMutableDictionary setObject:forKey:](observers, "setObject:forKey:", v10, v7);

  v11 = -[NSMutableDictionary count](self->_observers, "count");
  if (v11 == 1)
  {
    -[ICUserIdentityContext identityStore](self->_identityContext, "identityStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v12, "DSIDForUserIdentity:outError:", v6, &v20);
    v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v20;
    DSID = self->_DSID;
    self->_DSID = v13;

  }
  else
  {
    v14 = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  v16 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v22 = self;
    v23 = 2114;
    v24 = v7;
    _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Registered new subscription status observer with token: %{public}@.", buf, 0x16u);
  }

  if (v14)
  {
    v17 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v22 = self;
      v23 = 2112;
      v24 = v6;
      v25 = 2114;
      v26 = v14;
      _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Encountered unexpected error while resolving DSID for effective user identity %@: %{public}@.", buf, 0x20u);
    }

  }
  if (v11 == 1)
  {
    -[ICMusicSubscriptionStatusMonitor _beginObservingSubscriptionStatus](self, "_beginObservingSubscriptionStatus");
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __80__ICMusicSubscriptionStatusMonitor_beginObservingSubscriptionStatusWithHandler___block_invoke;
    v19[3] = &unk_1E43913D8;
    v19[4] = self;
    -[ICMusicSubscriptionStatusMonitor _requestSubscriptionStatusWithCachingPolicy:completion:](self, "_requestSubscriptionStatusWithCachingPolicy:completion:", 2, v19);
  }

  return v7;
}

- (id)_effectiveIdentityForRequestingSubscriptionStatus
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;

  -[ICUserIdentityContext identity](self->_identityContext, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");
  if (v3 == 3)
  {
    +[ICUserIdentity activeLockerAccount](ICUserIdentity, "activeLockerAccount");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v3 == 2)
  {
    +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v2;
  }
  v5 = v4;

  return v5;
}

+ (id)sharedMonitorForIdentity:(id)a3 identityStore:(id)a4
{
  id v6;
  id v7;
  ICUserIdentityContext *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[ICUserIdentityContext initWithIdentity:identityStore:]([ICUserIdentityContext alloc], "initWithIdentity:identityStore:", v7, v6);

  objc_msgSend(a1, "_sharedInstanceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sharedInstanceForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_sharedInstanceManager
{
  if (_sharedInstanceManager_sSharedInstanceManagerOnceToken != -1)
    dispatch_once(&_sharedInstanceManager_sSharedInstanceManagerOnceToken, &__block_literal_global_32634);
  return (id)_sharedInstanceManager_sSharedInstanceManager;
}

id __58__ICMusicSubscriptionStatusMonitor__sharedInstanceManager__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  v3 = -[ICMusicSubscriptionStatusMonitor _initWithIdentityContext:]([ICMusicSubscriptionStatusMonitor alloc], "_initWithIdentityContext:", v2);

  return v3;
}

- (id)_initWithIdentityContext:(id)a3
{
  id v5;
  ICMusicSubscriptionStatusMonitor *v6;
  ICMusicSubscriptionStatusMonitor *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *observers;
  NSArray *notificationHandlers;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  ICMusicSubscriptionStatusMonitor *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICMusicSubscriptionStatusMonitor;
  v6 = -[ICMusicSubscriptionStatusMonitor init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_identityContext, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observers = v7->_observers;
    v7->_observers = v8;

    notificationHandlers = v7->_notificationHandlers;
    v7->_notificationHandlers = 0;

    v11 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v7;
      _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ was initialized.", buf, 0xCu);
    }

  }
  return v7;
}

- (void)_beginObservingSubscriptionStatus
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  ICMusicSubscriptionStatusMonitor *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = self;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning to observe subscription status.", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  +[ICMusicSubscriptionStatusController sharedStatusController](ICMusicSubscriptionStatusController, "sharedStatusController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __69__ICMusicSubscriptionStatusMonitor__beginObservingSubscriptionStatus__block_invoke;
  v18[3] = &unk_1E4390340;
  objc_copyWeak(&v19, (id *)buf);
  objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", CFSTR("ICMusicSubscriptionStatusDidChangeNotification"), v7, 0, v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

  -[ICUserIdentityContext identityStore](self->_identityContext, "identityStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  v14 = 3221225472;
  v15 = __69__ICMusicSubscriptionStatusMonitor__beginObservingSubscriptionStatus__block_invoke_2;
  v16 = &unk_1E4390340;
  objc_copyWeak(&v17, (id *)buf);
  objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", CFSTR("ICUserIdentityStoreDidChangeNotification"), v10, 0, &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v11, v13, v14, v15, v16);

  os_unfair_lock_lock(p_lock);
  objc_storeStrong((id *)&self->_notificationHandlers, v6);
  os_unfair_lock_unlock(p_lock);
  if (-[ICMusicSubscriptionStatusMonitor _isMonitoringSubscriptionStatusForAutoupdatingIdentity](self, "_isMonitoringSubscriptionStatusForAutoupdatingIdentity"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_ICMusicSubscriptionStatusMonitorHandleActiveUserIdentityDidChangeRemoteNotification, CFSTR("com.apple.itunescloudd.activeUserIdentityDidChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

}

- (void)_requestSubscriptionStatusWithCachingPolicy:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  ICStoreRequestContext *v8;
  uint64_t v9;
  id v10;
  ICStoreRequestContext *v11;
  ICMusicSubscriptionStatusRequest *v12;
  const __CFString *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  ICMusicSubscriptionStatusRequest *v18;
  _QWORD v19[5];
  ICMusicSubscriptionStatusRequest *v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  ICMusicSubscriptionStatusMonitor *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  ICMusicSubscriptionStatusRequest *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[ICMusicSubscriptionStatusMonitor _effectiveIdentityForRequestingSubscriptionStatus](self, "_effectiveIdentityForRequestingSubscriptionStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [ICStoreRequestContext alloc];
  v9 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __91__ICMusicSubscriptionStatusMonitor__requestSubscriptionStatusWithCachingPolicy_completion___block_invoke;
  v23[3] = &unk_1E4390368;
  v23[4] = self;
  v10 = v7;
  v24 = v10;
  v11 = -[ICStoreRequestContext initWithBlock:](v8, "initWithBlock:", v23);
  v12 = -[ICMusicSubscriptionStatusRequest initWithStoreRequestContext:]([ICMusicSubscriptionStatusRequest alloc], "initWithStoreRequestContext:", v11);
  -[ICMusicSubscriptionStatusRequest setAllowsFallbackToExpiredStatus:](v12, "setAllowsFallbackToExpiredStatus:", 1);
  -[ICMusicSubscriptionStatusRequest setAllowsFallbackToStatusNeedingReload:](v12, "setAllowsFallbackToStatusNeedingReload:", 1);
  -[ICMusicSubscriptionStatusRequest setCarrierBundleProvisioningStyle:](v12, "setCarrierBundleProvisioningStyle:", 1);
  if (a3 == 2)
  {
    -[ICMusicSubscriptionStatusRequest setShouldReturnLastKnownStatusOnly:](v12, "setShouldReturnLastKnownStatusOnly:", 1);
    v13 = CFSTR("required");
  }
  else if (a3 == 1)
  {
    -[ICMusicSubscriptionStatusRequest setShouldIgnoreCache:](v12, "setShouldIgnoreCache:", 1);
    v13 = CFSTR("restricted");
  }
  else if (a3)
  {
    v13 = 0;
  }
  else
  {
    v13 = CFSTR("allowed");
  }
  v14 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v26 = self;
    v27 = 2114;
    v28 = v13;
    v29 = 2114;
    v30 = v12;
    _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting subscription status with caching %{public}@, using %{public}@.", buf, 0x20u);
  }

  +[ICMusicSubscriptionStatusController sharedStatusController](ICMusicSubscriptionStatusController, "sharedStatusController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __91__ICMusicSubscriptionStatusMonitor__requestSubscriptionStatusWithCachingPolicy_completion___block_invoke_35;
  v19[3] = &unk_1E4390390;
  v19[4] = self;
  v20 = v12;
  v21 = v10;
  v22 = v6;
  v16 = v6;
  v17 = v10;
  v18 = v12;
  objc_msgSend(v15, "performSubscriptionStatusRequest:withCompletionHandler:", v18, v19);

}

- (BOOL)_isMonitoringSubscriptionStatusForAutoupdatingIdentity
{
  void *v2;
  uint64_t v3;

  -[ICUserIdentityContext identity](self->_identityContext, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return (v3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)_updateWithSubscriptionStatus:(id)a3
{
  ICMusicSubscriptionStatus *v5;
  ICMusicSubscriptionStatus *v6;
  ICMusicSubscriptionStatus *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  _QWORD v14[5];
  ICMusicSubscriptionStatus *v15;
  uint8_t buf[4];
  ICMusicSubscriptionStatusMonitor *v17;
  __int16 v18;
  ICMusicSubscriptionStatus *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (ICMusicSubscriptionStatus *)a3;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_subscriptionStatus;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[ICMusicSubscriptionStatus isEqual:](v6, "isEqual:", v5);

    if (!v8)
    {
      objc_storeStrong((id *)&self->_subscriptionStatus, a3);
      v9 = (void *)-[NSMutableDictionary copy](self->_observers, "copy");
      os_unfair_lock_unlock(&self->_lock);
      v10 = objc_msgSend(v9, "count");
      v11 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = "s";
        *(_DWORD *)buf = 138544130;
        v18 = 2114;
        v17 = self;
        if (v10 == 1)
          v12 = "";
        v19 = v5;
        v20 = 2048;
        v21 = v10;
        v22 = 2080;
        v23 = v12;
        _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Subscription status did change: %{public}@. About to invoke %llu observation handler%s.", buf, 0x2Au);
      }

      if (v10)
      {
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __66__ICMusicSubscriptionStatusMonitor__updateWithSubscriptionStatus___block_invoke;
        v14[3] = &unk_1E43903B8;
        v14[4] = self;
        v15 = v5;
        objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v14);

      }
      goto LABEL_13;
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  v13 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = self;
    _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Subscription status did not change. Skipping invoking observation handlers.", buf, 0xCu);
  }

  v9 = 0;
LABEL_13:

}

uint64_t __80__ICMusicSubscriptionStatusMonitor_beginObservingSubscriptionStatusWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestSubscriptionStatusWithCachingPolicy:completion:", 0, 0);
}

void __58__ICMusicSubscriptionStatusMonitor__sharedInstanceManager__block_invoke()
{
  ICKeyedSharedInstanceManager *v0;
  void *v1;

  v0 = -[ICKeyedSharedInstanceManager initWithInstantiationHandler:]([ICKeyedSharedInstanceManager alloc], "initWithInstantiationHandler:", &__block_literal_global_18_32636);
  v1 = (void *)_sharedInstanceManager_sSharedInstanceManager;
  _sharedInstanceManager_sSharedInstanceManager = (uint64_t)v0;

}

void __66__ICMusicSubscriptionStatusMonitor__updateWithSubscriptionStatus___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = 138544130;
    v13 = v8;
    v14 = 2114;
    v15 = v5;
    v16 = 2114;
    v17 = v10;
    v18 = 2048;
    v19 = v11;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Invoking observation handler with token %{public}@; subscription status = <%{public}@: %p>",
      (uint8_t *)&v12,
      0x2Au);

  }
  (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  ICMusicSubscriptionStatusMonitor *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSMutableDictionary count](self->_observers, "count");
  -[NSMutableDictionary removeAllObjects](self->_observers, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v8 = self;
    v9 = 1024;
    v10 = v4 != 0;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ is being deallocated. wasObservingSubscriptionStatus=%{BOOL}u", buf, 0x12u);
  }

  if (v4)
    -[ICMusicSubscriptionStatusMonitor _endObservingSubscriptionStatus](self, "_endObservingSubscriptionStatus");
  v6.receiver = self;
  v6.super_class = (Class)ICMusicSubscriptionStatusMonitor;
  -[ICMusicSubscriptionStatusMonitor dealloc](&v6, sel_dealloc);
}

- (ICUserIdentity)identity
{
  return -[ICUserIdentityContext identity](self->_identityContext, "identity");
}

- (void)refreshSubscriptionStatus
{
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[ICMusicSubscriptionStatusMonitor _requestSubscriptionStatusWithCachingPolicy:completion:](self, "_requestSubscriptionStatusWithCachingPolicy:completion:", 1, 0);
}

- (void)_handleActiveUserIdentityDidChangeRemoteNotification
{
  NSObject *v3;
  int v4;
  ICMusicSubscriptionStatusMonitor *v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_not_owner(&self->_lock);
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543618;
    v5 = self;
    v6 = 2114;
    v7 = CFSTR("com.apple.itunescloudd.activeUserIdentityDidChangeNotification");
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Handling %{public}@. The active user identity has changed in the daemon. Checking to see if the subscription status has changed.", (uint8_t *)&v4, 0x16u);
  }

  -[ICMusicSubscriptionStatusMonitor _requestSubscriptionStatusWithCachingPolicy:completion:](self, "_requestSubscriptionStatusWithCachingPolicy:completion:", 0, 0);
}

- (void)_handleSubscriptionStatusDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  ICMusicSubscriptionStatusMonitor *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ICUserIdentityForMusicSubscriptionStatusDidChangeKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (-[ICMusicSubscriptionStatusMonitor _effectiveIdentityForRequestingSubscriptionStatus](self, "_effectiveIdentityForRequestingSubscriptionStatus"), v7 = (void *)objc_claimAutoreleasedReturnValue(), -[ICUserIdentityContext identityStore](self->_identityContext, "identityStore"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v7, "isEqualToIdentity:inStore:", v6, v8), v8, v7, (v9 & 1) == 0))
  {
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = self;
      v16 = 2114;
      v17 = v13;
      v18 = 2114;
      v19 = v6;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring %{public}@ because it specifically refers to a different user identity: %{public}@.", (uint8_t *)&v14, 0x20u);

    }
  }
  else
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Handling %{public}@.", (uint8_t *)&v14, 0x16u);

    }
    -[ICMusicSubscriptionStatusMonitor _requestSubscriptionStatusWithCachingPolicy:completion:](self, "_requestSubscriptionStatusWithCachingPolicy:completion:", 0, 0);
  }

}

- (void)_handleUserIdentityStoreDidChange:(id)a3
{
  id v4;
  NSNumber *v5;
  void *v6;
  NSNumber *v7;
  NSNumber *v8;
  NSObject *v9;
  void *v10;
  NSNumber *v11;
  NSNumber *v12;
  char v13;
  NSNumber *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  ICMusicSubscriptionStatus *subscriptionStatus;
  void *v20;
  id v21;
  uint8_t buf[4];
  ICMusicSubscriptionStatusMonitor *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  NSNumber *v27;
  __int16 v28;
  NSNumber *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[ICMusicSubscriptionStatusMonitor _effectiveIdentityForRequestingSubscriptionStatus](self, "_effectiveIdentityForRequestingSubscriptionStatus");
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  -[ICUserIdentityContext identityStore](self->_identityContext, "identityStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v6, "DSIDForUserIdentity:outError:", v5, &v21);
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v8 = (NSNumber *)v21;

  if (v8)
  {
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = self;
      v24 = 2114;
      v25 = v10;
      v26 = 2112;
      v27 = v5;
      v28 = 2114;
      v29 = v8;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Upon handling %{public}@, encountered unexpected error while resolving DSID for effective user identity %@: %{public}@.", buf, 0x2Au);

    }
  }
  os_unfair_lock_lock(&self->_lock);
  v11 = self->_DSID;
  if (v11 == v7)
  {

  }
  else
  {
    v12 = v11;
    v13 = -[NSNumber isEqual:](v11, "isEqual:", v7);

    if ((v13 & 1) == 0)
    {
      v14 = self->_DSID;
      objc_storeStrong((id *)&self->_DSID, v7);
      os_unfair_lock_unlock(&self->_lock);
      v15 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v23 = self;
        v24 = 2114;
        v25 = v16;
        v26 = 2112;
        v27 = v14;
        v28 = 2112;
        v29 = v7;
        _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Handling %{public}@. DSID changed from %@ to %@. Checking to see if the subscription status has changed.", buf, 0x2Au);

      }
      -[ICUserIdentityContext identity](self->_identityContext, "identity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "type") == 2)
      {
        v18 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v23 = self;
          _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: clearing current subscription status for dsid change", buf, 0xCu);
        }

        os_unfair_lock_lock(&self->_lock);
        subscriptionStatus = self->_subscriptionStatus;
        self->_subscriptionStatus = 0;

        os_unfair_lock_unlock(&self->_lock);
      }

      goto LABEL_17;
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v8)
  {
    v14 = 0;
LABEL_17:
    -[ICMusicSubscriptionStatusMonitor _requestSubscriptionStatusWithCachingPolicy:completion:](self, "_requestSubscriptionStatusWithCachingPolicy:completion:", 0, 0);
    goto LABEL_18;
  }
  v14 = (NSNumber *)os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(&v14->super.super, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = self;
    v24 = 2114;
    v25 = v20;
    v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_1A03E3000, &v14->super.super, OS_LOG_TYPE_DEFAULT, "%{public}@: Handling %{public}@. DSID has not changed (it is still equal to %@). Ignoring this notification.", buf, 0x20u);

  }
LABEL_18:

}

- (void)_endObservingSubscriptionStatus
{
  os_unfair_lock_s *p_lock;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSArray *notificationHandlers;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  ICMusicSubscriptionStatusMonitor *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_notificationHandlers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "removeObserver:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9++), (_QWORD)v13);
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v7);
  }

  if (-[ICMusicSubscriptionStatusMonitor _isMonitoringSubscriptionStatusForAutoupdatingIdentity](self, "_isMonitoringSubscriptionStatusForAutoupdatingIdentity"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.itunescloudd.activeUserIdentityDidChangeNotification"), 0);
  }
  os_unfair_lock_lock(p_lock);
  notificationHandlers = self->_notificationHandlers;
  self->_notificationHandlers = 0;

  os_unfair_lock_unlock(p_lock);
  v12 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = self;
    _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopped observing subscription status.", buf, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionStatus, 0);
  objc_storeStrong((id *)&self->_notificationHandlers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_identityContext, 0);
}

void __91__ICMusicSubscriptionStatusMonitor__requestSubscriptionStatusWithCachingPolicy_completion___block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v20 = 138543874;
      v21 = v9;
      v22 = 2114;
      v23 = v10;
      v24 = 2114;
      v25 = v6;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Did complete %{public}@. Encountered error: %{public}@.", (uint8_t *)&v20, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      v20 = 138543874;
      v21 = v11;
      v22 = 2114;
      v23 = v12;
      v24 = 2114;
      v25 = v5;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Did complete %{public}@. Received subscription status response %{public}@.", (uint8_t *)&v20, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_effectiveIdentityForRequestingSubscriptionStatus");
    v8 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 48);
    +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = -[NSObject isEqualToIdentity:inStore:](v8, "isEqualToIdentity:inStore:", v13, v14);

    if ((v13 & 1) != 0)
    {
      -[NSObject subscriptionStatus](v5, "subscriptionStatus");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "copy");

      objc_msgSend(*(id *)(a1 + 32), "_updateWithSubscriptionStatus:", v16);
    }
    else
    {
      v16 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(a1 + 32);
        v18 = *(_QWORD *)(a1 + 48);
        v20 = 138543874;
        v21 = v17;
        v22 = 2114;
        v23 = v18;
        v24 = 2114;
        v25 = v8;
        _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring response because the effective user identity has changed since the request was made: %{public}@ --> %{public}@", (uint8_t *)&v20, 0x20u);
      }
    }

  }
  v19 = *(_QWORD *)(a1 + 56);
  if (v19)
    (*(void (**)(void))(v19 + 16))();

}

void __69__ICMusicSubscriptionStatusMonitor__beginObservingSubscriptionStatus__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleSubscriptionStatusDidChange:", v3);

}

void __69__ICMusicSubscriptionStatusMonitor__beginObservingSubscriptionStatus__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleUserIdentityStoreDidChange:", v3);

}

@end
