@implementation RBSAssertion

- (void)removeObserver:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSAssertion.m"), 198, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer != nil"));

  }
  os_unfair_lock_lock_with_options();
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v6);
  os_unfair_lock_unlock(&self->_lock);

}

- (BOOL)invalidateWithError:(id *)a3
{
  -[RBSAssertion invalidate](self, "invalidate", a3);
  return 1;
}

- (BOOL)_clientInvalidateWithError:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    v4 = *(_QWORD *)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 2;
    v5 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    v6 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    v7 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    if (v4 == 1)
      objc_msgSend(*(id *)(a1 + 40), "invalidateAssertion:error:", a1, a2);
  }
  return a1 != 0;
}

- (void)invalidate
{
  -[RBSAssertion _clientInvalidateWithError:]((uint64_t)self, 0);
}

- (RBSAssertionIdentifier)identifier
{
  void *v2;
  void *v3;

  -[RBSAssertion descriptor](self, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (RBSAssertionIdentifier *)v3;
}

- (BOOL)acquireWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  unint64_t state;
  id v7;
  void *observers;
  void *v9;
  void *v10;
  RBSServiceLocalProtocol *service;
  void *v12;
  BOOL v13;
  RBSAssertionDescriptor *v14;
  RBSAssertionDescriptor *descriptor;
  void *v16;
  void *v17;
  void *v18;
  const __CFString **v19;
  uint64_t *v20;
  void *v21;
  id invalidationHandler;
  id warningHandler;
  NSObject *v25;
  id v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  state = self->_state;
  if (state == 2)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2D68];
    v28 = CFSTR("Assertion has already been invalidated");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    observers = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("RBSAssertionErrorDomain"), 1, observers);
    v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

LABEL_14:
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    warningHandler = self->_warningHandler;
    self->_warningHandler = 0;

    v13 = 0;
    observers = self->_observers;
    self->_observers = 0;
    goto LABEL_15;
  }
  v7 = 0;
  if (state == 1)
  {
    v13 = 1;
    goto LABEL_16;
  }
  if (state)
    goto LABEL_14;
  -[RBSAssertion descriptor](self, "descriptor");
  observers = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(observers, "target");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    self->_state = 2;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D68];
    v32[0] = CFSTR("Missing assertion target");
    v18 = (void *)MEMORY[0x1E0C99D80];
    v19 = (const __CFString **)v32;
    v20 = &v31;
LABEL_12:
    objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("RBSAssertionErrorDomain"), 2, v21);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  objc_msgSend(observers, "explanation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    self->_state = 2;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D68];
    v30 = CFSTR("Missing assertion explanation");
    v18 = (void *)MEMORY[0x1E0C99D80];
    v19 = &v30;
    v20 = &v29;
    goto LABEL_12;
  }
  service = self->_service;
  v26 = 0;
  -[RBSServiceLocalProtocol acquireAssertion:error:](service, "acquireAssertion:error:", self, &v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v26;
  if (!v12)
  {
    rbs_assertion_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[RBSAssertion acquireWithError:].cold.1((uint64_t)v7, v25);

    self->_state = 2;
    goto LABEL_13;
  }
  v13 = 1;
  self->_state = 1;
  os_unfair_lock_lock(&self->_dataLock);
  v14 = (RBSAssertionDescriptor *)objc_msgSend(observers, "copyWithIdentifier:", v12);
  descriptor = self->_descriptor;
  self->_descriptor = v14;

  os_unfair_lock_unlock(&self->_dataLock);
LABEL_15:

LABEL_16:
  os_unfair_lock_unlock(p_lock);
  if (a3)
    *a3 = objc_retainAutorelease(v7);

  return v13;
}

- (RBSAssertion)initWithExplanation:(id)a3 target:(id)a4 attributes:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  RBSAssertion *v14;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSAssertion.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("target"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSAssertion.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("explanation"));

    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_5;
LABEL_3:
  +[RBSAssertionDescriptor descriptorWithIdentifier:target:explanation:attributes:](RBSAssertionDescriptor, "descriptorWithIdentifier:target:explanation:attributes:", 0, v10, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[RBSAssertion _initWithDescriptor:service:](self, "_initWithDescriptor:service:", v12, v13);

  return v14;
}

- (id)_initWithDescriptor:(id)a3 service:(id)a4
{
  id v6;
  id v7;
  RBSAssertion *v8;
  uint64_t v9;
  NSHashTable *observers;
  uint64_t v11;
  RBSAssertionDescriptor *descriptor;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RBSAssertion;
  v8 = -[RBSAssertion init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v9;

    v11 = objc_msgSend(v6, "copy");
    descriptor = v8->_descriptor;
    v8->_descriptor = (RBSAssertionDescriptor *)v11;

    v8->_state = 0;
    objc_storeStrong((id *)&v8->_service, a4);
    *(_QWORD *)&v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (RBSAssertionDescriptor)descriptor
{
  os_unfair_lock_s *p_dataLock;
  void *v4;

  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  v4 = (void *)-[RBSAssertionDescriptor copy](self->_descriptor, "copy");
  os_unfair_lock_unlock(p_dataLock);
  return (RBSAssertionDescriptor *)v4;
}

- (void)acquireWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_190CD6000, a2, OS_LOG_TYPE_ERROR, "Error acquiring assertion: <%{public}@>", (uint8_t *)&v2, 0xCu);
}

- (BOOL)isValid
{
  return -[RBSAssertion state](self, "state") == 1;
}

- (unint64_t)state
{
  os_unfair_lock_s *p_lock;
  unint64_t state;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)addObserver:(id)a3
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  RBSAssertion *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSAssertion.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer != nil"));

  }
  os_unfair_lock_lock_with_options();
  if (self->_state == 2)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __28__RBSAssertion_addObserver___block_invoke;
      v7[3] = &unk_1E2D17468;
      v8 = v5;
      v9 = self;
      +[RBSWorkloop performCallout:]((uint64_t)RBSWorkloop, v7);

    }
  }
  else
  {
    -[NSHashTable addObject:](self->_observers, "addObject:", v5);
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (id)_initWithServerValidatedDescriptor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RBSAssertion _initWithServerValidatedDescriptor:service:](self, "_initWithServerValidatedDescriptor:service:", v4, v5);

  return v6;
}

- (id)_initWithServerValidatedDescriptor:(id)a3 service:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v13;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSAssertion.m"), 283, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[descriptor identifier] != nil"));

  }
  v10 = -[RBSAssertion _initWithDescriptor:service:](self, "_initWithDescriptor:service:", v7, v8);
  v11 = v10;
  if (v10)
    v10[6] = 1;

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong(&self->_warningHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)dealloc
{
  void *v4;
  void *v5;
  objc_super v6;

  if (self->_state == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSAssertion debugDescription](self, "debugDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSAssertion.m"), 218, CFSTR("BUG IN CLIENT OF RUNNINGBOARD: Dealloc called before invalidate for assertion %@"), v5);

  }
  v6.receiver = self;
  v6.super_class = (Class)RBSAssertion;
  -[RBSAssertion dealloc](&v6, sel_dealloc);
}

- (NSString)explanation
{
  void *v2;
  void *v3;

  -[RBSAssertion descriptor](self, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "explanation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setInvalidationHandler:(id)a3
{
  void *v5;
  id invalidationHandler;
  void *v7;
  id v8;

  v8 = a3;
  os_unfair_lock_lock_with_options();
  if (self->_state)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSAssertion.m"), 208, CFSTR("can only call before acquisition"));

  }
  v5 = (void *)objc_msgSend(v8, "copy");
  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)invalidateSyncWithError:(id *)a3
{
  id v4;
  id v6;

  v6 = 0;
  -[RBSAssertion _clientInvalidateWithError:]((uint64_t)self, (uint64_t)&v6);
  v4 = v6;
  if (a3)
    *a3 = objc_retainAutorelease(v6);
  return v4 == 0;
}

void __47__RBSAssertion_acquireWithInvalidationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  os_unfair_lock_lock_with_options();
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  v5 = *(void **)(a1 + 32);
  v14 = 0;
  v6 = objc_msgSend(v5, "acquireWithError:", &v14);
  v7 = v14;
  if ((v6 & 1) == 0)
  {
    v8 = *(void **)(a1 + 40);
    if (v8)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __47__RBSAssertion_acquireWithInvalidationHandler___block_invoke_2;
      v11[3] = &unk_1E2D17418;
      v9 = v8;
      v10 = *(_QWORD *)(a1 + 32);
      v13 = v9;
      v11[4] = v10;
      v12 = v7;
      +[RBSWorkloop performCallout:]((uint64_t)RBSWorkloop, v11);

    }
  }

}

- (void)acquireWithInvalidationHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__RBSAssertion_acquireWithInvalidationHandler___block_invoke;
  v6[3] = &unk_1E2D17440;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  +[RBSWorkloop performBackgroundWork:](RBSWorkloop, "performBackgroundWork:", v6);

}

- (RBSAssertion)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSAssertion.m"), 56, CFSTR("-init is not allowed on RBSAssertion"));

  return 0;
}

uint64_t __47__RBSAssertion_acquireWithInvalidationHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (RBSTarget)target
{
  void *v2;
  void *v3;

  -[RBSAssertion descriptor](self, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "target");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (RBSTarget *)v3;
}

- (NSArray)attributes
{
  void *v2;
  void *v3;

  -[RBSAssertion descriptor](self, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __28__RBSAssertion_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "assertion:didInvalidateWithError:", *(_QWORD *)(a1 + 40), 0);
}

- (void)setExpirationWarningHandler:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  void *v12;
  id warningHandler;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_lock_with_options();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[RBSAssertion attributes](self, "attributes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "warningDuration");
          if (v11 > 0.0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

  if (self->_state)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSAssertion.m"), 254, CFSTR("can only call before acquisition"));

  }
  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSAssertion.m"), 255, CFSTR("this assertion does not contain an applicable RBSDurationAttribute"));

  }
  v12 = (void *)objc_msgSend(v5, "copy");
  warningHandler = self->_warningHandler;
  self->_warningHandler = v12;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)description
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("<%@>"), v3);

  return v4;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  unint64_t state;
  const __CFString *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  state = self->_state;
  if (state > 2)
    v6 = CFSTR("(invalid assertion state)");
  else
    v6 = off_1E2D174B0[state];
  -[RBSAssertion descriptor](self, "descriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p| state:%@ descriptor:<%@>"), v4, self, v6, v7);

  return v8;
}

- (void)_serverInvalidateWithError:(id)a3
{
  id v4;
  unint64_t state;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  state = self->_state;
  self->_state = 2;
  os_unfair_lock_unlock(&self->_lock);
  if (state != 2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__RBSAssertion__serverInvalidateWithError___block_invoke;
    v6[3] = &unk_1E2D17468;
    v6[4] = self;
    v7 = v4;
    +[RBSWorkloop performCallout:]((uint64_t)RBSWorkloop, v6);

  }
}

void __43__RBSAssertion__serverInvalidateWithError___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD);
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock_with_options();
  v2 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194018FEC](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 8);
  *(_QWORD *)(v8 + 8) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v15, "assertion:didInvalidateWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v16);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

  if (v2)
    v2[2](v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_serverWillInvalidate
{
  _QWORD v1[5];

  if (a1)
  {
    v1[0] = MEMORY[0x1E0C809B0];
    v1[1] = 3221225472;
    v1[2] = __37__RBSAssertion__serverWillInvalidate__block_invoke;
    v1[3] = &unk_1E2D17490;
    v1[4] = a1;
    +[RBSWorkloop performCallout:]((uint64_t)RBSWorkloop, v1);
  }
}

void __37__RBSAssertion__serverWillInvalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock_with_options();
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 48) == 1)
  {
    objc_msgSend(*(id *)(v2 + 8), "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x194018FEC](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 56));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "assertionWillInvalidate:", *(_QWORD *)(a1 + 32), (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  if (v4)
    v4[2](v4, *(_QWORD *)(a1 + 32));

}

- (void)_serverDidChangeIdentifier:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v7 = v3;
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel__serverDidChangeIdentifier_, a1, CFSTR("RBSAssertion.m"), 381, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

    }
    os_unfair_lock_lock_with_options();
    if (*(_QWORD *)(a1 + 48) == 1)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 60));
      v4 = objc_msgSend(*(id *)(a1 + 32), "copyWithIdentifier:", v7);
      v5 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v4;

      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 60));
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 40), "invalidateAssertionWithIdentifier:error:", v7, 0);
    }
    v3 = v7;
  }

}

@end
