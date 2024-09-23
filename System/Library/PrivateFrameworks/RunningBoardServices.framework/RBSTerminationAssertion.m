@implementation RBSTerminationAssertion

- (RBSTerminationAssertion)initWithTarget:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  RBSTerminationAssertion *v13;
  RBSTerminationAssertion *v14;
  RBSTerminationAssertion *v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "processIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEmbeddedApplication");

  if (v9)
  {
    objc_msgSend(v7, "processIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "embeddedApplicationIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBSProcessPredicate predicateMatchingBundleIdentifier:](RBSProcessPredicate, "predicateMatchingBundleIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[RBSTerminationAssertion initWithPredicate:context:](self, "initWithPredicate:context:", v12, v6);

    v14 = v13;
  }
  else
  {
    +[RBSProcessPredicate predicateMatchingTarget:](RBSProcessPredicate, "predicateMatchingTarget:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[RBSTerminationAssertion initWithPredicate:context:](self, "initWithPredicate:context:", v10, v6);
    v14 = v15;
  }

  return v14;
}

- (uint64_t)setupMonitor
{
  uint64_t v1;
  id *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (result)
  {
    v1 = result;
    v2 = -[RBSProcessMonitor _initWithService:]((id *)[RBSProcessMonitor alloc], *(void **)(result + 56));
    v3 = *(void **)(v1 + 24);
    *(_QWORD *)(v1 + 24) = v2;

    v4 = *(void **)(v1 + 24);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __39__RBSTerminationAssertion_setupMonitor__block_invoke;
    v5[3] = &unk_1E2D17B80;
    v5[4] = v1;
    return objc_msgSend(v4, "updateConfiguration:", v5);
  }
  return result;
}

void __39__RBSTerminationAssertion_setupMonitor__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id location;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[RBSProcessStateDescriptor descriptor](RBSProcessStateDescriptor, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValues:", 5);
  objc_msgSend(v3, "setStateDescriptor:", v4);
  v5 = *(_QWORD *)(a1 + 32);
  a1 += 32;
  v10[0] = *(_QWORD *)(v5 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicates:", v6);

  objc_initWeak(&location, *(id *)a1);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__RBSTerminationAssertion_setupMonitor__block_invoke_2;
  v7[3] = &unk_1E2D17B58;
  objc_copyWeak(&v8, &location);
  v7[4] = *(_QWORD *)a1;
  objc_msgSend(v3, "setUpdateHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __39__RBSTerminationAssertion_setupMonitor__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  id *v13;
  uint64_t v14;

  v5 = a4;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 2);
    if (*(_QWORD *)&v7[16]._os_unfair_lock_opaque == 1)
    {
      objc_msgSend(v5, "previousState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "terminationResistance");
      if (v9 <= objc_msgSend(*(id *)&v7[8]._os_unfair_lock_opaque, "maximumTerminationResistance"))
      {

      }
      else
      {
        objc_msgSend(v5, "state");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "terminationResistance");
        v12 = objc_msgSend(*(id *)&v7[8]._os_unfair_lock_opaque, "maximumTerminationResistance");

        if (v11 <= v12)
        {
          v13 = -[RBSTerminateRequest initWithPredicate:context:allowLaunch:service:]((id *)[RBSTerminateRequest alloc], *(void **)&v7[10]._os_unfair_lock_opaque, *(void **)&v7[8]._os_unfair_lock_opaque, *(void **)(*(_QWORD *)(a1 + 32) + 48), *(void **)&v7[14]._os_unfair_lock_opaque);
          v14 = 0;
          objc_msgSend(v13, "execute:", &v14);

        }
      }
    }
    os_unfair_lock_unlock(v7 + 2);
  }

}

- (RBSTerminationAssertion)initWithPredicate:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  RBSTerminationAssertion *v9;

  v6 = a4;
  v7 = a3;
  +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[RBSTerminationAssertion initWithPredicate:context:allowLaunch:service:](self, "initWithPredicate:context:allowLaunch:service:", v7, v6, 0, v8);

  return v9;
}

- (RBSTerminationAssertion)initWithPredicate:(id)a3 context:(id)a4 allowLaunch:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  RBSTerminationAssertion *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[RBSTerminationAssertion initWithPredicate:context:allowLaunch:service:](self, "initWithPredicate:context:allowLaunch:service:", v10, v9, v8, v11);

  return v12;
}

- (RBSTerminationAssertion)initWithPredicate:(id)a3 context:(id)a4 allowLaunch:(id)a5 service:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  RBSTerminationAssertion *v15;
  RBSTerminationAssertion *v16;
  uint64_t v17;
  NSHashTable *observers;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)RBSTerminationAssertion;
  v15 = -[RBSTerminationAssertion init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_predicate, a3);
    objc_storeStrong((id *)&v16->_allow, a5);
    v16->_processExists = 1;
    v16->_state = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v17 = objc_claimAutoreleasedReturnValue();
    observers = v16->_observers;
    v16->_observers = (NSHashTable *)v17;

    objc_storeStrong((id *)&v16->_terminateContext, a4);
    objc_storeStrong((id *)&v16->_service, a6);
  }

  return v16;
}

- (BOOL)isValid
{
  RBSTerminationAssertion *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[RBSAssertion isValid](v2->_assertion, "isValid");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)processExists
{
  RBSTerminationAssertion *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_processExists;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)acquireWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  id v8;
  id *p_assertion;
  BOOL v10;
  id *v11;
  char v12;
  id v13;
  id v14;
  RBSProcessMonitor *v15;
  RBSProcessMonitor *monitor;
  RBSProcessMonitor *v17;
  RBSAssertion *assertion;
  RBSProcessMonitor *v19;
  NSHashTable *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  RBSProcessPredicate *predicate;
  void *v25;
  RBSServiceLocalProtocol *service;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSMutableSet *v32;
  NSMutableSet *runningHandles;
  int v35;
  _QWORD v36[5];
  id v37;
  id location;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  id v45;
  uint64_t v46;
  const __CFString *v47;
  _BYTE v48[128];
  uint64_t v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_observersHaveBeenNotified = 0;
  if (!self->_state)
  {
    v11 = -[RBSTerminateRequest initWithPredicate:context:allowLaunch:service:]((id *)[RBSTerminateRequest alloc], self->_predicate, self->_terminateContext, self->_allow, self->_service);
    -[RBSTerminationAssertion setupMonitor]((uint64_t)self);
    v44 = 0;
    v45 = 0;
    v12 = objc_msgSend(v11, "execute:error:", &v45, &v44);
    v13 = v45;
    v14 = v45;
    v8 = v44;
    p_assertion = (id *)&self->_assertion;
    objc_storeStrong((id *)&self->_assertion, v13);
    v10 = 1;
    self->_state = 1;
    if ((v12 & 1) != 0)
    {
      v35 = 0;
      goto LABEL_16;
    }
    if (*p_assertion)
    {
      if (objc_msgSend(v8, "code") == 4)
      {

        v8 = 0;
        v35 = 0;
LABEL_13:
        v10 = 1;
        goto LABEL_16;
      }
      if (objc_msgSend(v8, "code") == 3)
      {

        monitor = self->_monitor;
        self->_processExists = 0;
        -[RBSProcessMonitor invalidate](monitor, "invalidate");
        v17 = self->_monitor;
        self->_monitor = 0;

        v8 = 0;
        v35 = 1;
        goto LABEL_13;
      }
      -[RBSAssertion invalidate](self->_assertion, "invalidate");
      assertion = self->_assertion;
      self->_assertion = 0;

      -[RBSProcessMonitor invalidate](self->_monitor, "invalidate");
      v19 = self->_monitor;
      self->_monitor = 0;

    }
    else
    {
      -[RBSProcessMonitor invalidate](self->_monitor, "invalidate");
      v15 = self->_monitor;
      self->_monitor = 0;

    }
    v35 = 0;
    v10 = 0;
    self->_state = 2;
LABEL_16:

    if (!*p_assertion)
      goto LABEL_36;
    goto LABEL_17;
  }
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v49 = *MEMORY[0x1E0CB2D68];
  v50[0] = CFSTR("Assertion is in wrong state to be acquired");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("RBSAssertionErrorDomain"), 2, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  p_assertion = (id *)&self->_assertion;
  if (!self->_assertion)
  {
    os_unfair_lock_unlock(p_lock);
    v10 = 0;
    goto LABEL_40;
  }
  v10 = 0;
  v35 = 0;
LABEL_17:
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v20 = self->_observers;
  v21 = -[NSHashTable countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v41 != v22)
          objc_enumerationMutation(v20);
        objc_msgSend(*p_assertion, "addObserver:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
      }
      v21 = -[NSHashTable countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v21);
  }

  if (!*p_assertion || !self->_monitor || v8)
  {
    os_unfair_lock_unlock(p_lock);
    if (!v35)
      goto LABEL_40;
LABEL_39:
    -[RBSTerminationAssertion _notifyObserversOfProcessExit]((uint64_t)self);
    goto LABEL_40;
  }
  predicate = self->_predicate;
  +[RBSProcessStateDescriptor descriptor](RBSProcessStateDescriptor, "descriptor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  service = self->_service;
  v39 = 0;
  +[RBSProcessState statesForPredicate:withDescriptor:service:error:](RBSProcessState, "statesForPredicate:withDescriptor:service:error:", predicate, v25, service, &v39);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v39;

  if (v28)
  {
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v46 = *MEMORY[0x1E0CB2D68];
    v47 = CFSTR("Could not get list of running apps");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("RBSAssertionErrorDomain"), 2, v30);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    rbs_assertion_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[RBSTerminationAssertion acquireWithError:].cold.1((uint64_t)self, v31);

  }
  else
  {
    v8 = 0;
  }
  v32 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  runningHandles = self->_runningHandles;
  self->_runningHandles = v32;

  self->_deathMonitorsSetUp = 0;
  objc_initWeak(&location, self);
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __44__RBSTerminationAssertion_acquireWithError___block_invoke;
  v36[3] = &unk_1E2D17BD0;
  v36[4] = self;
  objc_copyWeak(&v37, &location);
  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v36);
  self->_deathMonitorsSetUp = 1;
  if (!-[NSMutableSet count](self->_runningHandles, "count"))
  {
    self->_processExists = 0;
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);

    os_unfair_lock_unlock(p_lock);
    goto LABEL_39;
  }
  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

LABEL_36:
  os_unfair_lock_unlock(p_lock);
  if ((v35 & 1) != 0)
    goto LABEL_39;
LABEL_40:
  if (a3)
    *a3 = objc_retainAutorelease(v8);

  return v10;
}

void __44__RBSTerminationAssertion_acquireWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isRunning"))
  {
    objc_msgSend(v3, "process");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addObject:", v4);
    rbs_assertion_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_impl(&dword_190CD6000, v5, OS_LOG_TYPE_DEFAULT, "Setting up death monitor for %@", buf, 0xCu);
    }

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44__RBSTerminationAssertion_acquireWithError___block_invoke_15;
    v6[3] = &unk_1E2D17BA8;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    objc_msgSend(v4, "monitorForDeath:", v6);
    objc_destroyWeak(&v7);

  }
}

void __44__RBSTerminationAssertion_acquireWithError___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *WeakRetained;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 2);
    objc_msgSend(*(id *)(v5 + 80), "removeObject:", v3);
    rbs_assertion_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_190CD6000, v6, OS_LOG_TYPE_DEFAULT, "Death monitor triggered for %@", (uint8_t *)&v8, 0xCu);
    }

    if (*(_BYTE *)(v5 + 88))
    {
      v7 = objc_msgSend(*(id *)(v5 + 80), "count");
      os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 8));
      if (!v7)
      {
        *(_BYTE *)(v5 + 72) = 0;
        -[RBSTerminationAssertion _notifyObserversOfProcessExit](v5);
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 8));
    }
  }

}

- (void)_notifyObserversOfProcessExit
{
  os_unfair_lock_s *v2;
  void *v3;
  int v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  uint8_t buf[16];

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v3 = (void *)objc_msgSend(*(id *)(a1 + 96), "copy");
    v4 = *(unsigned __int8 *)(a1 + 89);
    *(_BYTE *)(a1 + 89) = 1;
    os_unfair_lock_unlock(v2);
    if (!v4)
    {
      rbs_assertion_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190CD6000, v5, OS_LOG_TYPE_DEFAULT, "Notify termination observers of process exit", buf, 2u);
      }

      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __56__RBSTerminationAssertion__notifyObserversOfProcessExit__block_invoke;
      v6[3] = &unk_1E2D17468;
      v7 = v3;
      v8 = a1;
      +[RBSWorkloop performCallout:]((uint64_t)RBSWorkloop, v6);

    }
  }
}

- (BOOL)invalidateWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  BOOL v6;
  void *v7;
  void *v8;
  NSObject *v9;
  RBSProcessMonitor *monitor;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state == 1)
  {
    v6 = -[RBSAssertion invalidateWithError:](self->_assertion, "invalidateWithError:", a3);
  }
  else
  {
    if (a3)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0CB2D68];
      v13[0] = CFSTR("Assertion is in wrong state to be invalidated");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("RBSAssertionErrorDomain"), 2, v8);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    rbs_assertion_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[RBSTerminationAssertion invalidateWithError:].cold.1(v9);

    v6 = 0;
  }
  -[RBSProcessMonitor invalidate](self->_monitor, "invalidate");
  monitor = self->_monitor;
  self->_monitor = 0;

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  RBSProcessMonitor *monitor;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[RBSAssertion invalidate](self->_assertion, "invalidate");
  -[RBSProcessMonitor invalidate](self->_monitor, "invalidate");
  monitor = self->_monitor;
  self->_monitor = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)addObserver:(id)a3
{
  _BOOL4 processExists;
  id v5;

  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);
  -[RBSAssertion addObserver:](self->_assertion, "addObserver:", v5);
  processExists = self->_processExists;
  os_unfair_lock_unlock(&self->_lock);
  if (!processExists)
    objc_msgSend(v5, "assertionTargetProcessDidExit:", self);

}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
  -[RBSAssertion removeObserver:](self->_assertion, "removeObserver:", v5);

  os_unfair_lock_unlock(p_lock);
}

void __56__RBSTerminationAssertion__notifyObserversOfProcessExit__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "assertionTargetProcessDidExit:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_runningHandles, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_allow, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_terminateContext, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
}

- (void)acquireWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_190CD6000, a2, OS_LOG_TYPE_ERROR, "Could not get list of running states for %@", (uint8_t *)&v2, 0xCu);
}

- (void)invalidateWithError:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_190CD6000, log, OS_LOG_TYPE_ERROR, "Attempt to invalidate an invalid assertion", v1, 2u);
}

@end
