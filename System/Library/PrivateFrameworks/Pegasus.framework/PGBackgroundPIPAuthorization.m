@implementation PGBackgroundPIPAuthorization

- (PGBackgroundPIPAuthorization)initWithActivitySessionIdentifier:(id)a3 appBundleIdentifier:(id)a4 stateTransitionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGBackgroundPIPAuthorization *v12;
  PGBackgroundPIPAuthorization *v13;
  uint64_t v14;
  NSString *activitySessionIdentifier;
  uint64_t v16;
  id stateTransitionHandler;
  uint64_t v18;
  NSString *appBundleIdentifier;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  BSServiceConnection *connection;
  NSObject *v26;
  dispatch_queue_t v27;
  BSServiceConnection *v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  void *v33;
  _QWORD v34[4];
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  id location;
  objc_super v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGBackgroundPIPAuthorization.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  v40.receiver = self;
  v40.super_class = (Class)PGBackgroundPIPAuthorization;
  v12 = -[PGBackgroundPIPAuthorization init](&v40, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v12);
    v14 = objc_msgSend(v9, "copy");
    activitySessionIdentifier = v13->_activitySessionIdentifier;
    v13->_activitySessionIdentifier = (NSString *)v14;

    v16 = MEMORY[0x1B5E0FE80](v11);
    stateTransitionHandler = v13->_stateTransitionHandler;
    v13->_stateTransitionHandler = (id)v16;

    v18 = objc_msgSend(v10, "copy");
    appBundleIdentifier = v13->_appBundleIdentifier;
    v13->_appBundleIdentifier = (NSString *)v18;

    v20 = (void *)MEMORY[0x1E0D23018];
    objc_msgSend(MEMORY[0x1E0D23018], "defaultShellMachName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGBackgroundPIPServiceSpecification identifier](PGBackgroundPIPServiceSpecification, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "endpointForMachName:service:instance:", v21, v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D23010], "connectionWithEndpoint:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    connection = v13->_connection;
    v13->_connection = (BSServiceConnection *)v24;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = dispatch_queue_create("com.apple.pegasus.background-pip-authorization-request", v26);

    v28 = v13->_connection;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __109__PGBackgroundPIPAuthorization_initWithActivitySessionIdentifier_appBundleIdentifier_stateTransitionHandler___block_invoke;
    v34[3] = &unk_1E622FBD8;
    v29 = v27;
    v35 = v29;
    objc_copyWeak(&v38, &location);
    v30 = v9;
    v36 = v30;
    v37 = v10;
    -[BSServiceConnection configureConnection:](v28, "configureConnection:", v34);
    PGLogCommon();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "-[PGBackgroundPIPAuthorization initWithActivitySessionIdentifier:appBundleIdentifier:stateTransitionHandler:]";
      v43 = 2114;
      v44 = v30;
      _os_log_impl(&dword_1B0CD6000, v31, OS_LOG_TYPE_DEFAULT, "%s Authorizing identifier %{public}@", buf, 0x16u);
    }

    -[BSServiceConnection activate](v13->_connection, "activate");
    objc_destroyWeak(&v38);

    objc_destroyWeak(&location);
  }

  return v13;
}

void __109__PGBackgroundPIPAuthorization_initWithActivitySessionIdentifier_appBundleIdentifier_stateTransitionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v3 = a2;
  +[PGBackgroundPIPServiceSpecification interface](PGBackgroundPIPServiceSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v4);

  +[PGBackgroundPIPServiceSpecification serviceQuality](PGBackgroundPIPServiceSpecification, "serviceQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v5);

  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v3, "setInterfaceTarget:", WeakRetained);

  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __109__PGBackgroundPIPAuthorization_initWithActivitySessionIdentifier_appBundleIdentifier_stateTransitionHandler___block_invoke_2;
  v10[3] = &unk_1E622FB68;
  objc_copyWeak(&v13, (id *)(a1 + 56));
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v3, "setActivationHandler:", v10);
  objc_msgSend(v3, "setInterruptionHandler:", &__block_literal_global_5);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __109__PGBackgroundPIPAuthorization_initWithActivitySessionIdentifier_appBundleIdentifier_stateTransitionHandler___block_invoke_25;
  v8[3] = &unk_1E622FBB0;
  objc_copyWeak(&v9, (id *)(a1 + 56));
  objc_msgSend(v3, "setInvalidationHandler:", v8);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&v13);
}

void __109__PGBackgroundPIPAuthorization_initWithActivitySessionIdentifier_appBundleIdentifier_stateTransitionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PGLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[PGBackgroundPIPAuthorization initWithActivitySessionIdentifier:appBundleIdentifier:stateTransitionHandler:]_block_invoke_2";
    v10 = 2114;
    v11 = v3;
    _os_log_impl(&dword_1B0CD6000, v4, OS_LOG_TYPE_DEFAULT, "%s Connection Activated: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained && !objc_msgSend(WeakRetained, "state"))
  {
    objc_msgSend(v6, "_transitionToState:", 1);
    objc_msgSend(v3, "remoteTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "grantAuthorizationForActivitySessionWithIdentifier:bundleIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __109__PGBackgroundPIPAuthorization_initWithActivitySessionIdentifier_appBundleIdentifier_stateTransitionHandler___block_invoke_24(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[PGBackgroundPIPAuthorization initWithActivitySessionIdentifier:appBundleIdentifier:stateTransitionHandler:]_block_invoke";
    v6 = 2114;
    v7 = v2;
    _os_log_impl(&dword_1B0CD6000, v3, OS_LOG_TYPE_DEFAULT, "%s Received interruption for connection: %{public}@", (uint8_t *)&v4, 0x16u);
  }

  objc_msgSend(v2, "activate");
}

void __109__PGBackgroundPIPAuthorization_initWithActivitySessionIdentifier_appBundleIdentifier_stateTransitionHandler___block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PGLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[PGBackgroundPIPAuthorization initWithActivitySessionIdentifier:appBundleIdentifier:stateTransitionHandler:]_block_invoke";
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1B0CD6000, v4, OS_LOG_TYPE_DEFAULT, "%s Received invalidation for connection: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "revoke");

}

- (int64_t)state
{
  os_unfair_lock_s *p_lock;
  int64_t lock_state;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_state = self->_lock_state;
  os_unfair_lock_unlock(p_lock);
  return lock_state;
}

- (void)transitionToState:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  const __CFString *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertNotMain();
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "integerValue");
    if (v6 > 5)
      v7 = CFSTR("invalid");
    else
      v7 = off_1E622FC20[v6];
    v8 = 136315394;
    v9 = "-[PGBackgroundPIPAuthorization transitionToState:]";
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v8, 0x16u);
  }

  -[PGBackgroundPIPAuthorization _transitionToState:](self, "_transitionToState:", objc_msgSend(v4, "integerValue"));
}

- (void)_transitionToState:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_state >= a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_lock_state = a3;
    os_unfair_lock_unlock(p_lock);
    BSDispatchMain();
  }
}

void __51__PGBackgroundPIPAuthorization__transitionToState___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "stateTransitionHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)revoke
{
  void *v3;

  if (-[PGBackgroundPIPAuthorization state](self, "state") != 5)
  {
    -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "revokeAuthorization");

    -[BSServiceConnection invalidate](self->_connection, "invalidate");
    -[PGBackgroundPIPAuthorization _transitionToState:](self, "_transitionToState:", 5);
  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  NSString *activitySessionIdentifier;
  NSString *appBundleIdentifier;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)PGBackgroundPIPAuthorization;
  -[PGBackgroundPIPAuthorization description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  activitySessionIdentifier = self->_activitySessionIdentifier;
  appBundleIdentifier = self->_appBundleIdentifier;
  v7 = -[PGBackgroundPIPAuthorization state](self, "state");
  if (v7 > 5)
    v8 = CFSTR("invalid");
  else
    v8 = off_1E622FC20[v7];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@.%@ - %@"), v4, activitySessionIdentifier, appBundleIdentifier, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (-[PGBackgroundPIPAuthorization state](self, "state") != 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGBackgroundPIPAuthorization.m"), 121, CFSTR("Released %@ without revoking it first"), self);

  }
  v5.receiver = self;
  v5.super_class = (Class)PGBackgroundPIPAuthorization;
  -[PGBackgroundPIPAuthorization dealloc](&v5, sel_dealloc);
}

- (NSString)activitySessionIdentifier
{
  return self->_activitySessionIdentifier;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (id)stateTransitionHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateTransitionHandler, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activitySessionIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
