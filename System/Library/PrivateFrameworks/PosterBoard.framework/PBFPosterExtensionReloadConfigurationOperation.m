@implementation PBFPosterExtensionReloadConfigurationOperation

- (BOOL)hasUniqueSessionInfo
{
  PRSPosterUpdateSessionInfo *sessionInfo;

  sessionInfo = self->_sessionInfo;
  if (sessionInfo)
    LOBYTE(sessionInfo) = -[PRSPosterUpdateSessionInfo isEmpty](sessionInfo, "isEmpty") ^ 1;
  return (char)sessionInfo;
}

- (PFPosterPath)postRefreshPosterConfiguration
{
  void *v3;
  void *v4;

  os_unfair_recursive_lock_lock_with_options();
  -[PFPosterPathsAssertion paths](self->_lock_postRefreshPosterPathsAssertion, "paths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_unlock();
  return (PFPosterPath *)v4;
}

- (PBFPosterExtensionReloadConfigurationOperation)initWithUpdatingService:(id)a3 sessionInfo:(id)a4 existingConfigurationPath:(id)a5 locationInUse:(BOOL)a6 runtimeAssertionProvider:(id)a7 behaviorAssertionProvider:(id)a8 timeout:(double)a9 powerLogReason:(int64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  PBFPosterExtensionReloadConfigurationOperation *v28;
  PBFPosterExtensionReloadConfigurationOperation *v29;
  uint64_t v30;
  NSString *extensionBundleIdentifier;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v44;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  v21 = v17;
  if (v21)
  {
    NSClassFromString(CFSTR("PRSPosterUpdateSessionInfo"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterUpdateSessionInfoClass]"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionReloadConfigurationOperation initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:].cold.10();
LABEL_44:
      objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAAB5E8);
    }
  }

  v22 = v18;
  NSClassFromString(CFSTR("PFPosterPath"));
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionReloadConfigurationOperation initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:].cold.1();
    goto LABEL_44;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFPosterPathClass]"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionReloadConfigurationOperation initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:].cold.1();
    objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAAB64CLL);
  }

  v23 = v16;
  NSClassFromString(CFSTR("PRUpdatingService"));
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionReloadConfigurationOperation initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:].cold.2();
    objc_msgSend(objc_retainAutorelease(v35), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAAB6B0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRUpdatingServiceClass]"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionReloadConfigurationOperation initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:].cold.2();
    objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAAB714);
  }

  v24 = v19;
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionReloadConfigurationOperation initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:].cold.3();
    objc_msgSend(objc_retainAutorelease(v37), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAAB778);
  }
  v25 = v24;
  if ((objc_msgSend(v24, "conformsToProtocol:", &unk_1EF9EC398) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFRuntimeAssertionProviding)]"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionReloadConfigurationOperation initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:].cold.3();
    objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAAB7DCLL);
  }

  v26 = v20;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionReloadConfigurationOperation initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:].cold.4();
    objc_msgSend(objc_retainAutorelease(v39), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAAB840);
  }
  v27 = v26;
  if ((objc_msgSend(v26, "conformsToProtocol:", &unk_1EF9CF080) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object conformsToProtocol:@protocol(PBFBehaviorAssertionProviding)]"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionReloadConfigurationOperation initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:].cold.4();
    objc_msgSend(objc_retainAutorelease(v40), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAAB8A4);
  }

  if (BSFloatLessThanOrEqualToFloat())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("__objc_no == BSFloatLessThanOrEqualToFloat(timeoutInterval, 0)"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionReloadConfigurationOperation initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:].cold.5();
    objc_msgSend(objc_retainAutorelease(v41), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAAB908);
  }
  v44.receiver = self;
  v44.super_class = (Class)PBFPosterExtensionReloadConfigurationOperation;
  v28 = -[NSBlockOperation init](&v44, sel_init);
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_updatingService, a3);
    objc_msgSend(v23, "bundleIdentifier");
    v30 = objc_claimAutoreleasedReturnValue();
    extensionBundleIdentifier = v29->_extensionBundleIdentifier;
    v29->_extensionBundleIdentifier = (NSString *)v30;

    objc_storeStrong((id *)&v29->_sessionInfo, a4);
    objc_storeStrong((id *)&v29->_runtimeAssertionProvider, a7);
    objc_storeStrong((id *)&v29->_behaviorAssertionProvider, a8);
    -[PBFPosterExtensionReloadConfigurationOperation setPreRefreshPosterConfiguration:](v29, "setPreRefreshPosterConfiguration:", v22);
    v29->_timeoutInterval = a9;
    v29->_locationInUse = a6;
    v29->_reason = a10;
    v29->_lock = 0;
    -[PBFPosterExtensionReloadConfigurationOperation _setup](v29, "_setup");
  }

  return v29;
}

- (void)invalidateAssertionsWithCompletion:(id)a3
{
  id v4;
  RBSAssertion *lock_posterBoardPosterUpdateRuntimeAssertion;
  BSInvalidatable *lock_snapshotterDisabledAssertion;
  RBSAssertion *lock_extensionPosterUpdateRuntimeAssertion;
  id v8;
  RBSAssertion *v9;
  unint64_t v10;
  RBSAssertion *lock_extensionPosterUpdateEntitledMemoryAssertion;
  CLInUseAssertion *v12;
  CLInUseAssertion *lock_locationInUseAssertion;
  void *v14;
  void *v15;
  void *v16;
  RBSAssertion *v17;
  RBSAssertion *v18;
  CLInUseAssertion *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  PFPosterPathsAssertion *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  RBSAssertion *v28;
  id v29;
  uint8_t buf[4];
  CLInUseAssertion *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[RBSAssertion invalidate](self->_lock_posterBoardPosterUpdateRuntimeAssertion, "invalidate");
  lock_posterBoardPosterUpdateRuntimeAssertion = self->_lock_posterBoardPosterUpdateRuntimeAssertion;
  self->_lock_posterBoardPosterUpdateRuntimeAssertion = 0;

  -[BSInvalidatable invalidate](self->_lock_snapshotterDisabledAssertion, "invalidate");
  lock_snapshotterDisabledAssertion = self->_lock_snapshotterDisabledAssertion;
  self->_lock_snapshotterDisabledAssertion = 0;

  lock_extensionPosterUpdateRuntimeAssertion = self->_lock_extensionPosterUpdateRuntimeAssertion;
  if (self->_lock_postRefreshPosterPathsAssertion)
  {
    v8 = lock_extensionPosterUpdateRuntimeAssertion;
    v9 = self->_lock_extensionPosterUpdateRuntimeAssertion;
    self->_lock_extensionPosterUpdateRuntimeAssertion = 0;

    v10 = self->_lock_extensionPosterUpdateEntitledMemoryAssertion;
    lock_extensionPosterUpdateEntitledMemoryAssertion = self->_lock_extensionPosterUpdateEntitledMemoryAssertion;
    self->_lock_extensionPosterUpdateEntitledMemoryAssertion = 0;

    v12 = self->_lock_locationInUseAssertion;
    lock_locationInUseAssertion = self->_lock_locationInUseAssertion;
    self->_lock_locationInUseAssertion = 0;

    if ((unint64_t)v8 | v10)
    {
      v14 = (void *)MEMORY[0x1E0D016A0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __85__PBFPosterExtensionReloadConfigurationOperation_invalidateAssertionsWithCompletion___block_invoke;
      v26[3] = &unk_1E86F4CA8;
      v27 = v8;
      v28 = (RBSAssertion *)(id)v10;
      v29 = v4;
      objc_msgSend(v14, "responderWithHandler:", v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTimeout:", dispatch_time(0, 120));
      dispatch_get_global_queue(25, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setQueue:", v16);

    }
    else
    {
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFPosterExtensionReloadConfigurationOperation invalidateAssertionsWithCompletion:]");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        PBFDispatchAsyncWithString(v22, QOS_CLASS_USER_INITIATED, v4);

      }
      v15 = 0;
    }
    v23 = self->_lock_postRefreshPosterPathsAssertion;
    os_unfair_recursive_lock_unlock();
    if (v12)
    {
      -[CLInUseAssertion invalidate](v12, "invalidate");
      PBFLogReloadConfiguration();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v31 = v12;
        _os_log_impl(&dword_1CB9FA000, v24, OS_LOG_TYPE_DEFAULT, "invalidating CLInUseAssertion: %{public}@", buf, 0xCu);
      }

    }
    -[PFPosterPathsAssertion invalidateWithResponder:](v23, "invalidateWithResponder:", v15);

LABEL_19:
    goto LABEL_20;
  }
  if (lock_extensionPosterUpdateRuntimeAssertion)
  {
    v8 = lock_extensionPosterUpdateRuntimeAssertion;
    v17 = self->_lock_extensionPosterUpdateRuntimeAssertion;
    self->_lock_extensionPosterUpdateRuntimeAssertion = 0;

    v10 = self->_lock_extensionPosterUpdateEntitledMemoryAssertion;
    v18 = self->_lock_extensionPosterUpdateEntitledMemoryAssertion;
    self->_lock_extensionPosterUpdateEntitledMemoryAssertion = 0;

    v12 = self->_lock_locationInUseAssertion;
    v19 = self->_lock_locationInUseAssertion;
    self->_lock_locationInUseAssertion = 0;

    os_unfair_recursive_lock_unlock();
    objc_msgSend(v8, "invalidate");
    objc_msgSend((id)v10, "invalidate");
    if (v12)
    {
      -[CLInUseAssertion invalidate](v12, "invalidate");
      PBFLogReloadConfiguration();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v31 = v12;
        _os_log_impl(&dword_1CB9FA000, v20, OS_LOG_TYPE_DEFAULT, "invalidating CLInUseAssertion: %{public}@", buf, 0xCu);
      }

    }
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFPosterExtensionReloadConfigurationOperation invalidateAssertionsWithCompletion:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      PBFDispatchAsyncWithString(v21, QOS_CLASS_USER_INITIATED, v4);

    }
    goto LABEL_19;
  }
  os_unfair_recursive_lock_unlock();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFPosterExtensionReloadConfigurationOperation invalidateAssertionsWithCompletion:]");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBFDispatchAsyncWithString(v25, QOS_CLASS_USER_INITIATED, v4);

  }
LABEL_20:

}

uint64_t __85__PBFPosterExtensionReloadConfigurationOperation_invalidateAssertionsWithCompletion___block_invoke(uint64_t a1)
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
  CLInUseAssertion *lock_locationInUseAssertion;
  CLInUseAssertion *v8;
  void *v9;
  const __CFString *extensionBundleIdentifier;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableArray *lock_completionObservers;
  objc_super v20;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  -[PBFPosterExtensionReloadConfigurationOperation invalidateAssertionsWithCompletion:](self, "invalidateAssertionsWithCompletion:", 0);
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
  lock_locationInUseAssertion = self->_lock_locationInUseAssertion;
  if (lock_locationInUseAssertion)
  {
    -[CLInUseAssertion invalidate](lock_locationInUseAssertion, "invalidate");
    v8 = self->_lock_locationInUseAssertion;
    self->_lock_locationInUseAssertion = 0;

  }
  if (-[NSMutableArray count](self->_lock_completionObservers, "count"))
  {
    -[PBFPosterExtensionReloadConfigurationOperation error](self, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

    }
    else if (!self->_lock_isFinished)
    {
      v21[0] = *MEMORY[0x1E0CB2D68];
      v21[1] = CFSTR("extensionBundleIdentifier");
      extensionBundleIdentifier = (const __CFString *)self->_extensionBundleIdentifier;
      if (!extensionBundleIdentifier)
        extensionBundleIdentifier = CFSTR("(unknown extension)");
      v22[0] = CFSTR("Operation failed to finish in time");
      v22[1] = extensionBundleIdentifier;
      v21[2] = CFSTR("operationClass");
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22[2] = v12;
      v21[3] = CFSTR("executionTime");
      v13 = (void *)MEMORY[0x1E0CB37E8];
      -[PBFPosterExtensionReloadConfigurationOperation _lock_executionTime](self, "_lock_executionTime");
      objc_msgSend(v13, "numberWithDouble:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22[3] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 0, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterExtensionReloadConfigurationOperation setError:](self, "setError:", v16);

    }
    v17 = (void *)-[NSMutableArray copy](self->_lock_completionObservers, "copy");
    -[PBFPosterExtensionReloadConfigurationOperation error](self, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterExtensionReloadConfigurationOperation _fireCompletionObservers:instance:error:](self, "_fireCompletionObservers:instance:error:", v17, 0, v18);

    -[NSMutableArray removeAllObjects](self->_lock_completionObservers, "removeAllObjects");
    lock_completionObservers = self->_lock_completionObservers;
    self->_lock_completionObservers = 0;

  }
  os_unfair_recursive_lock_unlock();
  v20.receiver = self;
  v20.super_class = (Class)PBFPosterExtensionReloadConfigurationOperation;
  -[NSBlockOperation dealloc](&v20, sel_dealloc);
}

- (void)updatingService:(id)a3 didInvalidateWithError:(id)a4
{
  -[PBFPosterExtensionReloadConfigurationOperation _finishWithError:postRefreshPosterPathsAssertion:](self, "_finishWithError:postRefreshPosterPathsAssertion:", a4, 0);
}

- (void)assertionProviderDidAcquireSnapshotterDisabledAssertion:(id)a3 forExtensionIdentifier:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  -[PBFPosterExtensionReloadConfigurationOperation _userInfoForErrors](self, "_userInfoForErrors", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pbf_dataStoreErrorWithCode:userInfo:", -2204, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[PBFPosterExtensionReloadConfigurationOperation _finishWithError:postRefreshPosterPathsAssertion:](self, "_finishWithError:postRefreshPosterPathsAssertion:", v7, 0);
}

- (void)_setup
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__PBFPosterExtensionReloadConfigurationOperation__setup__block_invoke;
  v3[3] = &unk_1E86F3C90;
  objc_copyWeak(&v4, &location);
  -[NSBlockOperation addExecutionBlock:](self, "addExecutionBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __56__PBFPosterExtensionReloadConfigurationOperation__setup__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  dispatch_group_t v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  dispatch_time_t v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  _QWORD v69[5];
  id v70;
  uint8_t buf[4];
  uint64_t v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (uint64_t)WeakRetained;
  if (WeakRetained
    && (objc_msgSend(WeakRetained, "isCancelled") & 1) == 0
    && (objc_msgSend((id)v3, "isFinished") & 1) == 0)
  {
    objc_msgSend((id)v3, "updatingService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4 || (objc_msgSend(v4, "isValid") & 1) == 0)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend((id)v3, "_userInfoForErrors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pbf_dataStoreErrorWithCode:userInfo:", -2211, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)v3, "_finishWithError:postRefreshPosterPathsAssertion:", v16, 0);
LABEL_42:

      goto LABEL_43;
    }
    objc_msgSend(v5, "auditToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend((id)v3, "_userInfoForErrors");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pbf_dataStoreErrorWithCode:userInfo:", -2210, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)v3, "_finishWithError:postRefreshPosterPathsAssertion:", v19, 0);
LABEL_41:

      goto LABEL_42;
    }
    objc_msgSend(v5, "target");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend((id)v3, "_userInfoForErrors");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "pbf_dataStoreErrorWithCode:userInfo:", -2209, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)v3, "_finishWithError:postRefreshPosterPathsAssertion:", v22, 0);
LABEL_40:

      goto LABEL_41;
    }
    objc_msgSend(v5, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v3, "behaviorAssertionProvider");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "activeEditingSessionAssertionExtensionIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v8);

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend((id)v3, "_userInfoForErrors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pbf_dataStoreErrorWithCode:userInfo:", -2204, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)v3, "_finishWithError:postRefreshPosterPathsAssertion:", v13, 0);
LABEL_39:

      goto LABEL_40;
    }
    os_unfair_recursive_lock_lock_with_options();
    if (*(_BYTE *)(v3 + 304))
    {
      os_unfair_recursive_lock_unlock();
      PBFLogReloadConfiguration();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v72 = v3;
        _os_log_impl(&dword_1CB9FA000, v23, OS_LOG_TYPE_DEFAULT, "(%{public}@)  Invalidated before operation started", buf, 0xCu);
      }

      goto LABEL_39;
    }
    PBFLogReloadConfiguration();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)v3, "preRefreshPosterConfiguration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "serverIdentity");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "provider");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v72 = v3;
      v73 = 2114;
      v74 = v27;
      _os_log_impl(&dword_1CB9FA000, v24, OS_LOG_TYPE_DEFAULT, "(%{public}@)  Starting reload configuration operation for %{public}@", buf, 0x16u);

    }
    BSAbsoluteMachTimeNow();
    *(_QWORD *)(v3 + 384) = v28;
    PBFLogReloadConfiguration();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)v3, "preRefreshPosterConfiguration");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v72 = v3;
      v73 = 2114;
      v74 = v30;
      _os_log_impl(&dword_1CB9FA000, v29, OS_LOG_TYPE_DEFAULT, "(%{public}@)  Current understanding of paths: %{public}@", buf, 0x16u);

    }
    v31 = *(void **)(v3 + 416);
    objc_msgSend(CFSTR("_stateLock_enqueueRefreshPosterConfigurationMatchingUUID refreshPosterConfiguration"), "stringByAppendingString:", v8);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "acquirePosterUpdateRuntimeAssertionForReason:target:", v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = *(void **)(v3 + 352);
    *(_QWORD *)(v3 + 352) = v34;

    objc_msgSend(*(id *)(v3 + 416), "acquirePosterUpdateRuntimeAssertionForReason:target:", CFSTR("reloadConfiguration"), v7);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = *(void **)(v3 + 320);
    *(_QWORD *)(v3 + 320) = v36;

    objc_msgSend(*(id *)(v3 + 416), "acquirePosterUpdateMemoryAssertionForReason:target:auditToken:posterProviderBundleIdentifier:", CFSTR("reloadConfiguration entitled update"), v7, v6, v8);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = *(void **)(v3 + 328);
    *(_QWORD *)(v3 + 328) = v38;

    objc_msgSend(*(id *)(v3 + 424), "acquireSnapshotterDisabledAssertionForProvider:withReason:", v8, CFSTR("refreshPosterConfiguration"));
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = *(void **)(v3 + 344);
    *(_QWORD *)(v3 + 344) = v40;

    if (*(_BYTE *)(v3 + 368))
    {
      v42 = objc_msgSend(MEMORY[0x1E0C9E3A8], "newAssertionForBundleIdentifier:withReason:level:", v8, CFSTR("background update of in-use poster"), 0);
      v43 = *(void **)(v3 + 336);
      *(_QWORD *)(v3 + 336) = v42;

      PBFLogReloadConfiguration();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = *(_QWORD *)(v3 + 336);
        *(_DWORD *)buf = 134218242;
        v72 = v45;
        v73 = 2114;
        v74 = v8;
        _os_log_impl(&dword_1CB9FA000, v44, OS_LOG_TYPE_DEFAULT, "created CLInUseAssertion=%p for background update of %{public}@", buf, 0x16u);
      }

    }
    v46 = dispatch_group_create();
    v47 = *(void **)(v3 + 296);
    *(_QWORD *)(v3 + 296) = v46;

    v48 = v46;
    dispatch_group_enter(v48);
    os_unfair_recursive_lock_unlock();
    objc_msgSend(v5, "addUpdatingServiceObserver:", v3);
    objc_msgSend(v68, "addBehaviorAssertionObserver:", v3);
    +[PBFPowerLogger logUpdate:reason:inServiceOfBundleIdentifier:](PBFPowerLogger, "logUpdate:reason:inServiceOfBundleIdentifier:", 2, *(_QWORD *)(v3 + 360), v8);
    objc_msgSend(v5, "invalidationError");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49 || (objc_msgSend(v5, "isValid") & 1) == 0)
    {

    }
    else
    {
      objc_msgSend(v68, "activeEditingSessionAssertionExtensionIdentifiers");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "containsObject:", v8);

      if (!v51)
      {
        objc_msgSend((id)v3, "preRefreshPosterConfiguration");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = *(_QWORD *)(v3 + 288);
        v69[0] = MEMORY[0x1E0C809B0];
        v69[1] = 3221225472;
        v69[2] = __56__PBFPosterExtensionReloadConfigurationOperation__setup__block_invoke_126;
        v69[3] = &unk_1E86F69F8;
        v69[4] = v3;
        objc_copyWeak(&v70, v1);
        objc_msgSend(v5, "updateConfiguration:sessionInfo:completion:", v52, v53, v69);

        os_unfair_recursive_lock_lock_with_options();
        LODWORD(v53) = *(unsigned __int8 *)(v3 + 304);
        os_unfair_recursive_lock_unlock();
        if ((_DWORD)v53)
        {
          PBFLogReloadConfiguration();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v72 = v3;
            _os_log_impl(&dword_1CB9FA000, v54, OS_LOG_TYPE_DEFAULT, "(%{public}@)  Abort timeout check; operation has already finished.",
              buf,
              0xCu);
          }

          objc_destroyWeak(&v70);
          goto LABEL_39;
        }
        objc_msgSend((id)v3, "timeoutInterval");
        v63 = dispatch_time(0, (uint64_t)(v62 * 1000000000.0));
        if (dispatch_group_wait(v48, v63))
        {
          v64 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend((id)v3, "_userInfoForErrors");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "pbf_dataStoreErrorWithCode:userInfo:", -2221, v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          PBFLogReloadConfiguration();
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            __56__PBFPosterExtensionReloadConfigurationOperation__setup__block_invoke_cold_1(v3, v67);

          objc_msgSend((id)v3, "_finishWithError:postRefreshPosterPathsAssertion:", v66, 0);
        }
        objc_destroyWeak(&v70);
        goto LABEL_38;
      }
    }
    objc_msgSend(v5, "invalidationError");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v55)
    {
      objc_msgSend(v68, "activeEditingSessionAssertionExtensionIdentifiers");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "containsObject:", v8);

      if (!v57
        || (v58 = (void *)MEMORY[0x1E0CB35C8],
            objc_msgSend((id)v3, "_userInfoForErrors"),
            v59 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v58, "pbf_dataStoreErrorWithCode:userInfo:", -2204, v59),
            v55 = (void *)objc_claimAutoreleasedReturnValue(),
            v59,
            !v55))
      {
        v60 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend((id)v3, "_userInfoForErrors");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "pbf_generalErrorWithCode:userInfo:", 3, v61);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend((id)v3, "_finishWithError:postRefreshPosterPathsAssertion:", v55, 0);

LABEL_38:
    goto LABEL_39;
  }
LABEL_43:

}

void __56__PBFPosterExtensionReloadConfigurationOperation__setup__block_invoke_126(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id WeakRetained;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PBFLogReloadConfiguration();
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
    v11 = 138543618;
    v12 = v9;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1CB9FA000, v8, OS_LOG_TYPE_DEFAULT, "(%{public}@)  finished with paths %{public}@", (uint8_t *)&v11, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_finishWithError:postRefreshPosterPathsAssertion:", v6, v5);

}

- (void)cancel
{
  -[PBFPosterExtensionReloadConfigurationOperation cancelWithError:](self, "cancelWithError:", 0);
}

- (void)cancelWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  PBFPosterExtensionReloadConfigurationOperation *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBFLogReloadConfiguration();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@)  Cancel with error: %{public}@", buf, 0x16u);
  }

  if (v4)
  {
    -[PBFPosterExtensionReloadConfigurationOperation _finishWithError:postRefreshPosterPathsAssertion:](self, "_finishWithError:postRefreshPosterPathsAssertion:", v4, 0);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    -[PBFPosterExtensionReloadConfigurationOperation _userInfoForErrors](self, "_userInfoForErrors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pbf_generalErrorWithCode:userInfo:", 4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterExtensionReloadConfigurationOperation _finishWithError:postRefreshPosterPathsAssertion:](self, "_finishWithError:postRefreshPosterPathsAssertion:", v8, 0);

  }
  v9.receiver = self;
  v9.super_class = (Class)PBFPosterExtensionReloadConfigurationOperation;
  -[PBFPosterExtensionReloadConfigurationOperation cancel](&v9, sel_cancel);

}

- (double)executionTime
{
  double v3;
  double v4;

  os_unfair_recursive_lock_lock_with_options();
  -[PBFPosterExtensionReloadConfigurationOperation _lock_executionTime](self, "_lock_executionTime");
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
      -[PBFPosterExtensionReloadConfigurationOperation error](self, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterExtensionReloadConfigurationOperation _fireCompletionObservers:instance:error:](self, "_fireCompletionObservers:instance:error:", v6, self, v7);

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

- (void)assertionProviderDidAcquireEditingSessionAssertion:(id)a3 forExtensionIdentifier:(id)a4
{
  _BOOL4 lock_isFinished;
  char v6;
  void *v7;
  void *v8;
  id v9;

  os_unfair_recursive_lock_lock_with_options();
  lock_isFinished = self->_lock_isFinished;
  os_unfair_recursive_lock_unlock();
  if ((-[PBFPosterExtensionReloadConfigurationOperation isFinished](self, "isFinished") & 1) == 0)
  {
    v6 = -[PBFPosterExtensionReloadConfigurationOperation isCancelled](self, "isCancelled");
    if (!lock_isFinished && (v6 & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      -[PBFPosterExtensionReloadConfigurationOperation _userInfoForErrors](self, "_userInfoForErrors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pbf_dataStoreErrorWithCode:userInfo:", -2204, v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      -[PBFPosterExtensionReloadConfigurationOperation cancelWithError:](self, "cancelWithError:", v9);
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
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  PBFPosterExtensionReloadConfigurationOperation *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
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
    -[PBFPosterExtensionReloadConfigurationOperation behaviorAssertionProvider](self, "behaviorAssertionProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeBehaviorAssertionObserver:", self);

    -[PBFPosterExtensionReloadConfigurationOperation updatingService](self, "updatingService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeUpdatingServiceObserver:", self);

    if (v6)
      goto LABEL_6;
    objc_msgSend(v7, "paths");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16 == 1)
      goto LABEL_11;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Extension did not return appropriate path data : %@"), v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v19);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
LABEL_6:
      PBFLogReloadConfiguration();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[PBFPosterExtensionReloadDescriptorsOperation _finishWithError:postRefreshPosterPathsAssertion:].cold.1(self, (uint64_t)v6, v14);

      -[PBFPosterExtensionReloadConfigurationOperation setError:](self, "setError:", v6);
      -[PBFPosterExtensionReloadConfigurationOperation invalidateAssertionsWithCompletion:](self, "invalidateAssertionsWithCompletion:", 0);
    }
    else
    {
LABEL_11:
      PBFLogReloadConfiguration();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "paths");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PBFPosterExtensionReloadConfigurationOperation preRefreshPosterConfiguration](self, "preRefreshPosterConfiguration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v22;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v21, "isEqual:", v23) ^ 1;
        -[PBFPosterExtensionReloadConfigurationOperation executionTime](self, "executionTime");
        *(_DWORD *)buf = 138544130;
        v28 = self;
        v29 = 1024;
        v30 = v24;
        v31 = 2114;
        v32 = v7;
        v33 = 2048;
        v34 = v25;
        _os_log_impl(&dword_1CB9FA000, v20, OS_LOG_TYPE_DEFAULT, "(%{public}@)  Finished SUCCESSFULLY; Has modified paths? %{BOOL}d -- '%{public}@' -- execution time: %f",
          buf,
          0x26u);

      }
      objc_storeStrong((id *)&self->_lock_postRefreshPosterPathsAssertion, a4);
      v6 = 0;
    }
    v8 = (void *)-[NSMutableArray copy](self->_lock_completionObservers, "copy");
    -[NSMutableArray removeAllObjects](self->_lock_completionObservers, "removeAllObjects");
  }
  os_unfair_recursive_lock_unlock();
  -[PBFPosterExtensionReloadConfigurationOperation _fireCompletionObservers:instance:error:](self, "_fireCompletionObservers:instance:error:", v8, self, v6);

}

- (id)_userInfoForErrors
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  v15[0] = CFSTR("extensionBundleIdentifier");
  -[PBFPosterExtensionReloadConfigurationOperation preRefreshPosterConfiguration](self, "preRefreshPosterConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provider");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("(null)");
  if (v5)
    v7 = (const __CFString *)v5;
  v16[0] = v7;
  v15[1] = CFSTR("timeoutInterval");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeoutInterval);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  v15[2] = CFSTR("preRefreshPosterConfiguration");
  -[PBFPosterExtensionReloadConfigurationOperation preRefreshPosterConfiguration](self, "preRefreshPosterConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = CFSTR("null");
  if (v10)
    v12 = (const __CFString *)v10;
  v16[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_unlock();
  return v13;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterExtensionReloadConfigurationOperation preRefreshPosterConfiguration](self, "preRefreshPosterConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serverIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v5, self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
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
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFPosterExtensionReloadConfigurationOperation _fireCompletionObservers:instance:error:]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __90__PBFPosterExtensionReloadConfigurationOperation__fireCompletionObservers_instance_error___block_invoke;
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

uint64_t __90__PBFPosterExtensionReloadConfigurationOperation__fireCompletionObservers_instance_error___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (double)executionStartDate
{
  return self->_lock_executionStateDate;
}

- (double)executionFinishDate
{
  return self->_lock_executionFinishDate;
}

- (PFPosterPath)existingConfigurationPath
{
  return self->_existingConfigurationPath;
}

- (PRUpdatingService)updatingService
{
  return self->_updatingService;
}

- (PBFRuntimeAssertionProviding)runtimeAssertionProvider
{
  return self->_runtimeAssertionProvider;
}

- (PBFBehaviorAssertionProviding)behaviorAssertionProvider
{
  return self->_behaviorAssertionProvider;
}

- (PFPosterPath)preRefreshPosterConfiguration
{
  return (PFPosterPath *)objc_getProperty(self, a2, 432, 1);
}

- (void)setPreRefreshPosterConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 440, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
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
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_preRefreshPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_behaviorAssertionProvider, 0);
  objc_storeStrong((id *)&self->_runtimeAssertionProvider, 0);
  objc_storeStrong((id *)&self->_updatingService, 0);
  objc_storeStrong((id *)&self->_existingConfigurationPath, 0);
  objc_storeStrong((id *)&self->_lock_posterBoardPosterUpdateRuntimeAssertion, 0);
  objc_storeStrong((id *)&self->_lock_snapshotterDisabledAssertion, 0);
  objc_storeStrong((id *)&self->_lock_locationInUseAssertion, 0);
  objc_storeStrong((id *)&self->_lock_extensionPosterUpdateEntitledMemoryAssertion, 0);
  objc_storeStrong((id *)&self->_lock_extensionPosterUpdateRuntimeAssertion, 0);
  objc_storeStrong((id *)&self->_lock_postRefreshPosterPathsAssertion, 0);
  objc_storeStrong((id *)&self->_lock_group, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_completionObservers, 0);
}

- (void)initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:.cold.1()
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

- (void)initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:.cold.2()
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

- (void)initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:.cold.3()
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

- (void)initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:.cold.4()
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

- (void)initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:.cold.5()
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

- (void)initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:.cold.10()
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

void __56__PBFPosterExtensionReloadConfigurationOperation__setup__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1CB9FA000, a2, OS_LOG_TYPE_ERROR, "(%{public}@)  Timed out!", (uint8_t *)&v2, 0xCu);
}

@end
