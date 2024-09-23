@implementation SBDisplayTransformerRegistry

- (id)_initWithOverrideTransformUpdater:(id)a3
{
  id v5;
  SBDisplayTransformerRegistry *v6;
  SBDisplayTransformerRegistry *v7;
  uint64_t v8;
  NSMutableSet *lock_transformers;
  uint64_t v10;
  BSInvalidatable *stateCaptureToken;
  SBDisplayTransformerRegistry *v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBDisplayTransformerRegistry;
  v6 = -[SBDisplayTransformerRegistry init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    lock_transformers = v7->_lock_transformers;
    v7->_lock_transformers = (NSMutableSet *)v8;

    objc_storeStrong((id *)&v7->_overrideTransformUpdater, a3);
    v13 = v7;
    BSLogAddStateCaptureBlockWithTitle();
    v10 = objc_claimAutoreleasedReturnValue();
    stateCaptureToken = v13->_stateCaptureToken;
    v13->_stateCaptureToken = (BSInvalidatable *)v10;

  }
  return v7;
}

id __66__SBDisplayTransformerRegistry__initWithOverrideTransformUpdater___block_invoke(uint64_t a1)
{
  void *v2;

  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 8));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 32), "_lock_description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  return v2;
}

+ (SBDisplayTransformerRegistry)sharedInstance
{
  if (sharedInstance_onceToken_24 != -1)
    dispatch_once(&sharedInstance_onceToken_24, &__block_literal_global_165);
  return (SBDisplayTransformerRegistry *)(id)sharedInstance___result_1;
}

void __46__SBDisplayTransformerRegistry_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SBDisplayTransformerRegistry _initWithOverrideTransformUpdater:]([SBDisplayTransformerRegistry alloc], "_initWithOverrideTransformUpdater:", 0);
  v1 = (void *)sharedInstance___result_1;
  sharedInstance___result_1 = (uint64_t)v0;

}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_stateCaptureToken, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBDisplayTransformerRegistry;
  -[SBDisplayTransformerRegistry dealloc](&v3, sel_dealloc);
}

- (id)addTransformer:(id)a3 withIdentifier:(id)a4
{
  id v7;
  id v8;
  id v9;
  objc_class *v10;
  void *v11;
  id v12;
  void *v13;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  id location;

  v7 = a3;
  v8 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  objc_initWeak(&location, self);
  v9 = objc_alloc(MEMORY[0x1E0D01868]);
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __62__SBDisplayTransformerRegistry_addTransformer_withIdentifier___block_invoke;
  v19 = &unk_1E8EA4CC0;
  objc_copyWeak(&v21, &location);
  v12 = v7;
  v20 = v12;
  v13 = (void *)objc_msgSend(v9, "initWithIdentifier:forReason:invalidationBlock:", v8, v11, &v16);

  LODWORD(v11) = -[NSMutableSet containsObject:](self->_lock_transformers, "containsObject:", v12);
  -[NSMutableSet addObject:](self->_lock_transformers, "addObject:", v12);
  os_unfair_lock_unlock(&self->_lock);
  if ((_DWORD)v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayTransformerRegistry.m"), 85, CFSTR("transformer already registered: %@"), v12, v16, v17, v18, v19);

  }
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v13;
}

void __62__SBDisplayTransformerRegistry_addTransformer_withIdentifier___block_invoke(uint64_t a1)
{
  os_unfair_lock *WeakRetained;
  os_unfair_lock_s *v3;
  void *v4;
  id *v5;

  WeakRetained = (os_unfair_lock *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained + 2;
    v5 = (id *)WeakRetained;
    os_unfair_lock_assert_not_owner(WeakRetained + 2);
    os_unfair_lock_lock(v3);
    objc_msgSend(v5[2], "removeObject:", *(_QWORD *)(a1 + 32));
    os_unfair_lock_unlock(v3);
    objc_msgSend(v5, "transformUpdater");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateTransformsWithCompletion:", 0);

    WeakRetained = (os_unfair_lock *)v5;
  }

}

- (id)transformUpdater
{
  SBFBDisplayManagerTransformUpdating *overrideTransformUpdater;

  overrideTransformUpdater = self->_overrideTransformUpdater;
  if (overrideTransformUpdater)
    return overrideTransformUpdater;
  objc_msgSend(MEMORY[0x1E0D228F8], "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)transformDisplayConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  id v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  SBDisplayTransformerRegistry *v28;
  os_unfair_lock_t lock;
  NSMutableSet *obj;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  char v36;
  uint64_t v37;
  id v38;
  id v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v4, "identity");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v28 = self;
  obj = self->_lock_transformers;
  v33 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v33)
  {
    v37 = 0;
    v36 = 0;
    v6 = 0;
    v7 = 0;
    v31 = v4;
    v32 = *(_QWORD *)v46;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v46 != v32)
        objc_enumerationMutation(obj);
      if (v7)
        break;
      v9 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v8);
      objc_msgSend(v9, "transformDisplayConfiguration:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v38 = v10;
      v11 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      if (v11)
      {
        v12 = v11;
        v34 = v8;
        v35 = v6;
        v13 = *(_QWORD *)v42;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v42 != v13)
              objc_enumerationMutation(v38);
            v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_msgSend(v15, "identity");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              v7 = 0;
            }
            else
            {
              v7 = v9;
              v36 = 1;
            }
            objc_msgSend(v16, "rootIdentity");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqual:", v40);

            if ((v18 & 1) == 0)
            {
              v19 = v9;

              LOBYTE(v37) = 1;
              v7 = v19;
            }
            if (objc_msgSend(v5, "containsObject:", v16))
            {
              v20 = v9;

              BYTE4(v37) = 1;
              v7 = v20;
            }
            if (v7)
            {
              v6 = v15;

              v4 = v31;
              goto LABEL_24;
            }
            objc_msgSend(v5, "addObject:", v16);
            objc_msgSend(v39, "addObject:", v15);

          }
          v12 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          if (v12)
            continue;
          break;
        }
        v7 = 0;
        v4 = v31;
        v6 = v35;
LABEL_24:
        v8 = v34;
      }
      else
      {
        v7 = 0;
      }

      if (++v8 == v33)
      {
        v33 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        if (v33)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v37 = 0;
    v36 = 0;
    v6 = 0;
    v7 = 0;
  }

  os_unfair_lock_unlock(lock);
  if (v7)
  {
    if ((v36 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if ((v37 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identity");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identity");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v28, CFSTR("SBDisplayTransformerRegistry.m"), 146, CFSTR("received configuration from %@ with identity %@ disjoint from source: %@"), v7, v24, v25);

    }
    if ((v37 & 0x100000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v28, CFSTR("SBDisplayTransformerRegistry.m"), 147, CFSTR("received non-unique configuration from %@ with identity %@"), v7, v6);

    }
  }
  if ((objc_msgSend(v39, "containsObject:", v4) & 1) == 0)
    objc_msgSend(v39, "addObject:", v4);

  return v39;
}

- (id)_lock_description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet allObjects](self->_lock_transformers, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v4, CFSTR("transformers"), 0);

  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideTransformUpdater, 0);
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
  objc_storeStrong((id *)&self->_lock_transformers, 0);
}

@end
