@implementation PBFPosterExtensionReloadDescriptorsOperation

- (BOOL)hasUniqueSessionInfo
{
  PRSPosterUpdateSessionInfo *sessionInfo;

  sessionInfo = self->_sessionInfo;
  if (sessionInfo)
    LOBYTE(sessionInfo) = -[PRSPosterUpdateSessionInfo isEmpty](sessionInfo, "isEmpty") ^ 1;
  return (char)sessionInfo;
}

- (NSArray)postRefreshPosterDescriptors
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  -[PFPosterPathsAssertion paths](self->_lock_postRefreshPosterPathsAssertion, "paths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  return (NSArray *)v3;
}

- (PBFPosterExtensionReloadDescriptorsOperation)initWithUpdatingService:(id)a3 extensionBundleIdentifier:(id)a4 sessionInfo:(id)a5 preRefreshPosterDescriptors:(id)a6 runtimeAssertionProvider:(id)a7 timeout:(double)a8 powerLogReason:(int64_t)a9
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  PBFPosterExtensionReloadDescriptorsOperation *v28;
  PBFPosterExtensionReloadDescriptorsOperation *v29;
  uint64_t v30;
  NSString *extensionBundleIdentifier;
  uint64_t v32;
  NSArray *preRefreshPosterDescriptors;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v44;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = v18;
  NSClassFromString(CFSTR("NSString"));
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionReloadDescriptorsOperation initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:].cold.1();
LABEL_44:
    objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA62B4CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionReloadDescriptorsOperation initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:].cold.1();
    objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA62BB0);
  }

  v23 = v19;
  if (v23)
  {
    NSClassFromString(CFSTR("PRSPosterUpdateSessionInfo"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterUpdateSessionInfoClass]"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionReloadDescriptorsOperation initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:].cold.9();
      goto LABEL_44;
    }
  }

  v24 = v20;
  NSClassFromString(CFSTR("NSArray"));
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionReloadDescriptorsOperation initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:].cold.2();
    objc_msgSend(objc_retainAutorelease(v37), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA62C14);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSArrayClass]"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionReloadDescriptorsOperation initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:].cold.2();
    objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA62C78);
  }

  v25 = v17;
  NSClassFromString(CFSTR("PRUpdatingService"));
  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionReloadDescriptorsOperation initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:].cold.3();
    objc_msgSend(objc_retainAutorelease(v39), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA62CDCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRUpdatingServiceClass]"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionReloadDescriptorsOperation initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:].cold.3();
    objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA62D40);
  }

  v26 = v21;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionReloadDescriptorsOperation initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:].cold.4();
    objc_msgSend(objc_retainAutorelease(v41), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA62DA4);
  }
  v27 = v26;
  if ((objc_msgSend(v26, "conformsToProtocol:", &unk_1EF9EC398) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFRuntimeAssertionProviding)]"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionReloadDescriptorsOperation initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:].cold.4();
    objc_msgSend(objc_retainAutorelease(v42), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA62E08);
  }

  if (BSFloatLessThanOrEqualToFloat())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("__objc_no == BSFloatLessThanOrEqualToFloat(timeoutInterval, 0)"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionReloadDescriptorsOperation initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:].cold.5();
    objc_msgSend(objc_retainAutorelease(v43), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA62E6CLL);
  }
  v44.receiver = self;
  v44.super_class = (Class)PBFPosterExtensionReloadDescriptorsOperation;
  v28 = -[NSBlockOperation init](&v44, sel_init);
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_updatingService, a3);
    v30 = objc_msgSend(v22, "copy");
    extensionBundleIdentifier = v29->_extensionBundleIdentifier;
    v29->_extensionBundleIdentifier = (NSString *)v30;

    objc_storeStrong((id *)&v29->_sessionInfo, a5);
    v32 = objc_msgSend(v24, "copy");
    preRefreshPosterDescriptors = v29->_preRefreshPosterDescriptors;
    v29->_preRefreshPosterDescriptors = (NSArray *)v32;

    v29->_timeoutInterval = a8;
    objc_storeStrong((id *)&v29->_runtimeAssertionProvider, a7);
    v29->_powerLogReason = a9;
    v29->_lock = 0;
    -[PBFPosterExtensionReloadDescriptorsOperation _setup](v29, "_setup");
  }

  return v29;
}

- (void)invalidateAssertionsWithCompletion:(id)a3
{
  id v4;
  RBSAssertion *lock_extensionPosterUpdateRuntimeAssertion;
  id v6;
  RBSAssertion *v7;
  unint64_t v8;
  RBSAssertion *lock_extensionPosterUpdateEntitledMemoryAssertion;
  void *v10;
  void *v11;
  void *v12;
  RBSAssertion *v13;
  RBSAssertion *v14;
  void *v15;
  void *v16;
  PFPosterPathsAssertion *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  RBSAssertion *v21;
  id v22;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  lock_extensionPosterUpdateRuntimeAssertion = self->_lock_extensionPosterUpdateRuntimeAssertion;
  if (self->_lock_postRefreshPosterPathsAssertion)
  {
    v6 = lock_extensionPosterUpdateRuntimeAssertion;
    v7 = self->_lock_extensionPosterUpdateRuntimeAssertion;
    self->_lock_extensionPosterUpdateRuntimeAssertion = 0;

    v8 = self->_lock_extensionPosterUpdateEntitledMemoryAssertion;
    lock_extensionPosterUpdateEntitledMemoryAssertion = self->_lock_extensionPosterUpdateEntitledMemoryAssertion;
    self->_lock_extensionPosterUpdateEntitledMemoryAssertion = 0;

    if ((unint64_t)v6 | v8)
    {
      v10 = (void *)MEMORY[0x1E0D016A0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __83__PBFPosterExtensionReloadDescriptorsOperation_invalidateAssertionsWithCompletion___block_invoke;
      v19[3] = &unk_1E86F4CA8;
      v20 = v6;
      v21 = (RBSAssertion *)(id)v8;
      v22 = v4;
      objc_msgSend(v10, "responderWithHandler:", v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTimeout:", dispatch_time(0, 120));
      dispatch_get_global_queue(25, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setQueue:", v12);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFPosterExtensionReloadDescriptorsOperation invalidateAssertionsWithCompletion:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PBFDispatchAsyncWithString(v16, QOS_CLASS_USER_INITIATED, v4);

      v11 = 0;
    }
    v17 = self->_lock_postRefreshPosterPathsAssertion;
    os_unfair_recursive_lock_unlock();
    -[PFPosterPathsAssertion invalidateWithResponder:](v17, "invalidateWithResponder:", v11);

  }
  else
  {
    if (!lock_extensionPosterUpdateRuntimeAssertion)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFPosterExtensionReloadDescriptorsOperation invalidateAssertionsWithCompletion:]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      PBFDispatchAsyncWithString(v18, QOS_CLASS_USER_INITIATED, v4);

      os_unfair_recursive_lock_unlock();
      goto LABEL_9;
    }
    self->_lock_extensionPosterUpdateRuntimeAssertion = 0;
    v6 = lock_extensionPosterUpdateRuntimeAssertion;

    v13 = self->_lock_extensionPosterUpdateEntitledMemoryAssertion;
    self->_lock_extensionPosterUpdateEntitledMemoryAssertion = 0;
    v14 = v13;

    os_unfair_recursive_lock_unlock();
    objc_msgSend(v6, "invalidate");
    -[RBSAssertion invalidate](v14, "invalidate");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFPosterExtensionReloadDescriptorsOperation invalidateAssertionsWithCompletion:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBFDispatchAsyncWithString(v15, QOS_CLASS_USER_INITIATED, v4);

  }
LABEL_9:

}

uint64_t __83__PBFPosterExtensionReloadDescriptorsOperation_invalidateAssertionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)dealloc
{
  RBSAssertion *lock_extensionPosterUpdateRuntimeAssertion;
  RBSAssertion *v4;
  RBSAssertion *lock_extensionPosterUpdateEntitledMemoryAssertion;
  RBSAssertion *v6;
  void *v7;
  const __CFString *extensionBundleIdentifier;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableArray *lock_completionObservers;
  objc_super v18;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  -[PBFPosterExtensionReloadDescriptorsOperation invalidateAssertionsWithCompletion:](self, "invalidateAssertionsWithCompletion:", 0);
  os_unfair_recursive_lock_lock_with_options();
  lock_extensionPosterUpdateRuntimeAssertion = self->_lock_extensionPosterUpdateRuntimeAssertion;
  if (lock_extensionPosterUpdateRuntimeAssertion)
  {
    -[RBSAssertion invalidate](lock_extensionPosterUpdateRuntimeAssertion, "invalidate");
    v4 = self->_lock_extensionPosterUpdateRuntimeAssertion;
    self->_lock_extensionPosterUpdateRuntimeAssertion = 0;

  }
  lock_extensionPosterUpdateEntitledMemoryAssertion = self->_lock_extensionPosterUpdateEntitledMemoryAssertion;
  if (lock_extensionPosterUpdateEntitledMemoryAssertion)
  {
    -[RBSAssertion invalidate](lock_extensionPosterUpdateEntitledMemoryAssertion, "invalidate");
    v6 = self->_lock_extensionPosterUpdateEntitledMemoryAssertion;
    self->_lock_extensionPosterUpdateEntitledMemoryAssertion = 0;

  }
  if (-[NSMutableArray count](self->_lock_completionObservers, "count"))
  {
    -[PBFPosterExtensionReloadDescriptorsOperation error](self, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

    }
    else if (!self->_lock_isFinished)
    {
      v19[0] = *MEMORY[0x1E0CB2D68];
      v19[1] = CFSTR("extensionBundleIdentifier");
      extensionBundleIdentifier = (const __CFString *)self->_extensionBundleIdentifier;
      if (!extensionBundleIdentifier)
        extensionBundleIdentifier = CFSTR("(unknown extension)");
      v20[0] = CFSTR("Operation failed to finish in time");
      v20[1] = extensionBundleIdentifier;
      v19[2] = CFSTR("operationClass");
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2] = v10;
      v19[3] = CFSTR("executionTime");
      v11 = (void *)MEMORY[0x1E0CB37E8];
      -[PBFPosterExtensionReloadDescriptorsOperation _lock_executionTime](self, "_lock_executionTime");
      objc_msgSend(v11, "numberWithDouble:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20[3] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 0, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterExtensionReloadDescriptorsOperation setError:](self, "setError:", v14);

    }
    v15 = (void *)-[NSMutableArray copy](self->_lock_completionObservers, "copy");
    -[PBFPosterExtensionReloadDescriptorsOperation error](self, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterExtensionReloadDescriptorsOperation _fireCompletionObservers:instance:error:](self, "_fireCompletionObservers:instance:error:", v15, 0, v16);

    -[NSMutableArray removeAllObjects](self->_lock_completionObservers, "removeAllObjects");
    lock_completionObservers = self->_lock_completionObservers;
    self->_lock_completionObservers = 0;

  }
  os_unfair_recursive_lock_unlock();
  v18.receiver = self;
  v18.super_class = (Class)PBFPosterExtensionReloadDescriptorsOperation;
  -[NSBlockOperation dealloc](&v18, sel_dealloc);
}

- (void)updatingService:(id)a3 didInvalidateWithError:(id)a4
{
  -[PBFPosterExtensionReloadDescriptorsOperation _finishWithError:postRefreshPosterPathsAssertion:](self, "_finishWithError:postRefreshPosterPathsAssertion:", a4, 0);
}

- (void)_setup
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__PBFPosterExtensionReloadDescriptorsOperation__setup__block_invoke;
  v3[3] = &unk_1E86F3C90;
  objc_copyWeak(&v4, &location);
  -[NSBlockOperation addExecutionBlock:](self, "addExecutionBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __54__PBFPosterExtensionReloadDescriptorsOperation__setup__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  dispatch_group_t v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  int v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  double v33;
  dispatch_time_t v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  uint8_t buf[4];
  id *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isCancelled") & 1) == 0 && (objc_msgSend(v2, "isFinished") & 1) == 0)
  {
    objc_msgSend(v2, "updatingService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (!v3 || (objc_msgSend(v3, "isValid") & 1) == 0)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v2, "_userInfoForErrors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pbf_dataStoreErrorWithCode:userInfo:", -2211, v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v2, "_finishWithError:postRefreshPosterPathsAssertion:", v5, 0);
LABEL_32:

      goto LABEL_33;
    }
    objc_msgSend(v4, "auditToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v2, "_userInfoForErrors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pbf_dataStoreErrorWithCode:userInfo:", -2210, v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v2, "_finishWithError:postRefreshPosterPathsAssertion:", v6, 0);
LABEL_31:

      goto LABEL_32;
    }
    objc_msgSend(v4, "target");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v2, "_userInfoForErrors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pbf_dataStoreErrorWithCode:userInfo:", -2209, v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v2, "_finishWithError:postRefreshPosterPathsAssertion:", v7, 0);
LABEL_30:

      goto LABEL_31;
    }
    objc_msgSend(v4, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_recursive_lock_lock_with_options();
    if (*((_BYTE *)v2 + 280))
    {
      os_unfair_recursive_lock_unlock();
      PBFLogReloadDescriptors();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v39 = v2;
        _os_log_impl(&dword_1CB9FA000, v8, OS_LOG_TYPE_DEFAULT, "(%{public}@)  Invalidated before operation started", buf, 0xCu);
      }
      goto LABEL_29;
    }
    PBFLogReloadDescriptors();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v2[46];
      *(_DWORD *)buf = 138412546;
      v39 = v2;
      v40 = 2112;
      v41 = v16;
      _os_log_impl(&dword_1CB9FA000, v15, OS_LOG_TYPE_DEFAULT, "(%@)  Starting reload operation for %@", buf, 0x16u);
    }

    BSAbsoluteMachTimeNow();
    v2[44] = v17;
    PBFLogReloadDescriptors();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v2[49];
      *(_DWORD *)buf = 138412546;
      v39 = v2;
      v40 = 2112;
      v41 = v19;
      _os_log_impl(&dword_1CB9FA000, v18, OS_LOG_TYPE_DEFAULT, "(%@)  Current understanding of paths: %@", buf, 0x16u);
    }

    objc_msgSend(v2[48], "acquirePosterUpdateRuntimeAssertionForReason:target:", CFSTR("reloadDescriptors"), v6);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v2[40];
    v2[40] = (id)v20;

    objc_msgSend(v2[48], "acquirePosterUpdateMemoryAssertionForReason:target:auditToken:posterProviderBundleIdentifier:", CFSTR("reloadDescriptors entitled update"), v6, v5, v7);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v2[41];
    v2[41] = (id)v22;

    v24 = dispatch_group_create();
    v25 = v2[38];
    v2[38] = v24;

    v8 = v24;
    dispatch_group_enter(v8);
    os_unfair_recursive_lock_unlock();
    objc_msgSend(v4, "addUpdatingServiceObserver:", v2);
    +[PBFPowerLogger logUpdate:reason:inServiceOfBundleIdentifier:](PBFPowerLogger, "logUpdate:reason:inServiceOfBundleIdentifier:", 1, v2[37], v7);
    objc_msgSend(v4, "invalidationError");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {

    }
    else if ((objc_msgSend(v4, "isValid") & 1) != 0)
    {
      v27 = v2[49];
      v28 = v2[36];
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __54__PBFPosterExtensionReloadDescriptorsOperation__setup__block_invoke_97;
      v37[3] = &unk_1E86F4CD0;
      v37[4] = v2;
      objc_msgSend(v4, "updateDescriptors:sessionInfo:completion:", v27, v28, v37);
      os_unfair_recursive_lock_lock_with_options();
      v29 = *((unsigned __int8 *)v2 + 280);
      os_unfair_recursive_lock_unlock();
      if (v29)
      {
        PBFLogReloadDescriptors();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v39 = v2;
          _os_log_impl(&dword_1CB9FA000, v30, OS_LOG_TYPE_DEFAULT, "(%{public}@)  Abort timeout check; operation has already finished.",
            buf,
            0xCu);
        }
        goto LABEL_28;
      }
      objc_msgSend(v2, "timeoutInterval");
      v34 = dispatch_time(0, (uint64_t)(v33 * 1000000000.0));
      if (!dispatch_group_wait(v8, v34))
        goto LABEL_29;
      v35 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v2, "_userInfoForErrors");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "pbf_dataStoreErrorWithCode:userInfo:", -2221, v36);
      v30 = objc_claimAutoreleasedReturnValue();

      PBFLogReloadDescriptors();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v2;
        _os_log_impl(&dword_1CB9FA000, v32, OS_LOG_TYPE_DEFAULT, "(%@)  Timed out!", buf, 0xCu);
      }
      goto LABEL_26;
    }
    objc_msgSend(v4, "invalidationError");
    v30 = objc_claimAutoreleasedReturnValue();
    if (v30)
    {
LABEL_27:
      objc_msgSend(v2, "_finishWithError:postRefreshPosterPathsAssertion:", v30, 0);
LABEL_28:

LABEL_29:
      goto LABEL_30;
    }
    v31 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v2, "_userInfoForErrors");
    v32 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "pbf_generalErrorWithCode:userInfo:", 3, v32);
    v30 = objc_claimAutoreleasedReturnValue();
LABEL_26:

    goto LABEL_27;
  }
LABEL_33:

}

void __54__PBFPosterExtensionReloadDescriptorsOperation__setup__block_invoke_97(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PBFLogReloadDescriptors();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __54__PBFPosterExtensionReloadDescriptorsOperation__setup__block_invoke_97_cold_1(a1, (uint64_t)v6, v8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "paths");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1CB9FA000, v8, OS_LOG_TYPE_DEFAULT, "(%{public}@)  finished with paths %{public}@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_finishWithError:postRefreshPosterPathsAssertion:", v6, v5);

}

- (void)cancel
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  PBFPosterExtensionReloadDescriptorsOperation *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PBFLogReloadDescriptors();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = self;
    _os_log_impl(&dword_1CB9FA000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@)  Cancel!", buf, 0xCu);
  }

  v4 = (void *)MEMORY[0x1E0CB35C8];
  -[PBFPosterExtensionReloadDescriptorsOperation _userInfoForErrors](self, "_userInfoForErrors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pbf_generalErrorWithCode:userInfo:", 4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterExtensionReloadDescriptorsOperation _finishWithError:postRefreshPosterPathsAssertion:](self, "_finishWithError:postRefreshPosterPathsAssertion:", v6, 0);

  v7.receiver = self;
  v7.super_class = (Class)PBFPosterExtensionReloadDescriptorsOperation;
  -[PBFPosterExtensionReloadDescriptorsOperation cancel](&v7, sel_cancel);
}

- (double)executionTime
{
  double v3;
  double v4;

  os_unfair_recursive_lock_lock_with_options();
  -[PBFPosterExtensionReloadDescriptorsOperation _lock_executionTime](self, "_lock_executionTime");
  v4 = v3;
  os_unfair_recursive_lock_unlock();
  return v4;
}

- (double)_lock_executionTime
{
  double lock_executionFinishDate;

  lock_executionFinishDate = self->_lock_executionFinishDate;
  if (lock_executionFinishDate == 0.0)
    BSAbsoluteMachTimeNow();
  return lock_executionFinishDate - self->_lock_executionStateDate;
}

- (void)addCompletionObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *lock_completionObservers;
  NSMutableArray *v9;
  NSMutableArray *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    os_unfair_recursive_lock_lock_with_options();
    if (self->_lock_isFinished)
    {
      os_unfair_recursive_lock_unlock();
      v5 = _Block_copy(v4);
      v12[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterExtensionReloadDescriptorsOperation error](self, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterExtensionReloadDescriptorsOperation _fireCompletionObservers:instance:error:](self, "_fireCompletionObservers:instance:error:", v6, self, v7);

    }
    else
    {
      lock_completionObservers = self->_lock_completionObservers;
      if (!lock_completionObservers)
      {
        v9 = (NSMutableArray *)objc_opt_new();
        v10 = self->_lock_completionObservers;
        self->_lock_completionObservers = v9;

        lock_completionObservers = self->_lock_completionObservers;
      }
      v11 = (void *)objc_msgSend(v4, "copy");
      -[NSMutableArray addObject:](lock_completionObservers, "addObject:", v11);

      os_unfair_recursive_lock_unlock();
    }
  }

}

- (void)_finishWithError:(id)a3 postRefreshPosterPathsAssertion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *lock_group;
  OS_dispatch_group *v10;
  double v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  int v18;
  PBFPosterExtensionReloadDescriptorsOperation *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_lock_isFinished)
  {
    v8 = 0;
  }
  else
  {
    lock_group = self->_lock_group;
    if (lock_group)
    {
      dispatch_group_leave(lock_group);
      v10 = self->_lock_group;
      self->_lock_group = 0;

    }
    self->_lock_isFinished = 1;
    BSAbsoluteMachTimeNow();
    self->_lock_executionFinishDate = v11;
    PBFLogReloadDescriptors();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v6)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionReloadDescriptorsOperation _finishWithError:postRefreshPosterPathsAssertion:].cold.1(self, (uint64_t)v6, v13);

      -[PBFPosterExtensionReloadDescriptorsOperation setError:](self, "setError:", v6);
      -[PBFPosterExtensionReloadDescriptorsOperation invalidateAssertionsWithCompletion:](self, "invalidateAssertionsWithCompletion:", 0);
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "paths");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PBFPosterExtensionReloadDescriptorsOperation preRefreshPosterDescriptors](self, "preRefreshPosterDescriptors");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqual:", v15) ^ 1;
        -[PBFPosterExtensionReloadDescriptorsOperation executionTime](self, "executionTime");
        v18 = 138544130;
        v19 = self;
        v20 = 1024;
        v21 = v16;
        v22 = 2114;
        v23 = v7;
        v24 = 2048;
        v25 = v17;
        _os_log_impl(&dword_1CB9FA000, v13, OS_LOG_TYPE_DEFAULT, "(%{public}@)  Finished SUCCESSFULLY; Has modified paths? %{BOOL}d -- '%{public}@' -- execution time: %f",
          (uint8_t *)&v18,
          0x26u);

      }
      objc_storeStrong((id *)&self->_lock_postRefreshPosterPathsAssertion, a4);
    }
    v8 = (void *)-[NSMutableArray copy](self->_lock_completionObservers, "copy");
    -[NSMutableArray removeAllObjects](self->_lock_completionObservers, "removeAllObjects");
  }
  os_unfair_recursive_lock_unlock();
  -[PBFPosterExtensionReloadDescriptorsOperation _fireCompletionObservers:instance:error:](self, "_fireCompletionObservers:instance:error:", v8, self, v6);

}

- (id)_userInfoForErrors
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  v12[0] = CFSTR("extensionBundleIdentifier");
  v3 = -[NSString copy](self->_extensionBundleIdentifier, "copy");
  v4 = (void *)v3;
  v5 = CFSTR("(null)");
  if (v3)
    v5 = (const __CFString *)v3;
  v13[0] = v5;
  v12[1] = CFSTR("timeoutInterval");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeoutInterval);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("preRefreshPosterDescriptors");
  -[NSArray description](self->_preRefreshPosterDescriptors, "description");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("null");
  if (v7)
    v9 = (const __CFString *)v7;
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_unlock();
  return v10;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v5, self, self->_extensionBundleIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)_fireCompletionObservers:(id)a3 instance:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v7);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFPosterExtensionReloadDescriptorsOperation _fireCompletionObservers:instance:error:]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __88__PBFPosterExtensionReloadDescriptorsOperation__fireCompletionObservers_instance_error___block_invoke;
        v16[3] = &unk_1E86F2E08;
        v19 = v14;
        v17 = v8;
        v18 = v9;
        PBFDispatchAsyncWithString(v15, QOS_CLASS_DEFAULT, v16);

      }
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

}

uint64_t __88__PBFPosterExtensionReloadDescriptorsOperation__fireCompletionObservers_instance_error___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (double)executionStartDate
{
  return self->_lock_executionStateDate;
}

- (double)executionFinishDate
{
  return self->_lock_executionFinishDate;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (PRUpdatingService)updatingService
{
  return self->_updatingService;
}

- (PBFRuntimeAssertionProviding)runtimeAssertionProvider
{
  return self->_runtimeAssertionProvider;
}

- (NSArray)preRefreshPosterDescriptors
{
  return (NSArray *)objc_getProperty(self, a2, 392, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 400, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (PFPosterPathsAssertion)postRefreshPosterPathsAssertion
{
  return (PFPosterPathsAssertion *)objc_getProperty(self, a2, 408, 1);
}

- (void)setPostRefreshPosterPathsAssertion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 408);
}

- (BOOL)didTimeout
{
  return self->_didTimeout;
}

- (void)setDidTimeout:(BOOL)a3
{
  self->_didTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postRefreshPosterPathsAssertion, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_preRefreshPosterDescriptors, 0);
  objc_storeStrong((id *)&self->_runtimeAssertionProvider, 0);
  objc_storeStrong((id *)&self->_updatingService, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_extensionPosterUpdateEntitledMemoryAssertion, 0);
  objc_storeStrong((id *)&self->_lock_extensionPosterUpdateRuntimeAssertion, 0);
  objc_storeStrong((id *)&self->_lock_postRefreshPosterPathsAssertion, 0);
  objc_storeStrong((id *)&self->_lock_group, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_lock_completionObservers, 0);
}

- (void)initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:.cold.5()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:.cold.9()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __54__PBFPosterExtensionReloadDescriptorsOperation__setup__block_invoke_97_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1CB9FA000, log, OS_LOG_TYPE_ERROR, "(%{public}@)  finished with error: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)_finishWithError:(NSObject *)a3 postRefreshPosterPathsAssertion:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "executionTime");
  v7 = 138543874;
  v8 = a1;
  v9 = 2114;
  v10 = a2;
  v11 = 2048;
  v12 = v6;
  _os_log_error_impl(&dword_1CB9FA000, a3, OS_LOG_TYPE_ERROR, "(%{public}@)  Finished unsuccessfully; error: '%{public}@' -- execution time: %f",
    (uint8_t *)&v7,
    0x20u);
}

@end
