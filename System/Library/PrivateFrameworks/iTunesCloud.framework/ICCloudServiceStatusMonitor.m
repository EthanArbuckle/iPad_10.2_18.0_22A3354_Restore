@implementation ICCloudServiceStatusMonitor

- (int64_t)authorizationStatusForScopes:(int64_t)a3
{
  int v3;

  if ((a3 & 2) == 0
    && (objc_msgSend((id)objc_opt_class(), "_hasEntitlementForStatusAccessExemptedFromUserConsentRequirement") & 1) != 0)
  {
    return 3;
  }
  v3 = TCCAccessPreflight();
  if (v3 == 2)
    return 0;
  if (!v3)
    return 3;
  if (TCCAccessRestricted())
    return 2;
  else
    return 1;
}

void __98__ICCloudServiceStatusMonitor__cloudServiceStatusMonitorConnectionForTransactionIdentifier_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cloudServiceStatusMonitorConnectionWasInvalidated");

}

- (void)_cloudServiceStatusMonitorConnectionWasInvalidated
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  int v5;
  ICCloudServiceStatusMonitor *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud service status monitor connection was invalidated.", (uint8_t *)&v5, 0xCu);
  }

  os_unfair_lock_lock(p_lock);
  -[ICCloudServiceStatusMonitor _resetCloudServiceStatusMonitorConnectionAllowingExplicitInvalidation:](self, "_resetCloudServiceStatusMonitorConnectionAllowingExplicitInvalidation:", 0);
  os_unfair_lock_unlock(p_lock);
}

void __82__ICCloudServiceStatusMonitor__requestStorefrontCountryCodeWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "_updateWithStorefrontCountryCode:transactionIdentifier:", v7, *(_QWORD *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

- (void)_updateWithStorefrontCountryCode:(id)a3 transactionIdentifier:(id)a4
{
  NSString *v6;
  id v7;
  NSString *v8;
  NSString *storefrontCountryCode;
  _BOOL4 v10;
  NSString *v11;
  char v12;
  NSObject *v13;
  void *v14;
  NSString *v15;
  int v16;
  ICCloudServiceStatusMonitor *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a3;
  v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (!-[ICCloudServiceStatusMonitor _locked_isObservingCloudServiceStatus](self, "_locked_isObservingCloudServiceStatus"))
  {
LABEL_4:
    v10 = 0;
    if (!v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  v8 = self->_storefrontCountryCode;
  storefrontCountryCode = v6;
  v10 = v8 != v6;
  if (v8 != v6)
  {
    v11 = v8;
    v12 = -[NSString isEqual:](v8, "isEqual:", v6);

    if ((v12 & 1) != 0)
      goto LABEL_4;
    v15 = (NSString *)-[NSString copy](v6, "copy");
    storefrontCountryCode = self->_storefrontCountryCode;
    self->_storefrontCountryCode = v15;
  }

  if (v7)
LABEL_5:
    -[ICCloudServiceStatusMonitor _endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:](self, "_endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:", v7);
LABEL_6:
  os_unfair_lock_unlock(&self->_lock);
  if (v10)
  {
    v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543874;
      v17 = self;
      v18 = 2114;
      v19 = v6;
      v20 = 2114;
      v21 = CFSTR("ICCloudServiceStatusStorefrontCountryCodeDidChangeNotification");
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Storefront country code did change: \"%{public}@\". Posting %{public}@.", (uint8_t *)&v16, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("ICCloudServiceStatusStorefrontCountryCodeDidChangeNotification"), self);

  }
}

- (void)_endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  ICCloudServiceStatusMonitor *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ((-[NSMutableSet containsObject:](self->_activeTransactionIdentifiersForCloudServiceStatusMonitorConnection, "containsObject:", v4) & 1) != 0)
  {
    -[NSMutableSet removeObject:](self->_activeTransactionIdentifiersForCloudServiceStatusMonitorConnection, "removeObject:", v4);
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = -[NSMutableSet count](self->_activeTransactionIdentifiersForCloudServiceStatusMonitorConnection, "count");
      v9 = 138543874;
      v10 = self;
      v11 = 2114;
      v12 = v4;
      v13 = 2048;
      v14 = v6;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Ended transaction with identifier %{public}@ for cloud service status monitor connection; updated nu"
        "mber of active transactions: %lu.",
        (uint8_t *)&v9,
        0x20u);
    }

    if (!-[NSMutableSet count](self->_activeTransactionIdentifiersForCloudServiceStatusMonitorConnection, "count"))
    {
      v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543362;
        v10 = self;
        _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: About to invalidate cloud service status monitor connection.", (uint8_t *)&v9, 0xCu);
      }

      -[ICCloudServiceStatusMonitor _resetCloudServiceStatusMonitorConnectionAllowingExplicitInvalidation:](self, "_resetCloudServiceStatusMonitorConnectionAllowingExplicitInvalidation:", 1);
    }
  }
  else
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543618;
      v10 = self;
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Attempted to end transaction with unknown transaction identifier for cloud service status monitor connection: %{public}@. Ignoring.", (uint8_t *)&v9, 0x16u);
    }

  }
}

- (void)_resetCloudServiceStatusMonitorConnectionAllowingExplicitInvalidation:(BOOL)a3
{
  _BOOL4 v3;
  NSXPCConnection *cloudServiceStatusMonitorConnection;
  NSObject *v6;
  NSObject *v7;
  NSUUID *v8;
  NSUUID *observationToken;
  NSString *transactionIdentifierForActiveObservationToken;
  NSObject *v11;
  int v12;
  ICCloudServiceStatusMonitor *v13;
  __int16 v14;
  NSUUID *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  cloudServiceStatusMonitorConnection = self->_cloudServiceStatusMonitorConnection;
  if (cloudServiceStatusMonitorConnection)
  {
    if (v3)
    {
      -[NSXPCConnection invalidate](cloudServiceStatusMonitorConnection, "invalidate");
      v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138543362;
        v13 = self;
        _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Did invalidate cloud service status monitor connection.", (uint8_t *)&v12, 0xCu);
      }

      cloudServiceStatusMonitorConnection = self->_cloudServiceStatusMonitorConnection;
    }
    self->_cloudServiceStatusMonitorConnection = 0;

    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = self;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Did reset cloud service status monitor connection.", (uint8_t *)&v12, 0xCu);
    }

  }
  v8 = self->_observationToken;
  observationToken = self->_observationToken;
  self->_observationToken = 0;

  transactionIdentifierForActiveObservationToken = self->_transactionIdentifierForActiveObservationToken;
  self->_transactionIdentifierForActiveObservationToken = 0;

  -[NSMutableSet removeAllObjects](self->_activeTransactionIdentifiersForCloudServiceStatusMonitorConnection, "removeAllObjects");
  if (-[ICCloudServiceStatusMonitor _locked_isObservingCloudServiceStatus](self, "_locked_isObservingCloudServiceStatus"))
  {
    v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Was previously observing cloud service status with token: %{public}@. Scheduling appropriate triggers to request begin observing cloud service status again.", (uint8_t *)&v12, 0x16u);
    }

    -[ICCloudServiceStatusMonitor _scheduleTriggersForCloudServiceStatusObservationRecovery](self, "_scheduleTriggersForCloudServiceStatusObservationRecovery");
  }

}

- (BOOL)_locked_isObservingCloudServiceStatus
{
  os_unfair_lock_assert_owner(&self->_lock);
  return self->_observingCloudServiceStatusRequestsCount != 0;
}

- (id)_cloudServiceStatusMonitorConnectionForTransactionIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSXPCConnection *cloudServiceStatusMonitorConnection;
  ICCloudServerListenerEndpointProvider *listenerEndpointProvider;
  void *v9;
  id v10;
  void *v11;
  NSXPCConnection *v12;
  NSXPCConnection *v13;
  NSXPCConnection *v14;
  void *v15;
  NSXPCConnection *v16;
  void *v17;
  NSXPCConnection *v18;
  uint64_t v19;
  NSXPCConnection *v20;
  NSError *cloudServiceStatusMonitorConnectionEstablishmentError;
  NSError *v22;
  NSError *v23;
  NSXPCConnection *v24;
  NSError *v25;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id location;
  id v33;

  v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  cloudServiceStatusMonitorConnection = self->_cloudServiceStatusMonitorConnection;
  if (!cloudServiceStatusMonitorConnection)
  {
    listenerEndpointProvider = self->_listenerEndpointProvider;
    v33 = 0;
    -[ICCloudServerListenerEndpointProvider listenerEndpointForService:error:](listenerEndpointProvider, "listenerEndpointForService:error:", 4, &v33);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v33;
    v11 = v10;
    if (v9)
    {
      v27 = v10;
      v12 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v9);
      v13 = self->_cloudServiceStatusMonitorConnection;
      self->_cloudServiceStatusMonitorConnection = v12;

      -[NSXPCConnection setExportedObject:](self->_cloudServiceStatusMonitorConnection, "setExportedObject:", self);
      v14 = self->_cloudServiceStatusMonitorConnection;
      +[ICCloudServiceStatusRemoteMonitoring clientInterface](ICCloudServiceStatusRemoteMonitoring, "clientInterface");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedInterface:](v14, "setExportedInterface:", v15);

      v16 = self->_cloudServiceStatusMonitorConnection;
      +[ICCloudServiceStatusRemoteMonitoring serviceInterface](ICCloudServiceStatusRemoteMonitoring, "serviceInterface");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](v16, "setRemoteObjectInterface:", v17);

      objc_initWeak(&location, self);
      v18 = self->_cloudServiceStatusMonitorConnection;
      v19 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __98__ICCloudServiceStatusMonitor__cloudServiceStatusMonitorConnectionForTransactionIdentifier_error___block_invoke;
      v30[3] = &unk_1E4391400;
      objc_copyWeak(&v31, &location);
      -[NSXPCConnection setInterruptionHandler:](v18, "setInterruptionHandler:", v30);
      v20 = self->_cloudServiceStatusMonitorConnection;
      v28[0] = v19;
      v28[1] = 3221225472;
      v28[2] = __98__ICCloudServiceStatusMonitor__cloudServiceStatusMonitorConnectionForTransactionIdentifier_error___block_invoke_2;
      v28[3] = &unk_1E4391400;
      objc_copyWeak(&v29, &location);
      -[NSXPCConnection setInvalidationHandler:](v20, "setInvalidationHandler:", v28);
      -[NSXPCConnection resume](self->_cloudServiceStatusMonitorConnection, "resume");
      cloudServiceStatusMonitorConnectionEstablishmentError = self->_cloudServiceStatusMonitorConnectionEstablishmentError;
      self->_cloudServiceStatusMonitorConnectionEstablishmentError = 0;

      objc_destroyWeak(&v29);
      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
      v11 = v27;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -7010, v10, CFSTR("Failed to get listener endpoint for cloud service status monitor."));
      v22 = (NSError *)objc_claimAutoreleasedReturnValue();
      v23 = self->_cloudServiceStatusMonitorConnectionEstablishmentError;
      self->_cloudServiceStatusMonitorConnectionEstablishmentError = v22;

    }
    cloudServiceStatusMonitorConnection = self->_cloudServiceStatusMonitorConnection;
  }
  v24 = cloudServiceStatusMonitorConnection;
  v25 = self->_cloudServiceStatusMonitorConnectionEstablishmentError;
  if (v6 && v24)
    -[ICCloudServiceStatusMonitor _beginTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:](self, "_beginTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:", v6);
  os_unfair_lock_unlock(&self->_lock);
  if (a4)
    *a4 = objc_retainAutorelease(v25);

  return v24;
}

- (void)_beginTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  ICCloudServiceStatusMonitor *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (-[NSMutableSet containsObject:](self->_activeTransactionIdentifiersForCloudServiceStatusMonitorConnection, "containsObject:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICCloudServiceStatusMonitor.m"), 557, CFSTR("Calling -_beginTransactionForCloudServiceStatusMonitorConnectionWithIdentifier: with the same transaction identifier more than once is invalid."));

  }
  -[NSMutableSet addObject:](self->_activeTransactionIdentifiersForCloudServiceStatusMonitorConnection, "addObject:", v5);
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[NSMutableSet count](self->_activeTransactionIdentifiersForCloudServiceStatusMonitorConnection, "count");
    v9 = 138543874;
    v10 = self;
    v11 = 2114;
    v12 = v5;
    v13 = 2048;
    v14 = v7;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Began transaction with identifier %{public}@ for cloud service status monitor connection; updated numb"
      "er of active transactions: %lu.",
      (uint8_t *)&v9,
      0x20u);
  }

}

- (void)requestStorefrontCountryCodeWithCompletionHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v5)(id, NSString *, _QWORD);
  NSString *v6;

  p_lock = &self->_lock;
  v5 = (void (**)(id, NSString *, _QWORD))a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  v6 = self->_storefrontCountryCode;
  os_unfair_lock_unlock(p_lock);
  if (v6)
    v5[2](v5, v6, 0);
  else
    -[ICCloudServiceStatusMonitor _requestStorefrontCountryCodeWithCompletionHandler:](self, "_requestStorefrontCountryCodeWithCompletionHandler:", v5);

}

- (void)_requestStorefrontCountryCodeWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__ICCloudServiceStatusMonitor__requestStorefrontCountryCodeWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E438E2B0;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __82__ICCloudServiceStatusMonitor__requestStorefrontCountryCodeWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E438E500;
  v8 = v10;
  v6 = v10;
  -[ICCloudServiceStatusMonitor _performCloudServiceStatusMonitorRequestWithDescription:requestHandler:errorHandler:](self, "_performCloudServiceStatusMonitorRequestWithDescription:requestHandler:errorHandler:", CFSTR("storefront country code"), v9, v7);

}

- (void)_performCloudServiceStatusMonitorRequestWithDescription:(id)a3 requestHandler:(id)a4 errorHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, id);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  ICCloudServiceStatusMonitor *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *, id))a4;
  v10 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("-"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("request-%@-%@"), v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0;
  -[ICCloudServiceStatusMonitor _cloudServiceStatusMonitorConnectionForTransactionIdentifier:error:](self, "_cloudServiceStatusMonitorConnectionForTransactionIdentifier:error:", v15, &v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v27;
  if (v16)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __115__ICCloudServiceStatusMonitor__performCloudServiceStatusMonitorRequestWithDescription_requestHandler_errorHandler___block_invoke;
    v23[3] = &unk_1E438EF60;
    v23[4] = self;
    v18 = v15;
    v24 = v18;
    v25 = v8;
    v26 = v10;
    objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v19, v18);

  }
  else
  {
    v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "debugDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "msv_underlyingError");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v29 = self;
      v30 = 2114;
      v31 = v8;
      v32 = 2114;
      v33 = v21;
      v34 = 2114;
      v35 = v22;
      _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Encountered error while requesting %{public}@. %{public}@ Underlying error: %{public}@.", buf, 0x2Au);

    }
    if (v10)
      (*((void (**)(id, id))v10 + 2))(v10, v17);
  }

}

void __82__ICCloudServiceStatusMonitor__requestStorefrontCountryCodeWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__ICCloudServiceStatusMonitor__requestStorefrontCountryCodeWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E4390C58;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  objc_msgSend(a2, "requestStorefrontCountryCodeWithCompletionHandler:", v8);

}

- (ICCloudServiceStatusMonitor)init
{
  ICCloudServiceStatusMonitor *v2;
  NSMutableSet *v3;
  NSMutableSet *activeTransactionIdentifiersForCloudServiceStatusMonitorConnection;
  ICCloudServerListenerEndpointProvider *v5;
  ICCloudServerListenerEndpointProvider *listenerEndpointProvider;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICCloudServiceStatusMonitor;
  v2 = -[ICCloudServiceStatusMonitor init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activeTransactionIdentifiersForCloudServiceStatusMonitorConnection = v2->_activeTransactionIdentifiersForCloudServiceStatusMonitorConnection;
    v2->_activeTransactionIdentifiersForCloudServiceStatusMonitorConnection = v3;

    v2->_cloudServerLaunchedNotifyToken = -1;
    v5 = objc_alloc_init(ICCloudServerListenerEndpointProvider);
    listenerEndpointProvider = v2->_listenerEndpointProvider;
    v2->_listenerEndpointProvider = v5;

    v2->_privacyAcknowledgementPolicy = 1;
    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)setPrivacyAcknowledgementPolicy:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  ICCloudServiceStatusMonitor *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  self->_privacyAcknowledgementPolicy = a3;
  os_unfair_lock_unlock(p_lock);
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("prompt-allowed");
    if (a3 != 1)
      v7 = 0;
    if (!a3)
      v7 = CFSTR("prompt-prohibited");
    v8 = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud service status monitor was configured with privacy acknowledgement policy: %{public}@.", (uint8_t *)&v8, 0x16u);
  }

}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  objc_super v4;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  -[ICCloudServiceStatusMonitor _invalidateTriggersForCloudServiceStatusObservationRecovery](self, "_invalidateTriggersForCloudServiceStatusObservationRecovery");
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)ICCloudServiceStatusMonitor;
  -[ICCloudServiceStatusMonitor dealloc](&v4, sel_dealloc);
}

- (int64_t)privacyAcknowledgementPolicy
{
  os_unfair_lock_s *p_lock;
  int64_t privacyAcknowledgementPolicy;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  privacyAcknowledgementPolicy = self->_privacyAcknowledgementPolicy;
  os_unfair_lock_unlock(p_lock);
  return privacyAcknowledgementPolicy;
}

- (BOOL)isObservingCloudServiceStatus
{
  ICCloudServiceStatusMonitor *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  LOBYTE(v2) = -[ICCloudServiceStatusMonitor _locked_isObservingCloudServiceStatus](v2, "_locked_isObservingCloudServiceStatus");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)beginObservingCloudServiceStatus
{
  os_unfair_lock_s *p_lock;
  unint64_t observingCloudServiceStatusRequestsCount;
  NSObject *v5;
  const char *v6;
  int v7;
  ICCloudServiceStatusMonitor *v8;
  __int16 v9;
  unint64_t v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  observingCloudServiceStatusRequestsCount = self->_observingCloudServiceStatusRequestsCount;
  self->_observingCloudServiceStatusRequestsCount = observingCloudServiceStatusRequestsCount + 1;
  os_unfair_lock_unlock(p_lock);
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "Already";
    v7 = 138543874;
    v8 = self;
    if (!observingCloudServiceStatusRequestsCount)
      v6 = "Will begin";
    v9 = 2048;
    v10 = observingCloudServiceStatusRequestsCount + 1;
    v11 = 2082;
    v12 = v6;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud service status monitor incremented requests count for observing cloud service status to %lu. %{public}s observing cloud service status.", (uint8_t *)&v7, 0x20u);
  }

  if (!observingCloudServiceStatusRequestsCount)
    -[ICCloudServiceStatusMonitor _beginObservingCloudServiceStatus](self, "_beginObservingCloudServiceStatus");
}

- (void)endObservingCloudServiceStatus
{
  os_unfair_lock_s *p_lock;
  unint64_t observingCloudServiceStatusRequestsCount;
  unint64_t v5;
  NSUUID *v6;
  NSString *storefrontCountryCode;
  NSString *storefrontIdentifier;
  NSObject *v9;
  const char *v10;
  int v11;
  ICCloudServiceStatusMonitor *v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  NSUUID *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  observingCloudServiceStatusRequestsCount = self->_observingCloudServiceStatusRequestsCount;
  v5 = observingCloudServiceStatusRequestsCount - 1;
  self->_observingCloudServiceStatusRequestsCount = observingCloudServiceStatusRequestsCount - 1;
  if (observingCloudServiceStatusRequestsCount == 1)
  {
    v6 = self->_observationToken;
    self->_capabilities = 0;
    self->_hasValidCapabilities = 0;
    storefrontCountryCode = self->_storefrontCountryCode;
    self->_storefrontCountryCode = 0;

    storefrontIdentifier = self->_storefrontIdentifier;
    self->_storefrontIdentifier = 0;

  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = "Will keep";
    v11 = 138544130;
    v13 = 2048;
    v12 = self;
    if (!v5)
      v10 = "Will end";
    v14 = v5;
    v15 = 2082;
    v16 = v10;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud service status monitor decremented requests count for observing cloud service status to %lu. %{public}s observing cloud service status with token %{public}@.", (uint8_t *)&v11, 0x2Au);
  }

  if (!v5 && v6)
    -[ICCloudServiceStatusMonitor _endObservingCloudServiceStatusWithToken:](self, "_endObservingCloudServiceStatusWithToken:", v6);

}

- (void)requestCapabilitiesWithCompletionHandler:(id)a3
{
  -[ICCloudServiceStatusMonitor _requestCapabilitiesWithPrivacyPromptPolicy:completionHandler:](self, "_requestCapabilitiesWithPrivacyPromptPolicy:completionHandler:", 0, a3);
}

- (void)requestCapabilitiesWithPrivacyPromptPolicy:(int64_t)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ICCloudServiceStatusMonitor _requestCapabilitiesWithPrivacyPromptPolicy:completionHandler:](self, "_requestCapabilitiesWithPrivacyPromptPolicy:completionHandler:", v8, v7);

}

- (void)requestStorefrontIdentifierWithCompletionHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v5)(id, NSString *, _QWORD);
  NSString *v6;

  p_lock = &self->_lock;
  v5 = (void (**)(id, NSString *, _QWORD))a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  v6 = self->_storefrontIdentifier;
  os_unfair_lock_unlock(p_lock);
  if (v6)
    v5[2](v5, v6, 0);
  else
    -[ICCloudServiceStatusMonitor _requestStorefrontIdentifierWithCompletionHandler:](self, "_requestStorefrontIdentifierWithCompletionHandler:", v5);

}

- (void)requestDeveloperTokenWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  MSVDefaultDictionary *v8;
  MSVDefaultDictionary *developerTokenCompletionHandlers;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[6];
  _QWORD v24[4];
  id v25;
  _BYTE buf[24];
  void *v27;
  ICCloudServiceStatusMonitor *v28;
  _QWORD *v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  v7 = a4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  if (!self->_developerTokenCompletionHandlers)
  {
    v8 = (MSVDefaultDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D060]), "initWithDefaultValue:", &__block_literal_global_25747);
    developerTokenCompletionHandlers = self->_developerTokenCompletionHandlers;
    self->_developerTokenCompletionHandlers = v8;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVDefaultDictionary objectForKey:](self->_developerTokenCompletionHandlers, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v7, "copy");

  v13 = (void *)MEMORY[0x1A1AFA8D0](v12);
  objc_msgSend(v11, "addObject:", v13);

  v14 = objc_msgSend(v11, "count");
  v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14 == 1)
  {
    if (!v16)
      goto LABEL_9;
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = self;
    v17 = "%{public}@: Requesting developer token from service.";
    v18 = v15;
    v19 = 12;
  }
  else
  {
    if (!v16)
      goto LABEL_9;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v11, "count");
    v17 = "%{public}@: Skipping redundant request for developer token from service; appending completion handler to exist"
          "ing list (%lu completion handlers).";
    v18 = v15;
    v19 = 22;
  }
  _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_9:

  os_unfair_lock_unlock(p_lock);
  if (v14 == 1)
  {
    v20 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __82__ICCloudServiceStatusMonitor_requestDeveloperTokenWithOptions_completionHandler___block_invoke_36;
    v23[3] = &unk_1E438E0B0;
    v23[4] = self;
    v23[5] = a3;
    v21 = v23;
    os_unfair_lock_assert_not_owner(p_lock);
    *(_QWORD *)buf = v20;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __83__ICCloudServiceStatusMonitor__requestDeveloperTokenWithOptions_completionHandler___block_invoke;
    v27 = &unk_1E438E100;
    v30 = a3;
    v28 = self;
    v29 = v21;
    v24[0] = v20;
    v24[1] = 3221225472;
    v24[2] = __83__ICCloudServiceStatusMonitor__requestDeveloperTokenWithOptions_completionHandler___block_invoke_3;
    v24[3] = &unk_1E438E500;
    v22 = v29;
    v25 = v22;
    -[ICCloudServiceStatusMonitor _performCloudServiceStatusMonitorRequestWithDescription:requestHandler:errorHandler:](self, "_performCloudServiceStatusMonitorRequestWithDescription:requestHandler:errorHandler:", CFSTR("developer token"), buf, v24);

  }
}

- (void)_requestCapabilitiesWithPrivacyPromptPolicy:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, unint64_t, _QWORD);
  int64_t privacyAcknowledgementPolicy;
  _BOOL4 hasValidCapabilities;
  unint64_t capabilities;
  int v11;
  int64_t v12;
  _QWORD v13[4];
  void (**v14)(id, unint64_t, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, unint64_t, _QWORD))a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (v6)
    privacyAcknowledgementPolicy = objc_msgSend(v6, "integerValue");
  else
    privacyAcknowledgementPolicy = self->_privacyAcknowledgementPolicy;
  hasValidCapabilities = self->_hasValidCapabilities;
  if (self->_hasValidCapabilities)
    capabilities = self->_capabilities;
  else
    capabilities = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&_ICCloudServiceStatusPrivacyAcknowledgementPromptLock);
  v11 = _ICCloudServiceStatusPrivacyAcknowledgementDidPromptOnce;
  os_unfair_lock_unlock((os_unfair_lock_t)&_ICCloudServiceStatusPrivacyAcknowledgementPromptLock);
  os_unfair_lock_unlock(&self->_lock);
  if (hasValidCapabilities)
  {
    v7[2](v7, capabilities, 0);
  }
  else
  {
    if (v11)
      v12 = 0;
    else
      v12 = privacyAcknowledgementPolicy;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __93__ICCloudServiceStatusMonitor__requestCapabilitiesWithPrivacyPromptPolicy_completionHandler___block_invoke;
    v13[3] = &unk_1E438E0D8;
    v14 = v7;
    -[ICCloudServiceStatusMonitor _requestCapabilitiesWithPrivacyPromptPolicy:requestCapabilitiesWithCompletionHandler:](self, "_requestCapabilitiesWithPrivacyPromptPolicy:requestCapabilitiesWithCompletionHandler:", v12, v13);

  }
}

- (void)requestUserTokenForDeveloperToken:(id)a3 completionHandler:(id)a4
{
  -[ICCloudServiceStatusMonitor requestUserTokenForDeveloperToken:options:completionHandler:](self, "requestUserTokenForDeveloperToken:options:completionHandler:", a3, 1, a4);
}

- (void)requestUserTokenForDeveloperToken:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  MSVDefaultDictionary *v10;
  MSVDefaultDictionary *userTokenCompletionHandlers;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  id v25;
  uint64_t *v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, void *);
  void *v32;
  ICCloudServiceStatusMonitor *v33;
  id v34;
  unint64_t v35;
  _QWORD v36[4];
  uint64_t *v37;
  _BYTE buf[24];
  void *v39;
  id v40;
  ICCloudServiceStatusMonitor *v41;
  uint64_t *v42;
  unint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (!self->_userTokenCompletionHandlers)
  {
    v10 = (MSVDefaultDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D060]), "initWithDefaultValue:", &__block_literal_global_47);
    userTokenCompletionHandlers = self->_userTokenCompletionHandlers;
    self->_userTokenCompletionHandlers = v10;

  }
  v12 = (void *)MEMORY[0x1E0D4D0B8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pairWithFirst:second:", v8, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSVDefaultDictionary objectForKey:](self->_userTokenCompletionHandlers, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v9, "copy");

  v17 = (void *)MEMORY[0x1A1AFA8D0](v16);
  objc_msgSend(v15, "addObject:", v17);

  v18 = objc_msgSend(v15, "count");
  v19 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18 == 1)
  {
    if (!v20)
      goto LABEL_9;
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = self;
    v21 = "%{public}@: Requesting user token from service.";
    v22 = v19;
    v23 = 12;
  }
  else
  {
    if (!v20)
      goto LABEL_9;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v15, "count");
    v21 = "%{public}@: Skipping redundant request for user token from service; appending completion handler to existing l"
          "ist (%lu completion handlers).";
    v22 = v19;
    v23 = 22;
  }
  _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
LABEL_9:

  os_unfair_lock_unlock(&self->_lock);
  if (v18 == 1)
  {
    v24 = MEMORY[0x1E0C809B0];
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __91__ICCloudServiceStatusMonitor_requestUserTokenForDeveloperToken_options_completionHandler___block_invoke_49;
    v32 = &unk_1E438E148;
    v33 = self;
    v34 = v8;
    v35 = a4;
    v25 = v34;
    v26 = &v29;
    os_unfair_lock_assert_not_owner(&self->_lock);
    *(_QWORD *)buf = v24;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __92__ICCloudServiceStatusMonitor__requestUserTokenForDeveloperToken_options_completionHandler___block_invoke;
    v39 = &unk_1E438E170;
    v27 = v25;
    v43 = a4;
    v40 = v27;
    v41 = self;
    v42 = v26;
    v36[0] = v24;
    v36[1] = 3221225472;
    v36[2] = __92__ICCloudServiceStatusMonitor__requestUserTokenForDeveloperToken_options_completionHandler___block_invoke_3;
    v36[3] = &unk_1E438E500;
    v28 = v42;
    v37 = v28;
    -[ICCloudServiceStatusMonitor _performCloudServiceStatusMonitorRequestWithDescription:requestHandler:errorHandler:](self, "_performCloudServiceStatusMonitorRequestWithDescription:requestHandler:errorHandler:", CFSTR("user token"), buf, v36, v29, v30, v31, v32, v33);

  }
}

- (void)requestMusicKitTokensWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  MSVDefaultDictionary *v8;
  MSVDefaultDictionary *tokensCompletionHandlers;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[6];
  _QWORD v24[4];
  id v25;
  _BYTE buf[24];
  void *v27;
  ICCloudServiceStatusMonitor *v28;
  _QWORD *v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  v7 = a4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  if (!self->_tokensCompletionHandlers)
  {
    v8 = (MSVDefaultDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D060]), "initWithDefaultValue:", &__block_literal_global_52);
    tokensCompletionHandlers = self->_tokensCompletionHandlers;
    self->_tokensCompletionHandlers = v8;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVDefaultDictionary objectForKey:](self->_tokensCompletionHandlers, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v7, "copy");

  v13 = (void *)MEMORY[0x1A1AFA8D0](v12);
  objc_msgSend(v11, "addObject:", v13);

  v14 = objc_msgSend(v11, "count");
  v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14 == 1)
  {
    if (!v16)
      goto LABEL_9;
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = self;
    v17 = "%{public}@: Requesting MusicKit tokens from service.";
    v18 = v15;
    v19 = 12;
  }
  else
  {
    if (!v16)
      goto LABEL_9;
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v11, "count");
    v17 = "%{public}@: Skipping redundant request for MusicKit tokens from service; appending completion handler to exist"
          "ing list (%lu completion handlers).";
    v18 = v15;
    v19 = 22;
  }
  _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_9:

  os_unfair_lock_unlock(p_lock);
  if (v14 == 1)
  {
    v20 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __82__ICCloudServiceStatusMonitor_requestMusicKitTokensWithOptions_completionHandler___block_invoke_53;
    v23[3] = &unk_1E438E198;
    v23[4] = self;
    v23[5] = a3;
    v21 = v23;
    os_unfair_lock_assert_not_owner(p_lock);
    *(_QWORD *)buf = v20;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __83__ICCloudServiceStatusMonitor__requestMusicKitTokensWithOptions_completionHandler___block_invoke;
    v27 = &unk_1E438E100;
    v30 = a3;
    v28 = self;
    v29 = v21;
    v24[0] = v20;
    v24[1] = 3221225472;
    v24[2] = __83__ICCloudServiceStatusMonitor__requestMusicKitTokensWithOptions_completionHandler___block_invoke_3;
    v24[3] = &unk_1E438E500;
    v22 = v29;
    v25 = v22;
    -[ICCloudServiceStatusMonitor _performCloudServiceStatusMonitorRequestWithDescription:requestHandler:errorHandler:](self, "_performCloudServiceStatusMonitorRequestWithDescription:requestHandler:errorHandler:", CFSTR("MusicKit tokens"), buf, v24);

  }
}

- (void)revokeMusicKitUserTokensForAccountDSID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  ICCloudServiceStatusMonitor *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  _QWORD v24[5];
  uint8_t buf[4];
  ICCloudServiceStatusMonitor *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v26 = self;
    v27 = 2114;
    v28 = v6;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Revoking music user tokens DSID %{public}@", buf, 0x16u);
  }

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.itunescloudd.tcchelper"), 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5DDBA8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRemoteObjectInterface:", v10);
  v11 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __85__ICCloudServiceStatusMonitor_revokeMusicKitUserTokensForAccountDSID_withCompletion___block_invoke;
  v24[3] = &unk_1E43913D8;
  v24[4] = self;
  objc_msgSend(v9, "setInterruptionHandler:", v24);
  v23[0] = v11;
  v23[1] = 3221225472;
  v23[2] = __85__ICCloudServiceStatusMonitor_revokeMusicKitUserTokensForAccountDSID_withCompletion___block_invoke_106;
  v23[3] = &unk_1E43913D8;
  v23[4] = self;
  objc_msgSend(v9, "setInvalidationHandler:", v23);
  objc_msgSend(v9, "resume");
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __85__ICCloudServiceStatusMonitor_revokeMusicKitUserTokensForAccountDSID_withCompletion___block_invoke_107;
  v21[3] = &unk_1E43915E8;
  v21[4] = self;
  v12 = v7;
  v22 = v12;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    +[ICUserIdentity specificAccountWithDSID:](ICUserIdentity, "specificAccountWithDSID:", v6);
  else
    +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __85__ICCloudServiceStatusMonitor_revokeMusicKitUserTokensForAccountDSID_withCompletion___block_invoke_109;
  v17[3] = &unk_1E438EF88;
  v18 = v9;
  v19 = self;
  v20 = v12;
  v15 = v12;
  v16 = v9;
  objc_msgSend(v13, "revokeMusicKitUserTokensForUserIdentity:withCompletion:", v14, v17);

}

- (void)activeAccountDidChange
{
  NSObject *v3;
  void *v4;
  int v5;
  ICCloudServiceStatusMonitor *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_not_owner(&self->_lock);
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543618;
    v6 = self;
    v7 = 2112;
    v8 = CFSTR("ICCloudServiceStatusActiveAccountDidChangeNotification");
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Active account did change. Posting %@.", (uint8_t *)&v5, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("ICCloudServiceStatusActiveAccountDidChangeNotification"), self);

}

- (void)capabilitiesDidChange:(unint64_t)a3
{
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[ICCloudServiceStatusMonitor _updateWithCapabilities:hasValidCapabilities:transactionIdentifier:](self, "_updateWithCapabilities:hasValidCapabilities:transactionIdentifier:", a3, 1, 0);
}

- (void)storefrontCountryCodeDidChange:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  -[ICCloudServiceStatusMonitor _updateWithStorefrontCountryCode:transactionIdentifier:](self, "_updateWithStorefrontCountryCode:transactionIdentifier:", v5, 0);

}

- (void)storefrontIdentifierDidChange:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  -[ICCloudServiceStatusMonitor _updateWithStorefrontIdentifier:transactionIdentifier:](self, "_updateWithStorefrontIdentifier:transactionIdentifier:", v5, 0);

}

- (void)_cloudServiceStatusMonitorConnectionWasInterrupted
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  int v5;
  ICCloudServiceStatusMonitor *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud service status monitor connection was interrupted.", (uint8_t *)&v5, 0xCu);
  }

  os_unfair_lock_lock(p_lock);
  -[ICCloudServiceStatusMonitor _resetCloudServiceStatusMonitorConnectionAllowingExplicitInvalidation:](self, "_resetCloudServiceStatusMonitorConnectionAllowingExplicitInvalidation:", 0);
  os_unfair_lock_unlock(p_lock);
}

- (void)requestAuthorizationForScopes:(int64_t)a3 completionHandler:(id)a4
{
  void (**v7)(id, uint64_t);
  int64_t v8;
  int64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  ICCloudServiceStatusMonitor *v14;
  void (**v15)(id, uint64_t);
  SEL v16;
  int64_t v17;
  int64_t v18;
  _QWORD v19[6];

  v7 = (void (**)(id, uint64_t))a4;
  v8 = -[ICCloudServiceStatusMonitor authorizationStatusForScopes:](self, "authorizationStatusForScopes:", a3);
  if (v8 == 1)
  {
    if (v7)
      v7[2](v7, 1);
  }
  else
  {
    v9 = v8;
    if ((a3 & 2) != 0
      || !objc_msgSend((id)objc_opt_class(), "_hasEntitlementForStatusAccessExemptedFromUserConsentRequirement"))
    {
      v10 = objc_alloc(MEMORY[0x1E0D4D048]);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __79__ICCloudServiceStatusMonitor_requestAuthorizationForScopes_completionHandler___block_invoke;
      v19[3] = &unk_1E438E1E8;
      v19[4] = self;
      v19[5] = a2;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __79__ICCloudServiceStatusMonitor_requestAuthorizationForScopes_completionHandler___block_invoke_2;
      v12[3] = &unk_1E438E238;
      v13 = (id)objc_msgSend(v10, "initWithDeallocHandler:", v19);
      v14 = self;
      v15 = v7;
      v16 = a2;
      v17 = a3;
      v18 = v9;
      v11 = v13;
      -[ICCloudServiceStatusMonitor _validateAuthorizationExpiryWithCompletionHandler:](self, "_validateAuthorizationExpiryWithCompletionHandler:", v12);

    }
    else if (v7)
    {
      v7[2](v7, 3);
    }
  }

}

- (void)_validateAuthorizationExpiryWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  _QWORD v6[5];
  void (**v7)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  if (objc_msgSend(MEMORY[0x1E0D4D070], "hasEntitlement:inGroup:shouldLogForMissingEntitlement:", *MEMORY[0x1E0DB1158], CFSTR("com.apple.private.tcc.allow"), 0))
  {
    v4[2](v4, 1);
  }
  else
  {
    if (_validateAuthorizationExpiryWithCompletionHandler__onceToken != -1)
      dispatch_once(&_validateAuthorizationExpiryWithCompletionHandler__onceToken, &__block_literal_global_142);
    v5 = (void *)_validateAuthorizationExpiryWithCompletionHandler____accessPermissionsQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __81__ICCloudServiceStatusMonitor__validateAuthorizationExpiryWithCompletionHandler___block_invoke_2;
    v6[3] = &unk_1E4390EF8;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "addOperationWithBlock:", v6);

  }
}

- (void)_requestCapabilitiesWithPrivacyPromptPolicy:(int64_t)a3 requestCapabilitiesWithCompletionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;

  v6 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __116__ICCloudServiceStatusMonitor__requestCapabilitiesWithPrivacyPromptPolicy_requestCapabilitiesWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E438E100;
  v13 = a3;
  v11[4] = self;
  v12 = v6;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __116__ICCloudServiceStatusMonitor__requestCapabilitiesWithPrivacyPromptPolicy_requestCapabilitiesWithCompletionHandler___block_invoke_3;
  v9[3] = &unk_1E438E500;
  v10 = v12;
  v8 = v12;
  -[ICCloudServiceStatusMonitor _performCloudServiceStatusMonitorRequestWithDescription:requestHandler:errorHandler:](self, "_performCloudServiceStatusMonitorRequestWithDescription:requestHandler:errorHandler:", CFSTR("cloud service capabilities"), v11, v9);

}

- (void)_requestStorefrontIdentifierWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__ICCloudServiceStatusMonitor__requestStorefrontIdentifierWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E438E2B0;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __81__ICCloudServiceStatusMonitor__requestStorefrontIdentifierWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E438E500;
  v8 = v10;
  v6 = v10;
  -[ICCloudServiceStatusMonitor _performCloudServiceStatusMonitorRequestWithDescription:requestHandler:errorHandler:](self, "_performCloudServiceStatusMonitorRequestWithDescription:requestHandler:errorHandler:", CFSTR("storefront identifier"), v9, v7);

}

- (void)_beginObservingCloudServiceStatus
{
  _QWORD v3[5];

  os_unfair_lock_assert_not_owner(&self->_lock);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__ICCloudServiceStatusMonitor__beginObservingCloudServiceStatus__block_invoke;
  v3[3] = &unk_1E438E300;
  v3[4] = self;
  -[ICCloudServiceStatusMonitor _performCloudServiceStatusMonitorRequestWithDescription:requestHandler:errorHandler:](self, "_performCloudServiceStatusMonitorRequestWithDescription:requestHandler:errorHandler:", CFSTR("cloud service status observation token"), v3, 0);
}

- (void)_didBeginObservingCloudServiceStatusWithToken:(id)a3 transactionIdentifier:(id)a4
{
  id v7;
  id v8;
  NSString *v9;
  NSString *transactionIdentifierForActiveObservationToken;
  NSString *v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t buf[4];
  ICCloudServiceStatusMonitor *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (-[ICCloudServiceStatusMonitor _locked_isObservingCloudServiceStatus](self, "_locked_isObservingCloudServiceStatus"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ongoing-observation-of-cloud-service-status-%@"), v7);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_observationToken, a3);
    transactionIdentifierForActiveObservationToken = self->_transactionIdentifierForActiveObservationToken;
    self->_transactionIdentifierForActiveObservationToken = v9;
    v11 = v9;

    -[ICCloudServiceStatusMonitor _beginTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:](self, "_beginTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:", self->_transactionIdentifierForActiveObservationToken);
    -[ICCloudServiceStatusMonitor _endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:](self, "_endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:", v8);
    os_unfair_lock_unlock(&self->_lock);
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Began observing cloud service status with token: %{public}@.", buf, 0x16u);
    }

  }
  else
  {
    -[ICCloudServiceStatusMonitor _endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:](self, "_endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:", v8);
    os_unfair_lock_unlock(&self->_lock);
    v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Began observing cloud service status with token: %{public}@, despite the fact that the client requested to end observing it. Immediately cancelling this.", buf, 0x16u);
    }

    -[ICCloudServiceStatusMonitor _endObservingCloudServiceStatusWithToken:](self, "_endObservingCloudServiceStatusWithToken:", v7);
  }

}

- (void)_endObservingCloudServiceStatusWithToken:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  ICCloudServiceStatusMonitor *v9;
  uint8_t buf[4];
  ICCloudServiceStatusMonitor *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Ending observing cloud service status with token: %{public}@.", buf, 0x16u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__ICCloudServiceStatusMonitor__endObservingCloudServiceStatusWithToken___block_invoke;
  v7[3] = &unk_1E438E328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[ICCloudServiceStatusMonitor _performCloudServiceStatusMonitorRequestWithDescription:requestHandler:errorHandler:](self, "_performCloudServiceStatusMonitorRequestWithDescription:requestHandler:errorHandler:", CFSTR("relinquishment of cloud service status observation token"), v7, 0);

}

- (void)_didEndObservingCloudServiceStatusWithToken:(id)a3 transactionIdentifier:(id)a4
{
  NSUUID *v6;
  id v7;
  NSUUID *v8;
  NSUUID *v9;
  NSUUID *v10;
  int v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  NSString *transactionIdentifierForActiveObservationToken;
  NSUUID *observationToken;
  NSString *v18;
  NSString *v19;
  int v20;
  ICCloudServiceStatusMonitor *v21;
  __int16 v22;
  NSUUID *v23;
  __int16 v24;
  NSUUID *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = (NSUUID *)a3;
  v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v8 = self->_observationToken;
  v9 = self->_observationToken;
  if (v9 == v6)
  {

  }
  else
  {
    v10 = v9;
    v11 = -[NSUUID isEqual:](v9, "isEqual:", v6);

    if (!v11)
    {
      -[ICCloudServiceStatusMonitor _endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:](self, "_endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:", v7);
      os_unfair_lock_unlock(&self->_lock);
      v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138543874;
        v21 = self;
        v22 = 2114;
        v23 = v6;
        v24 = 2114;
        v25 = v8;
        v13 = "%{public}@: Observation token %{public}@ did not match with active observation token %{public}@. Did not e"
              "nd observing cloud service status.";
        v14 = v12;
        v15 = 32;
LABEL_8:
        _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v20, v15);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  observationToken = self->_observationToken;
  transactionIdentifierForActiveObservationToken = self->_transactionIdentifierForActiveObservationToken;
  self->_observationToken = 0;
  v18 = transactionIdentifierForActiveObservationToken;

  v19 = self->_transactionIdentifierForActiveObservationToken;
  self->_transactionIdentifierForActiveObservationToken = 0;

  -[ICCloudServiceStatusMonitor _endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:](self, "_endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:", v18);
  -[ICCloudServiceStatusMonitor _endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:](self, "_endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:", v7);
  os_unfair_lock_unlock(&self->_lock);
  v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138543618;
    v21 = self;
    v22 = 2114;
    v23 = v6;
    v13 = "%{public}@: Ended observing cloud service status with token: %{public}@.";
    v14 = v12;
    v15 = 22;
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_didEndRequestingTokenWithTransactionIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  -[ICCloudServiceStatusMonitor _endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:](self, "_endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_updateWithCapabilities:(unint64_t)a3 hasValidCapabilities:(BOOL)a4 transactionIdentifier:(id)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  ICCloudServiceStatusMonitor *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v5 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (!-[ICCloudServiceStatusMonitor _locked_isObservingCloudServiceStatus](self, "_locked_isObservingCloudServiceStatus"))
  {
LABEL_5:
    v5 = 0;
    if (!v8)
      goto LABEL_10;
LABEL_9:
    -[ICCloudServiceStatusMonitor _endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:](self, "_endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:", v8);
    goto LABEL_10;
  }
  if (self->_capabilities != a3)
  {
    self->_capabilities = a3;
    self->_hasValidCapabilities = v5;
    v5 = 1;
LABEL_8:
    if (!v8)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (!v5)
    goto LABEL_8;
  if (self->_hasValidCapabilities)
    goto LABEL_5;
  v5 = 1;
  self->_hasValidCapabilities = 1;
  if (v8)
    goto LABEL_9;
LABEL_10:
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      ICCloudServiceCapabilitiesGetDescription(a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = self;
      v14 = 2114;
      v15 = v10;
      v16 = 2112;
      v17 = CFSTR("ICCloudServiceStatusCapabilitiesDidChangeNotification");
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud service capabilities did change: %{public}@. Posting %@.", (uint8_t *)&v12, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("ICCloudServiceStatusCapabilitiesDidChangeNotification"), self);

  }
}

- (void)_updateWithStorefrontIdentifier:(id)a3 transactionIdentifier:(id)a4
{
  NSString *v6;
  id v7;
  NSString *v8;
  NSString *storefrontIdentifier;
  _BOOL4 v10;
  NSString *v11;
  char v12;
  NSObject *v13;
  void *v14;
  NSString *v15;
  int v16;
  ICCloudServiceStatusMonitor *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a3;
  v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (!-[ICCloudServiceStatusMonitor _locked_isObservingCloudServiceStatus](self, "_locked_isObservingCloudServiceStatus"))
  {
LABEL_4:
    v10 = 0;
    if (!v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  v8 = self->_storefrontIdentifier;
  storefrontIdentifier = v6;
  v10 = v8 != v6;
  if (v8 != v6)
  {
    v11 = v8;
    v12 = -[NSString isEqual:](v8, "isEqual:", v6);

    if ((v12 & 1) != 0)
      goto LABEL_4;
    v15 = (NSString *)-[NSString copy](v6, "copy");
    storefrontIdentifier = self->_storefrontIdentifier;
    self->_storefrontIdentifier = v15;
  }

  if (v7)
LABEL_5:
    -[ICCloudServiceStatusMonitor _endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:](self, "_endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:", v7);
LABEL_6:
  os_unfair_lock_unlock(&self->_lock);
  if (v10)
  {
    v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543874;
      v17 = self;
      v18 = 2114;
      v19 = v6;
      v20 = 2112;
      v21 = CFSTR("ICCloudServiceStatusStorefrontIdentifierDidChangeNotification");
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Storefront identifier did change: \"%{public}@\". Posting %@.", (uint8_t *)&v16, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("ICCloudServiceStatusStorefrontIdentifierDidChangeNotification"), self);

  }
}

- (void)_registerCloudServerLaunchedNotifyToken
{
  NSObject *v3;
  uint32_t v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  _QWORD v11[4];
  id v12;
  id location;
  uint8_t buf[4];
  ICCloudServiceStatusMonitor *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_cloudServerLaunchedNotifyToken == -1)
  {
    objc_initWeak(&location, self);
    self->_cloudServerLaunchedNotifyToken = -1;
    dispatch_get_global_queue(0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70__ICCloudServiceStatusMonitor__registerCloudServerLaunchedNotifyToken__block_invoke;
    v11[3] = &unk_1E438FDE0;
    objc_copyWeak(&v12, &location);
    v4 = notify_register_dispatch("com.apple.itunescloudd.launched", &self->_cloudServerLaunchedNotifyToken, v3, v11);

    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v15 = self;
        v16 = 2082;
        v17 = "com.apple.itunescloudd.launched";
        v18 = 2048;
        v19 = v4;
        v7 = "%{public}@: Failed to register notify token for notify topic named \"%{public}s\"; notifyRegisterDispatchStatus = %lu.";
        v8 = v6;
        v9 = OS_LOG_TYPE_ERROR;
        v10 = 32;
LABEL_7:
        _os_log_impl(&dword_1A03E3000, v8, v9, v7, buf, v10);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v15 = self;
      v16 = 2082;
      v17 = "com.apple.itunescloudd.launched";
      v7 = "%{public}@: Successfully registered notify token for notify topic named \"%{public}s\".";
      v8 = v6;
      v9 = OS_LOG_TYPE_DEFAULT;
      v10 = 22;
      goto LABEL_7;
    }

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)_cancelCloudServerLaunchedNotifyToken
{
  int cloudServerLaunchedNotifyToken;
  uint32_t v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  int v11;
  ICCloudServiceStatusMonitor *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  cloudServerLaunchedNotifyToken = self->_cloudServerLaunchedNotifyToken;
  if (cloudServerLaunchedNotifyToken != -1)
  {
    v4 = notify_cancel(cloudServerLaunchedNotifyToken);
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v11 = 138543874;
        v12 = self;
        v13 = 2082;
        v14 = "com.apple.itunescloudd.launched";
        v15 = 2048;
        v16 = v4;
        v7 = "%{public}@: Failed to cancel notify token for notify topic named \"%{public}s\"; notifyCancelStatus = %lu.";
        v8 = v6;
        v9 = OS_LOG_TYPE_ERROR;
        v10 = 32;
LABEL_7:
        _os_log_impl(&dword_1A03E3000, v8, v9, v7, (uint8_t *)&v11, v10);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543618;
      v12 = self;
      v13 = 2082;
      v14 = "com.apple.itunescloudd.launched";
      v7 = "%{public}@: Successfully cancelled notify token for notify topic named \"%{public}s\".";
      v8 = v6;
      v9 = OS_LOG_TYPE_DEFAULT;
      v10 = 22;
      goto LABEL_7;
    }

    self->_cloudServerLaunchedNotifyToken = -1;
  }
}

- (void)_scheduleCloudServerLaunchTimeoutTimer
{
  NSObject *v3;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *cloudServerLaunchTimeoutTimer;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD handler[4];
  id v11;
  uint8_t buf[4];
  ICCloudServiceStatusMonitor *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  -[ICCloudServiceStatusMonitor _invalidateCloudServerLaunchTimeoutTimer](self, "_invalidateCloudServerLaunchTimeoutTimer");
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2048;
    v15 = 0x403E000000000000;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Scheduling timeout timer for cloud server launch for %.1f seconds.", buf, 0x16u);
  }

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
  cloudServerLaunchTimeoutTimer = self->_cloudServerLaunchTimeoutTimer;
  self->_cloudServerLaunchTimeoutTimer = v5;

  v7 = self->_cloudServerLaunchTimeoutTimer;
  v8 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  objc_initWeak((id *)buf, self);
  v9 = self->_cloudServerLaunchTimeoutTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __69__ICCloudServiceStatusMonitor__scheduleCloudServerLaunchTimeoutTimer__block_invoke;
  handler[3] = &unk_1E4391400;
  objc_copyWeak(&v11, (id *)buf);
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume((dispatch_object_t)self->_cloudServerLaunchTimeoutTimer);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)_invalidateCloudServerLaunchTimeoutTimer
{
  NSObject *cloudServerLaunchTimeoutTimer;
  OS_dispatch_source *v4;
  NSObject *v5;
  int v6;
  ICCloudServiceStatusMonitor *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  cloudServerLaunchTimeoutTimer = self->_cloudServerLaunchTimeoutTimer;
  if (cloudServerLaunchTimeoutTimer)
  {
    dispatch_source_cancel(cloudServerLaunchTimeoutTimer);
    v4 = self->_cloudServerLaunchTimeoutTimer;
    self->_cloudServerLaunchTimeoutTimer = 0;

    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidated timeout timer for cloud server launch.", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)_recoverObservingCloudServiceStatus
{
  os_unfair_lock_s *p_lock;
  NSUUID *observationToken;
  NSObject *v5;
  int v6;
  ICCloudServiceStatusMonitor *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  -[ICCloudServiceStatusMonitor _invalidateTriggersForCloudServiceStatusObservationRecovery](self, "_invalidateTriggersForCloudServiceStatusObservationRecovery");
  if (-[ICCloudServiceStatusMonitor _locked_isObservingCloudServiceStatus](self, "_locked_isObservingCloudServiceStatus"))
  {
    observationToken = self->_observationToken;
    os_unfair_lock_unlock(p_lock);
    if (!observationToken)
    {
      v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 138543362;
        v7 = self;
        _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Missing cloud service status observation token despite the fact that the client asked to actively observe it.", (uint8_t *)&v6, 0xCu);
      }

      -[ICCloudServiceStatusMonitor _beginObservingCloudServiceStatus](self, "_beginObservingCloudServiceStatus");
      -[ICCloudServiceStatusMonitor _refreshCloudServiceStatus](self, "_refreshCloudServiceStatus");
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)_refreshCloudServiceStatus
{
  os_unfair_lock_assert_not_owner(&self->_lock);
  -[ICCloudServiceStatusMonitor _requestCapabilitiesWithPrivacyPromptPolicy:requestCapabilitiesWithCompletionHandler:](self, "_requestCapabilitiesWithPrivacyPromptPolicy:requestCapabilitiesWithCompletionHandler:", 0, 0);
  -[ICCloudServiceStatusMonitor _requestStorefrontCountryCodeWithCompletionHandler:](self, "_requestStorefrontCountryCodeWithCompletionHandler:", 0);
  -[ICCloudServiceStatusMonitor _requestStorefrontIdentifierWithCompletionHandler:](self, "_requestStorefrontIdentifierWithCompletionHandler:", 0);
}

- (void)_scheduleTriggersForCloudServiceStatusObservationRecovery
{
  os_unfair_lock_assert_owner(&self->_lock);
  -[ICCloudServiceStatusMonitor _registerCloudServerLaunchedNotifyToken](self, "_registerCloudServerLaunchedNotifyToken");
  -[ICCloudServiceStatusMonitor _scheduleCloudServerLaunchTimeoutTimer](self, "_scheduleCloudServerLaunchTimeoutTimer");
}

- (void)_invalidateTriggersForCloudServiceStatusObservationRecovery
{
  os_unfair_lock_assert_owner(&self->_lock);
  -[ICCloudServiceStatusMonitor _invalidateCloudServerLaunchTimeoutTimer](self, "_invalidateCloudServerLaunchTimeoutTimer");
  -[ICCloudServiceStatusMonitor _cancelCloudServerLaunchedNotifyToken](self, "_cancelCloudServerLaunchedNotifyToken");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokensCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_userTokenCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_developerTokenCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);
  objc_storeStrong((id *)&self->_storefrontCountryCode, 0);
  objc_storeStrong((id *)&self->_cloudServerLaunchTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_transactionIdentifierForActiveObservationToken, 0);
  objc_storeStrong((id *)&self->_observationToken, 0);
  objc_storeStrong((id *)&self->_listenerEndpointProvider, 0);
  objc_storeStrong((id *)&self->_activeTransactionIdentifiersForCloudServiceStatusMonitorConnection, 0);
  objc_storeStrong((id *)&self->_cloudServiceStatusMonitorConnectionEstablishmentError, 0);
  objc_storeStrong((id *)&self->_cloudServiceStatusMonitorConnection, 0);
}

void __69__ICCloudServiceStatusMonitor__scheduleCloudServerLaunchTimeoutTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138543362;
      v4 = WeakRetained;
      _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud server launch timeout timer did fire.", (uint8_t *)&v3, 0xCu);
    }

    objc_msgSend(WeakRetained, "_recoverObservingCloudServiceStatus");
  }

}

void __70__ICCloudServiceStatusMonitor__registerCloudServerLaunchedNotifyToken__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138543618;
      v4 = WeakRetained;
      v5 = 2082;
      v6 = "com.apple.itunescloudd.launched";
      _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Handling \"%{public}s\" notification: cloud server did launch.", (uint8_t *)&v3, 0x16u);
    }

    objc_msgSend(WeakRetained, "_recoverObservingCloudServiceStatus");
  }

}

void __72__ICCloudServiceStatusMonitor__endObservingCloudServiceStatusWithToken___block_invoke(int8x16_t *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  int8x16_t v8;
  _QWORD v9[4];
  int8x16_t v10;
  id v11;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__ICCloudServiceStatusMonitor__endObservingCloudServiceStatusWithToken___block_invoke_2;
  v9[3] = &unk_1E4391230;
  v8 = a1[2];
  v6 = (id)v8.i64[0];
  v10 = vextq_s8(v8, v8, 8uLL);
  v11 = v5;
  v7 = v5;
  objc_msgSend(a2, "endObservingCloudServiceStatusWithToken:completionHandler:", v6, v9);

}

uint64_t __72__ICCloudServiceStatusMonitor__endObservingCloudServiceStatusWithToken___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didEndObservingCloudServiceStatusWithToken:transactionIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __64__ICCloudServiceStatusMonitor__beginObservingCloudServiceStatus__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__ICCloudServiceStatusMonitor__beginObservingCloudServiceStatus__block_invoke_2;
  v7[3] = &unk_1E438E2D8;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "beginObservingCloudServiceStatusWithCompletionHandler:", v7);

}

uint64_t __64__ICCloudServiceStatusMonitor__beginObservingCloudServiceStatus__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didBeginObservingCloudServiceStatusWithToken:transactionIdentifier:", a2, *(_QWORD *)(a1 + 40));
}

void __81__ICCloudServiceStatusMonitor__requestStorefrontIdentifierWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__ICCloudServiceStatusMonitor__requestStorefrontIdentifierWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E4390C58;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  objc_msgSend(a2, "requestStorefrontIdentifierWithCompletionHandler:", v8);

}

uint64_t __81__ICCloudServiceStatusMonitor__requestStorefrontIdentifierWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __81__ICCloudServiceStatusMonitor__requestStorefrontIdentifierWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "_updateWithStorefrontIdentifier:transactionIdentifier:", v7, *(_QWORD *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

uint64_t __82__ICCloudServiceStatusMonitor__requestStorefrontCountryCodeWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __116__ICCloudServiceStatusMonitor__requestCapabilitiesWithPrivacyPromptPolicy_requestCapabilitiesWithCompletionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __116__ICCloudServiceStatusMonitor__requestCapabilitiesWithPrivacyPromptPolicy_requestCapabilitiesWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E438E288;
  v6 = (void *)a1[5];
  v7 = a1[6];
  v9[4] = a1[4];
  v10 = v5;
  v11 = v6;
  v8 = v5;
  objc_msgSend(a2, "requestCapabilitiesWithPrivacyPromptPolicy:completionHandler:", v7, v9);

}

uint64_t __116__ICCloudServiceStatusMonitor__requestCapabilitiesWithPrivacyPromptPolicy_requestCapabilitiesWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __116__ICCloudServiceStatusMonitor__requestCapabilitiesWithPrivacyPromptPolicy_requestCapabilitiesWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_updateWithCapabilities:hasValidCapabilities:transactionIdentifier:", a2, v6 == 0, *(_QWORD *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

void __81__ICCloudServiceStatusMonitor__validateAuthorizationExpiryWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.itunescloudd.tcchelper"), 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5DDBA8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);
  v4 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __81__ICCloudServiceStatusMonitor__validateAuthorizationExpiryWithCompletionHandler___block_invoke_3;
  v19[3] = &unk_1E43913D8;
  v19[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "setInterruptionHandler:", v19);
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __81__ICCloudServiceStatusMonitor__validateAuthorizationExpiryWithCompletionHandler___block_invoke_146;
  v18[3] = &unk_1E43913D8;
  v18[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "setInvalidationHandler:", v18);
  objc_msgSend(v2, "resume");
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __81__ICCloudServiceStatusMonitor__validateAuthorizationExpiryWithCompletionHandler___block_invoke_147;
  v16[3] = &unk_1E43915E8;
  v5 = *(void **)(a1 + 40);
  v16[4] = *(_QWORD *)(a1 + 32);
  v17 = v5;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __81__ICCloudServiceStatusMonitor__validateAuthorizationExpiryWithCompletionHandler___block_invoke_149;
  v12[3] = &unk_1E43901D8;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v13 = v2;
  v14 = v9;
  v15 = v10;
  v11 = v2;
  objc_msgSend(v6, "validateExpirationForBundleIdentifier:withReplyBlock:", v8, v12);

}

void __81__ICCloudServiceStatusMonitor__validateAuthorizationExpiryWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543618;
    v5 = v3;
    v6 = 2114;
    v7 = CFSTR("com.apple.itunescloudd.tcchelper");
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection to %{public}@ service interrupted.", (uint8_t *)&v4, 0x16u);
  }

}

void __81__ICCloudServiceStatusMonitor__validateAuthorizationExpiryWithCompletionHandler___block_invoke_146(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543618;
    v5 = v3;
    v6 = 2114;
    v7 = CFSTR("com.apple.itunescloudd.tcchelper");
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection to %{public}@ service invalidated.", (uint8_t *)&v4, 0x16u);
  }

}

void __81__ICCloudServiceStatusMonitor__validateAuthorizationExpiryWithCompletionHandler___block_invoke_147(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543874;
    v7 = v5;
    v8 = 2114;
    v9 = CFSTR("com.apple.itunescloudd.tcchelper");
    v10 = 2114;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Connection to %{public}@ failed to get remote object proxy: %{public}@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __81__ICCloudServiceStatusMonitor__validateAuthorizationExpiryWithCompletionHandler___block_invoke_149(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *(id *)(a1 + 32);
  if (v4)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v4;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to validate authorization expiry: %{public}@.", (uint8_t *)&v8, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(v5, "invalidate");

}

uint64_t __81__ICCloudServiceStatusMonitor__validateAuthorizationExpiryWithCompletionHandler___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)_validateAuthorizationExpiryWithCompletionHandler____accessPermissionsQueue;
  _validateAuthorizationExpiryWithCompletionHandler____accessPermissionsQueue = (uint64_t)v0;

  objc_msgSend((id)_validateAuthorizationExpiryWithCompletionHandler____accessPermissionsQueue, "setMaxConcurrentOperationCount:", 1);
  return objc_msgSend((id)_validateAuthorizationExpiryWithCompletionHandler____accessPermissionsQueue, "setName:", CFSTR("com.apple.iTunesCloud.AccessPermissionHelper.operationQueue"));
}

void __79__ICCloudServiceStatusMonitor_requestAuthorizationForScopes_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("ICCloudServiceStatusMonitor.m"), 778, CFSTR("-validatePermissionsExpiry…'s completion handler was not called."));

}

void __79__ICCloudServiceStatusMonitor_requestAuthorizationForScopes_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[6];
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "disarm");
  if ((a2 & 1) != 0)
  {
    v4 = objc_alloc(MEMORY[0x1E0D4D048]);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79__ICCloudServiceStatusMonitor_requestAuthorizationForScopes_completionHandler___block_invoke_133;
    v12[3] = &unk_1E438E1E8;
    v5 = *(_QWORD *)(a1 + 56);
    v12[4] = *(_QWORD *)(a1 + 40);
    v12[5] = v5;
    v10 = (void *)objc_msgSend(v4, "initWithDeallocHandler:", v12);
    v11 = *(id *)(a1 + 48);
    v6 = v10;
    TCCAccessRequest();

  }
  else
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v14 = v8;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Application has expired authorization, and couldn't be renewed.", buf, 0xCu);
    }

    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, 1);
  }
}

void __79__ICCloudServiceStatusMonitor_requestAuthorizationForScopes_completionHandler___block_invoke_133(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("ICCloudServiceStatusMonitor.m"), 790, CFSTR("TCCAccessRequest completion handler was not called."));

}

void __79__ICCloudServiceStatusMonitor_requestAuthorizationForScopes_completionHandler___block_invoke_2_136(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "disarm");
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    if (a2)
    {
      v5 = 3;
    }
    else
    {
      v5 = objc_msgSend(*(id *)(a1 + 40), "authorizationStatusForScopes:", *(_QWORD *)(a1 + 56));
      v4 = *(_QWORD *)(a1 + 48);
    }
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v5);
  }
  if (a2)
  {
    if (*(_QWORD *)(a1 + 64) != 3)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "postNotificationName:object:", CFSTR("ICCloudServiceStatusAuthorizationWasGrantedNotification"), *(_QWORD *)(a1 + 40));

    }
  }
}

void __115__ICCloudServiceStatusMonitor__performCloudServiceStatusMonitorRequestWithDescription_requestHandler_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  const os_unfair_lock *v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 144);
  v4 = a2;
  os_unfair_lock_assert_not_owner(v3);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(*(id *)(a1 + 32), "_endTransactionForCloudServiceStatusMonitorConnectionWithIdentifier:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 144));
  objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -7011, v4, CFSTR("Encountered error while requesting %@."), *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "msv_description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@.", buf, 0x16u);

  }
}

void __98__ICCloudServiceStatusMonitor__cloudServiceStatusMonitorConnectionForTransactionIdentifier_error___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cloudServiceStatusMonitorConnectionWasInterrupted");

}

void __85__ICCloudServiceStatusMonitor_revokeMusicKitUserTokensForAccountDSID_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543618;
    v5 = v3;
    v6 = 2114;
    v7 = CFSTR("com.apple.itunescloudd.tcchelper");
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection to %{public}@ service interrupted.", (uint8_t *)&v4, 0x16u);
  }

}

void __85__ICCloudServiceStatusMonitor_revokeMusicKitUserTokensForAccountDSID_withCompletion___block_invoke_106(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543618;
    v5 = v3;
    v6 = 2114;
    v7 = CFSTR("com.apple.itunescloudd.tcchelper");
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection to %{public}@ service invalidated.", (uint8_t *)&v4, 0x16u);
  }

}

void __85__ICCloudServiceStatusMonitor_revokeMusicKitUserTokensForAccountDSID_withCompletion___block_invoke_107(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543874;
    v7 = v5;
    v8 = 2114;
    v9 = CFSTR("com.apple.itunescloudd.tcchelper");
    v10 = 2114;
    v11 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Connection to %{public}@ failed to get remote object proxy: %{public}@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __85__ICCloudServiceStatusMonitor_revokeMusicKitUserTokensForAccountDSID_withCompletion___block_invoke_109(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "msv_description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v8;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Revocation of music user tokens completed error=%{public}@", (uint8_t *)&v10, 0x16u);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 40);
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Revocation of music user tokens completed", (uint8_t *)&v10, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(v4, "invalidate");

}

void __82__ICCloudServiceStatusMonitor_requestMusicKitTokensWithOptions_completionHandler___block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  const char *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  v7 = a3;
  if (v5)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(v5 + 144));
    os_unfair_lock_lock((os_unfair_lock_t)(v5 + 144));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v5 + 136), "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    objc_msgSend(*(id *)(v5 + 136), "removeObjectForKey:", v8);
    os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 144));
    v11 = objc_msgSend(v10, "count");
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    v13 = v12;
    if (v7)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        if (v11 == 1)
          v14 = "";
        else
          v14 = "s";
        objc_msgSend(v7, "msv_description");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v27 = v5;
        v28 = 2048;
        v29 = v11;
        v30 = 2080;
        v31 = v14;
        v32 = 2114;
        v33 = v15;
        _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Invoking %lu completion handler%s for MusicKit tokens. error=%{public}@", buf, 0x2Au);

      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = "s";
      *(_DWORD *)buf = 138543874;
      v27 = v5;
      if (v11 == 1)
        v16 = "";
      v28 = 2048;
      v29 = v11;
      v30 = 2080;
      v31 = v16;
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Invoking %lu completion handler%s for MusicKit tokens.", buf, 0x20u);
    }

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v17 = v10;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, buf, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v23;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v17);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v21) + 16))(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v21));
          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, buf, 16);
      }
      while (v19);
    }

  }
}

void __83__ICCloudServiceStatusMonitor__requestMusicKitTokensWithOptions_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v5 = a3;
  v6 = a1[6];
  v7 = a2;
  +[ICClientInfo defaultInfo](ICClientInfo, "defaultInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__ICCloudServiceStatusMonitor__requestMusicKitTokensWithOptions_completionHandler___block_invoke_2;
  v11[3] = &unk_1E438E1C0;
  v9 = (void *)a1[5];
  v11[4] = a1[4];
  v12 = v5;
  v13 = v9;
  v10 = v5;
  objc_msgSend(v7, "requestMusicKitTokensWithOptions:clientInfo:completionHandler:", v6, v8, v11);

}

uint64_t __83__ICCloudServiceStatusMonitor__requestMusicKitTokensWithOptions_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__ICCloudServiceStatusMonitor__requestMusicKitTokensWithOptions_completionHandler___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = (void *)a1[4];
  v6 = a1[5];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v5, "_didEndRequestingTokenWithTransactionIdentifier:", v6);
  (*(void (**)(void))(a1[6] + 16))();

}

id __82__ICCloudServiceStatusMonitor_requestMusicKitTokensWithOptions_completionHandler___block_invoke()
{
  return objc_alloc_init(MEMORY[0x1E0C99DE8]);
}

void __91__ICCloudServiceStatusMonitor_requestUserTokenForDeveloperToken_options_completionHandler___block_invoke_49(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  const char *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  v8 = a2;
  v9 = a3;
  if (v5)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(v5 + 144));
    os_unfair_lock_lock((os_unfair_lock_t)(v5 + 144));
    v10 = (void *)MEMORY[0x1E0D4D0B8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pairWithFirst:second:", v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v5 + 128), "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");

    objc_msgSend(*(id *)(v5 + 128), "removeObjectForKey:", v12);
    os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 144));
    v15 = objc_msgSend(v14, "count");
    v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    v17 = v16;
    if (v9)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        if (v15 == 1)
          v18 = "";
        else
          v18 = "s";
        objc_msgSend(v9, "msv_description");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v31 = v5;
        v32 = 2048;
        v33 = v15;
        v34 = 2080;
        v35 = v18;
        v36 = 2114;
        v37 = v19;
        _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Invoking %lu completion handler%s for user token. error=%{public}@", buf, 0x2Au);

      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v20 = "s";
      *(_DWORD *)buf = 138543874;
      v31 = v5;
      if (v15 == 1)
        v20 = "";
      v32 = 2048;
      v33 = v15;
      v34 = 2080;
      v35 = v20;
      _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Invoking %lu completion handler%s for user token.", buf, 0x20u);
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v21 = v14;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, buf, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v27;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v27 != v24)
            objc_enumerationMutation(v21);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v25) + 16))(*(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v25));
          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, buf, 16);
      }
      while (v23);
    }

  }
}

void __92__ICCloudServiceStatusMonitor__requestUserTokenForDeveloperToken_options_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v5 = a3;
  v6 = a1[4];
  v7 = a1[7];
  v8 = a2;
  +[ICClientInfo defaultInfo](ICClientInfo, "defaultInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__ICCloudServiceStatusMonitor__requestUserTokenForDeveloperToken_options_completionHandler___block_invoke_2;
  v12[3] = &unk_1E4390C58;
  v10 = (void *)a1[6];
  v12[4] = a1[5];
  v13 = v5;
  v14 = v10;
  v11 = v5;
  objc_msgSend(v8, "requestUserTokenForDeveloperToken:options:clientInfo:completionHandler:", v6, v7, v9, v12);

}

uint64_t __92__ICCloudServiceStatusMonitor__requestUserTokenForDeveloperToken_options_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __92__ICCloudServiceStatusMonitor__requestUserTokenForDeveloperToken_options_completionHandler___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = (void *)a1[4];
  v6 = a1[5];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v5, "_didEndRequestingTokenWithTransactionIdentifier:", v6);
  (*(void (**)(void))(a1[6] + 16))();

}

id __91__ICCloudServiceStatusMonitor_requestUserTokenForDeveloperToken_options_completionHandler___block_invoke()
{
  return objc_alloc_init(MEMORY[0x1E0C99DE8]);
}

void __93__ICCloudServiceStatusMonitor__requestCapabilitiesWithPrivacyPromptPolicy_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "code") == -7007)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_ICCloudServiceStatusPrivacyAcknowledgementPromptLock);
    _ICCloudServiceStatusPrivacyAcknowledgementDidPromptOnce = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)&_ICCloudServiceStatusPrivacyAcknowledgementPromptLock);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __82__ICCloudServiceStatusMonitor_requestDeveloperTokenWithOptions_completionHandler___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  const char *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  v7 = a3;
  if (v5)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(v5 + 144));
    os_unfair_lock_lock((os_unfair_lock_t)(v5 + 144));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v5 + 120), "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    objc_msgSend(*(id *)(v5 + 120), "removeObjectForKey:", v8);
    os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 144));
    v11 = objc_msgSend(v10, "count");
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    v13 = v12;
    if (v7)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        if (v11 == 1)
          v14 = "";
        else
          v14 = "s";
        objc_msgSend(v7, "msv_description");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v27 = v5;
        v28 = 2048;
        v29 = v11;
        v30 = 2080;
        v31 = v14;
        v32 = 2114;
        v33 = v15;
        _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Invoking %lu completion handler%s for developer token. error=%{public}@", buf, 0x2Au);

      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = "s";
      *(_DWORD *)buf = 138543874;
      v27 = v5;
      if (v11 == 1)
        v16 = "";
      v28 = 2048;
      v29 = v11;
      v30 = 2080;
      v31 = v16;
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Invoking %lu completion handler%s for developer token.", buf, 0x20u);
    }

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v17 = v10;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, buf, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v23;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v17);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v21) + 16))(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v21));
          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, buf, 16);
      }
      while (v19);
    }

  }
}

void __83__ICCloudServiceStatusMonitor__requestDeveloperTokenWithOptions_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v5 = a3;
  v6 = a1[6];
  v7 = a2;
  +[ICClientInfo defaultInfo](ICClientInfo, "defaultInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__ICCloudServiceStatusMonitor__requestDeveloperTokenWithOptions_completionHandler___block_invoke_2;
  v11[3] = &unk_1E4390C58;
  v9 = (void *)a1[5];
  v11[4] = a1[4];
  v12 = v5;
  v13 = v9;
  v10 = v5;
  objc_msgSend(v7, "requestDeveloperTokenWithOptions:clientInfo:completionHandler:", v6, v8, v11);

}

uint64_t __83__ICCloudServiceStatusMonitor__requestDeveloperTokenWithOptions_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__ICCloudServiceStatusMonitor__requestDeveloperTokenWithOptions_completionHandler___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = (void *)a1[4];
  v6 = a1[5];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v5, "_didEndRequestingTokenWithTransactionIdentifier:", v6);
  (*(void (**)(void))(a1[6] + 16))();

}

id __82__ICCloudServiceStatusMonitor_requestDeveloperTokenWithOptions_completionHandler___block_invoke()
{
  return objc_alloc_init(MEMORY[0x1E0C99DE8]);
}

+ (BOOL)_hasEntitlementForStatusAccessExemptedFromUserConsentRequirement
{
  if (_hasEntitlementForStatusAccessExemptedFromUserConsentRequirement_sOnceToken != -1)
    dispatch_once(&_hasEntitlementForStatusAccessExemptedFromUserConsentRequirement_sOnceToken, &__block_literal_global_151);
  return _hasEntitlementForStatusAccessExemptedFromUserConsentRequirement_sHasEntitlementForStatusAccessExemptedFromUserConsentRequirement;
}

uint64_t __95__ICCloudServiceStatusMonitor__hasEntitlementForStatusAccessExemptedFromUserConsentRequirement__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D4D070], "hasBoolEntitlement:shouldLogForMissingEntitlement:", CFSTR("com.apple.storekit.cloud-service-exempted-from-tcc-access"), 0);
  _hasEntitlementForStatusAccessExemptedFromUserConsentRequirement_sHasEntitlementForStatusAccessExemptedFromUserConsentRequirement = result;
  return result;
}

@end
