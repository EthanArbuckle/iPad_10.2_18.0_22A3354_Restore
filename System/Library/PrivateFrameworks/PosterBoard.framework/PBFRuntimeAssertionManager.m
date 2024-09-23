@implementation PBFRuntimeAssertionManager

- (PBFRuntimeAssertionManager)init
{
  PBFRuntimeAssertionManager *v2;
  uint64_t Serial;
  OS_dispatch_queue *stateQueue;
  uint64_t v5;
  BSAtomicFlag *invalidationFlag;
  uint64_t v7;
  NSHashTable *stateQueue_knownAssertions;
  uint64_t v9;
  NSMapTable *stateQueue_acquistionDateForAssertion;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  BSInvalidatable *stateCaptureSentinel;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PBFRuntimeAssertionManager;
  v2 = -[PBFRuntimeAssertionManager init](&v18, sel_init);
  if (v2)
  {
    Serial = BSDispatchQueueCreateSerial();
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)Serial;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
    invalidationFlag = v2->_invalidationFlag;
    v2->_invalidationFlag = (BSAtomicFlag *)v5;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    stateQueue_knownAssertions = v2->_stateQueue_knownAssertions;
    v2->_stateQueue_knownAssertions = (NSHashTable *)v7;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    stateQueue_acquistionDateForAssertion = v2->_stateQueue_acquistionDateForAssertion;
    v2->_stateQueue_acquistionDateForAssertion = (NSMapTable *)v9;

    objc_initWeak(&location, v2);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v16, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v13 = objc_claimAutoreleasedReturnValue();
    stateCaptureSentinel = v2->_stateCaptureSentinel;
    v2->_stateCaptureSentinel = (BSInvalidatable *)v13;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __34__PBFRuntimeAssertionManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stateQueue_debugDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[PBFRuntimeAssertionManager invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PBFRuntimeAssertionManager;
  -[PBFRuntimeAssertionManager dealloc](&v3, sel_dealloc);
}

- (id)acquirePrewarmRuntimeAssertionForReason:(id)a3 target:(id)a4 invalidationHandler:(id)a5
{
  return -[PBFRuntimeAssertionManager acquireAssertion:reason:target:invalidationHandler:](self, "acquireAssertion:reason:target:invalidationHandler:", *MEMORY[0x1E0D7F9A8], a3, a4, a5);
}

- (id)acquirePosterUpdateRuntimeAssertionForReason:(id)a3 target:(id)a4
{
  return -[PBFRuntimeAssertionManager acquireAssertion:reason:target:invalidationHandler:](self, "acquireAssertion:reason:target:invalidationHandler:", *MEMORY[0x1E0D7F9A0], a3, a4, 0);
}

- (id)acquirePosterUpdateMemoryAssertionForReason:(id)a3 target:(id)a4 auditToken:(id)a5 posterProviderBundleIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  _QWORD *v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (objc_msgSend(a5, "hasEntitlement:", CFSTR("com.apple.posterkit.enhanced-memory-limits")))
  {
    v13 = PFBundleIdentifierRequiresMemoryHogAssertion();
    v14 = (_QWORD *)MEMORY[0x1E0D7F998];
    if (!v13)
      v14 = (_QWORD *)MEMORY[0x1E0D7F990];
    -[PBFRuntimeAssertionManager acquireAssertion:reason:target:invalidationHandler:](self, "acquireAssertion:reason:target:invalidationHandler:", *v14, v10, v11, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)acquireAssertion:(id)a3 reason:(id)a4 target:(id)a5 invalidationHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  int v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *stateQueue;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD block[5];
  id v37;
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v10;
  NSClassFromString(CFSTR("NSString"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFRuntimeAssertionManager acquireAssertion:reason:target:invalidationHandler:].cold.1();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA99908);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFRuntimeAssertionManager acquireAssertion:reason:target:invalidationHandler:].cold.1();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA9996CLL);
  }

  v15 = v11;
  NSClassFromString(CFSTR("NSString"));
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFRuntimeAssertionManager acquireAssertion:reason:target:invalidationHandler:].cold.2();
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA999D0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFRuntimeAssertionManager acquireAssertion:reason:target:invalidationHandler:].cold.2();
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA99A34);
  }

  v16 = v12;
  NSClassFromString(CFSTR("RBSTarget"));
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFRuntimeAssertionManager acquireAssertion:reason:target:invalidationHandler:].cold.3();
    objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA99A98);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:RBSTargetClass]"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFRuntimeAssertionManager acquireAssertion:reason:target:invalidationHandler:].cold.3();
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA99AFCLL);
  }

  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
  {
    v17 = 0;
  }
  else
  {
    PBFLogRuntime();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v40 = v14;
      v41 = 2114;
      v42 = v15;
      v43 = 2114;
      v44 = v16;
      _os_log_impl(&dword_1CB9FA000, v18, OS_LOG_TYPE_DEFAULT, "acquireAssertion:'%{public}@' reason:'%{public}@' target:'%{public}@'", buf, 0x20u);
    }

    -[PBFRuntimeAssertionManager _buildRBSAssertionForTarget:assertionIdentifier:explanation:invalidationHandler:](self, "_buildRBSAssertionForTarget:assertionIdentifier:explanation:invalidationHandler:", v16, v14, v15, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v20 = objc_msgSend(v19, "acquireWithError:", &v38);
    v21 = v38;
    PBFLogRuntime();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v20)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        v40 = v14;
        v41 = 2114;
        v42 = v15;
        v43 = 2114;
        v44 = v16;
        v45 = 2114;
        v46 = v21;
        _os_log_impl(&dword_1CB9FA000, v23, OS_LOG_TYPE_DEFAULT, "SUCCESS acquireAssertion:'%{public}@' reason:'%{public}@' target:'%{public}@': %{public}@", buf, 0x2Au);
      }

      stateQueue = self->_stateQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __81__PBFRuntimeAssertionManager_acquireAssertion_reason_target_invalidationHandler___block_invoke;
      block[3] = &unk_1E86F2540;
      block[4] = self;
      v17 = v19;
      v37 = v17;
      dispatch_async(stateQueue, block);

    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        v40 = v14;
        v41 = 2114;
        v42 = v15;
        v43 = 2114;
        v44 = v16;
        v45 = 2114;
        v46 = v21;
        _os_log_error_impl(&dword_1CB9FA000, v23, OS_LOG_TYPE_ERROR, "FAILED acquireAssertion:'%{public}@' reason:'%{public}@' target:'%{public}@': %{public}@", buf, 0x2Au);
      }

      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFRuntimeAssertionManager acquireAssertion:reason:target:invalidationHandler:]");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __81__PBFRuntimeAssertionManager_acquireAssertion_reason_target_invalidationHandler___block_invoke_25;
        v33[3] = &unk_1E86F2F98;
        v35 = v13;
        v34 = v21;
        PBFDispatchAsyncWithString(v25, QOS_CLASS_USER_INTERACTIVE, v33);

      }
      v17 = 0;
    }

  }
  return v17;
}

void __81__PBFRuntimeAssertionManager_acquireAssertion_reason_target_invalidationHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

}

uint64_t __81__PBFRuntimeAssertionManager_acquireAssertion_reason_target_invalidationHandler___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)invalidate
{
  BSInvalidatable *stateCaptureSentinel;
  NSHashTable *v4;
  NSObject *stateQueue;
  NSHashTable *v6;
  _QWORD block[4];
  NSHashTable *v8;

  if (-[BSAtomicFlag setFlag:](self->_invalidationFlag, "setFlag:", 1))
  {
    -[BSInvalidatable invalidate](self->_stateCaptureSentinel, "invalidate");
    stateCaptureSentinel = self->_stateCaptureSentinel;
    self->_stateCaptureSentinel = 0;

    v4 = self->_stateQueue_knownAssertions;
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__PBFRuntimeAssertionManager_invalidate__block_invoke;
    block[3] = &unk_1E86F2518;
    v8 = v4;
    v6 = v4;
    dispatch_async(stateQueue, block);

  }
}

void __40__PBFRuntimeAssertionManager_invalidate__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy", 0);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "invalidate");
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (id)_buildRBSAssertionForTarget:(id)a3 assertionIdentifier:(id)a4 explanation:(id)a5 invalidationHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v10;
  NSClassFromString(CFSTR("RBSTarget"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFRuntimeAssertionManager _buildRBSAssertionForTarget:assertionIdentifier:explanation:invalidationHandler:].cold.1();
LABEL_17:
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA99EECLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:RBSTargetClass]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFRuntimeAssertionManager _buildRBSAssertionForTarget:assertionIdentifier:explanation:invalidationHandler:].cold.4();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA99F50);
  }

  v15 = v11;
  NSClassFromString(CFSTR("NSString"));
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFRuntimeAssertionManager _buildRBSAssertionForTarget:assertionIdentifier:explanation:invalidationHandler:].cold.2();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA99FB4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFRuntimeAssertionManager _buildRBSAssertionForTarget:assertionIdentifier:explanation:invalidationHandler:].cold.3();
    goto LABEL_17;
  }

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D87C98], "pf_assertionForTarget:assertionIdentifier:explanation:invalidationHandler:", v14, v15, v12, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __110__PBFRuntimeAssertionManager__buildRBSAssertionForTarget_assertionIdentifier_explanation_invalidationHandler___block_invoke;
  v23[3] = &unk_1E86F61E8;
  objc_copyWeak(&v26, &location);
  v17 = v15;
  v24 = v17;
  v18 = v13;
  v25 = v18;
  objc_msgSend(v16, "setInvalidationHandler:", v23);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v16;
}

void __110__PBFRuntimeAssertionManager__buildRBSAssertionForTarget_assertionIdentifier_explanation_invalidationHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_runningBoardAssertionStateDidUpdate:assertionIdentifier:error:", v9, *(_QWORD *)(a1 + 32), v5);
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v5);
  }

}

- (void)_runningBoardAssertionStateDidUpdate:(id)a3 assertionIdentifier:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *stateQueue;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PBFLogRuntime();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    objc_msgSend(v8, "target");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v18 = v9;
    v19 = 2114;
    v20 = v13;
    v21 = 1024;
    v22 = objc_msgSend(v8, "isValid");
    v23 = 2114;
    v24 = v10;
    _os_log_error_impl(&dword_1CB9FA000, v12, OS_LOG_TYPE_ERROR, "_runningBoardAssertionStateDidUpdate:'%{public}@' target:'%{public}@' isActive:%{BOOL}u error: %{public}@", buf, 0x26u);
  }
  else
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    objc_msgSend(v8, "target");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v18 = v9;
    v19 = 2114;
    v20 = v13;
    v21 = 1024;
    v22 = objc_msgSend(v8, "isValid");
    v23 = 2114;
    v24 = 0;
    _os_log_impl(&dword_1CB9FA000, v12, OS_LOG_TYPE_DEFAULT, "_runningBoardAssertionStateDidUpdate:'%{public}@' target:'%{public}@' isActive:%{BOOL}u error: %{public}@", buf, 0x26u);
  }

LABEL_7:
  if ((objc_msgSend(v8, "isValid") & 1) == 0)
  {
    stateQueue = self->_stateQueue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __93__PBFRuntimeAssertionManager__runningBoardAssertionStateDidUpdate_assertionIdentifier_error___block_invoke;
    v15[3] = &unk_1E86F2540;
    v15[4] = self;
    v16 = v8;
    dispatch_async(stateQueue, v15);

  }
}

uint64_t __93__PBFRuntimeAssertionManager__runningBoardAssertionStateDidUpdate_assertionIdentifier_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (NSString)description
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PBFRuntimeAssertionManager_description__block_invoke;
  v5[3] = &unk_1E86F2B98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __41__PBFRuntimeAssertionManager_description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_stateQueue_debugDescription");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)debugDescription
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__PBFRuntimeAssertionManager_debugDescription__block_invoke;
  v5[3] = &unk_1E86F2B98;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __46__PBFRuntimeAssertionManager_debugDescription__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_stateQueue_debugDescription");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_stateQueue_debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFRuntimeAssertionManager _stateQueue_debugDescriptionForPosterBoardProcessAssertions](self, "_stateQueue_debugDescriptionForPosterBoardProcessAssertions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendDictionarySection:withName:multilinePrefix:skipIfEmpty:", v4, CFSTR("PosterBoard Assertions"), CFSTR("\n\t\t"), 1);

  -[PBFRuntimeAssertionManager _stateQueue_debugDescriptionForPosterExtensionProcessAssertions](self, "_stateQueue_debugDescriptionForPosterExtensionProcessAssertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendDictionarySection:withName:multilinePrefix:skipIfEmpty:", v5, CFSTR("Poster Extension Assertions"), CFSTR("\n\t\t"), 1);

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_stateQueue_debugDescriptionForPosterBoardProcessAssertions
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFRuntimeAssertionManager _stateQueue_debugDescriptionForTarget:](self, "_stateQueue_debugDescriptionForTarget:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_stateQueue_debugDescriptionForPosterExtensionProcessAssertions
{
  void *v3;
  void *v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = self->_stateQueue_knownAssertions;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "target");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

      }
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "removeObject:", v3);
  v11 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
        -[PBFRuntimeAssertionManager _stateQueue_debugDescriptionForTarget:](self, "_stateQueue_debugDescriptionForTarget:", v17, (_QWORD)v21);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "description");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bs_setSafeObject:forKey:", v18, v19);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v14);
  }

  return v11;
}

- (id)_stateQueue_debugDescriptionForTarget:(id)a3
{
  id v4;
  void *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[3];
  _QWORD v37[3];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v31 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = self->_stateQueue_knownAssertions;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v11, "target");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if (v13)
        {
          -[NSMapTable objectForKey:](self->_stateQueue_acquistionDateForAssertion, "objectForKey:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v5, "addObject:", v14);
            objc_msgSend(v11, "explanation");
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = (void *)v15;
            if (v15)
              v17 = (const __CFString *)v15;
            else
              v17 = CFSTR("@(NULL)");
            objc_msgSend(v31, "addObject:", v17);

          }
        }
      }
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "anyObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sortedArrayUsingSelector:", sel_compare_);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v18)
  {
    if (objc_msgSend(v31, "count") == 1)
    {
      objc_msgSend(v31, "anyObject");
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v31, "count"))
    {
      objc_msgSend(v31, "allObjects");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sortedArrayUsingSelector:", sel_compare_);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("', '"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@'"), v25);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = CFSTR("(null)");
    }
    if (v21)
      v26 = v21;
    else
      v26 = CFSTR("(null)");
    v36[0] = CFSTR("explanations");
    v36[1] = CFSTR("creationDate");
    v37[0] = v26;
    v37[1] = v18;
    v36[2] = CFSTR("elapsedTimeInSeconds");
    v27 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "timeIntervalSinceDate:", v18);
    objc_msgSend(v27, "numberWithDouble:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureSentinel, 0);
  objc_storeStrong((id *)&self->_stateQueue_acquistionDateForAssertion, 0);
  objc_storeStrong((id *)&self->_stateQueue_knownAssertions, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
}

- (void)acquireAssertion:reason:target:invalidationHandler:.cold.1()
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

- (void)acquireAssertion:reason:target:invalidationHandler:.cold.2()
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

- (void)acquireAssertion:reason:target:invalidationHandler:.cold.3()
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

- (void)_buildRBSAssertionForTarget:assertionIdentifier:explanation:invalidationHandler:.cold.1()
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

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_buildRBSAssertionForTarget:assertionIdentifier:explanation:invalidationHandler:.cold.2()
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

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_buildRBSAssertionForTarget:assertionIdentifier:explanation:invalidationHandler:.cold.3()
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

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_buildRBSAssertionForTarget:assertionIdentifier:explanation:invalidationHandler:.cold.4()
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

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
