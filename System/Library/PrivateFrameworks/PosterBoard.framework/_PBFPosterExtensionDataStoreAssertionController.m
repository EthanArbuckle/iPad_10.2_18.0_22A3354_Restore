@implementation _PBFPosterExtensionDataStoreAssertionController

- (_PBFPosterExtensionDataStoreAssertionController)initWithController:(id)a3
{
  id v4;
  _PBFPosterExtensionDataStoreAssertionController *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMapTable *v9;
  NSMapTable *internalLock_inUseAssertionsByIdentity;

  v4 = a3;
  v5 = -[_PBFPosterExtensionDataStoreAssertionController init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "inUseAssertionsByIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v9 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    }
    internalLock_inUseAssertionsByIdentity = v5->_internalLock_inUseAssertionsByIdentity;
    v5->_internalLock_inUseAssertionsByIdentity = v9;

  }
  return v5;
}

- (_PBFPosterExtensionDataStoreAssertionController)init
{
  _PBFPosterExtensionDataStoreAssertionController *v2;
  _PBFPosterExtensionDataStoreAssertionController *v3;
  uint64_t v4;
  NSMapTable *internalLock_inUseAssertionsByIdentity;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PBFPosterExtensionDataStoreAssertionController;
  v2 = -[_PBFPosterExtensionDataStoreAssertionController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_internalLock._os_unfair_lock_opaque = 0;
    if (!v2->_internalLock_inUseAssertionsByIdentity)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v4 = objc_claimAutoreleasedReturnValue();
      internalLock_inUseAssertionsByIdentity = v3->_internalLock_inUseAssertionsByIdentity;
      v3->_internalLock_inUseAssertionsByIdentity = (NSMapTable *)v4;

    }
  }
  return v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  os_unfair_lock_t lock;
  void *v18;
  id obj;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  lock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMapTable keyEnumerator](self->_internalLock_inUseAssertionsByIdentity, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_internalLock_inUseAssertionsByIdentity, "objectForKey:", v8, lock);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v10 = (void *)objc_opt_new();
          objc_msgSend(v3, "setObject:forKey:", v10, v8);
        }
        objc_msgSend(v9, "objectEnumerator");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allObjects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __62___PBFPosterExtensionDataStoreAssertionController_description__block_invoke;
        v20[3] = &unk_1E86F60E0;
        v21 = v10;
        v13 = v10;
        objc_msgSend(v12, "enumerateObjectsUsingBlock:", v20);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v5);
  }

  os_unfair_lock_unlock(lock);
  objc_msgSend(v3, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendDictionarySection:withName:skipIfEmpty:", v14, CFSTR("assertion reasons for URL"), 0);

  objc_msgSend(v18, "build");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (NSMapTable)inUseAssertionsByIdentity
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = (void *)-[NSMapTable copy](self->_internalLock_inUseAssertionsByIdentity, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return (NSMapTable *)v4;
}

- (void)invalidate
{
  os_unfair_lock_s *p_internalLock;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  self->_internalLock_invalidated = 1;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = (void *)-[NSMapTable copy](self->_internalLock_inUseAssertionsByIdentity, "copy");
  objc_msgSend(v4, "keyEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[NSMapTable objectForKey:](self->_internalLock_inUseAssertionsByIdentity, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v16;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v16 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "invalidate");
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v12);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  -[NSMapTable removeAllObjects](self->_internalLock_inUseAssertionsByIdentity, "removeAllObjects");
  os_unfair_lock_unlock(p_internalLock);
}

- (BOOL)acquireInUseAssertionForIdentity:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  BOOL result;
  void *v14;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = v7;
    if (v6)
    {
      v9 = objc_alloc(MEMORY[0x1E0D01868]);
      objc_msgSend(v6, "stablePersistenceIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithIdentifier:forReason:invalidationBlock:", v10, v8, &__block_literal_global_25);

      v12 = -[_PBFPosterExtensionDataStoreAssertionController _appendAssertion:forIdentity:](self, "_appendAssertion:forIdentity:", v11, v6);
    }
    else
    {
      v12 = 0;
    }

    return v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("isActiveReason"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_PBFPosterExtensionDataStoreAssertionController acquireInUseAssertionForIdentity:reason:].cold.1();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)invalidateInUseAssertionForIdentity:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  BOOL v18;
  void *v20;
  os_unfair_lock_t lock;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("isActiveReason"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_PBFPosterExtensionDataStoreAssertionController invalidateInUseAssertionForIdentity:reason:].cold.1();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA97E74);
  }
  v8 = v7;
  if (v6)
  {
    lock = &self->_internalLock;
    os_unfair_lock_lock(&self->_internalLock);
    -[NSMapTable objectForKey:](self->_internalLock_inUseAssertionsByIdentity, "objectForKey:", v6);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
LABEL_5:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
        objc_msgSend(v14, "reason");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v8);

        if ((v16 & 1) != 0)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v11)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
      v17 = v14;

      if (!v17)
        goto LABEL_14;
      v18 = -[_PBFPosterExtensionDataStoreAssertionController _internalLock_removeAssertion:forIdentity:](self, "_internalLock_removeAssertion:forIdentity:", v17, v6);
    }
    else
    {
LABEL_11:

      v17 = 0;
LABEL_14:
      v18 = 0;
    }
    os_unfair_lock_unlock(lock);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (int64_t)numberOfAssertionsForReason:(id)a3
{
  void *v3;
  int64_t v4;

  -[_PBFPosterExtensionDataStoreAssertionController inUsePosterPathIdentitiesForReason:](self, "inUsePosterPathIdentitiesForReason:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)inUsePosterPathIdentitiesForReason:(id)a3
{
  id v4;
  void *v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  int v14;
  void *v15;
  os_unfair_lock_t lock;
  id obj;
  uint64_t v19;
  _PBFPosterExtensionDataStoreAssertionController *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  lock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v20 = self;
  -[NSMapTable keyEnumerator](self->_internalLock_inUseAssertionsByIdentity, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v21)
  {
    v19 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        -[NSMapTable objectForKey:](v20->_internalLock_inUseAssertionsByIdentity, "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v23 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "reason");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "isEqual:", v4);

              if (v14)
                objc_msgSend(v5, "addObject:", v7);
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v10);
        }

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v21);
  }

  os_unfair_lock_unlock(lock);
  v15 = (void *)objc_msgSend(v5, "copy");

  return v15;
}

- (int64_t)_numberOfInUseAssertionsForIdentity:(id)a3
{
  id v4;
  os_unfair_lock_s *p_internalLock;
  int64_t v6;
  void *v7;

  v4 = a3;
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  if (self->_internalLock_invalidated)
  {
    v6 = 0;
  }
  else
  {
    -[NSMapTable objectForKey:](self->_internalLock_inUseAssertionsByIdentity, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "count");

  }
  os_unfair_lock_unlock(p_internalLock);

  return v6;
}

- (BOOL)_appendAssertion:(id)a3 forIdentity:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_internalLock;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v9 = !self->_internalLock_invalidated
    && -[_PBFPosterExtensionDataStoreAssertionController _internalLock_appendAssertion:forIdentity:](self, "_internalLock_appendAssertion:forIdentity:", v6, v7);
  os_unfair_lock_unlock(p_internalLock);

  return v9;
}

- (BOOL)_internalLock_appendAssertion:(id)a3 forIdentity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identity"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_PBFPosterExtensionDataStoreAssertionController _internalLock_appendAssertion:forIdentity:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_19;
  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("assertion"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_PBFPosterExtensionDataStoreAssertionController _internalLock_appendAssertion:forIdentity:].cold.2();
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA983BCLL);
  }
  v8 = v7;
  if (!self->_internalLock_invalidated)
  {
    -[NSMapTable objectForKey:](self->_internalLock_inUseAssertionsByIdentity, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10 == 0;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](self->_internalLock_inUseAssertionsByIdentity, "setObject:forKey:", v10, v8);
    }
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __93___PBFPosterExtensionDataStoreAssertionController__internalLock_appendAssertion_forIdentity___block_invoke;
    v21 = &unk_1E86F6148;
    v12 = v6;
    v22 = v12;
    v13 = objc_msgSend(v11, "bs_containsObjectPassingTest:", &v18);

    if (!v13)
    {

      objc_msgSend(v10, "addObject:", v12);
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("![[assertions allObjects] bs_containsObjectPassingTest:^BOOL(BSSimpleAssertion *otherAssertions) { return [[otherAssertions reason] isEqual:[assertion reason]]; }]"),
      v18,
      v19,
      v20,
      v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_PBFPosterExtensionDataStoreAssertionController _internalLock_appendAssertion:forIdentity:].cold.3();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
LABEL_19:
    JUMPOUT(0x1CBA98358);
  }
  v9 = 0;
LABEL_9:

  return v9;
}

- (BOOL)_removeAssertion:(id)a3 forIdentity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  os_unfair_lock_s *p_internalLock;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identity"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_PBFPosterExtensionDataStoreAssertionController _removeAssertion:forIdentity:].cold.1();
LABEL_12:
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA98574);
  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("assertion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_PBFPosterExtensionDataStoreAssertionController _removeAssertion:forIdentity:].cold.2();
    goto LABEL_12;
  }
  v8 = v7;
  if (self->_internalLock_invalidated)
  {
    v9 = 0;
  }
  else
  {
    p_internalLock = &self->_internalLock;
    os_unfair_lock_lock(&self->_internalLock);
    v9 = -[_PBFPosterExtensionDataStoreAssertionController _internalLock_removeAssertion:forIdentity:](self, "_internalLock_removeAssertion:forIdentity:", v6, v8);
    os_unfair_lock_unlock(p_internalLock);
  }

  return v9;
}

- (BOOL)_internalLock_removeAssertion:(id)a3 forIdentity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identity"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_PBFPosterExtensionDataStoreAssertionController _internalLock_removeAssertion:forIdentity:].cold.1();
LABEL_18:
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA98704);
  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("assertion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_PBFPosterExtensionDataStoreAssertionController _internalLock_removeAssertion:forIdentity:].cold.2();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA98768);
  }
  v8 = v7;
  if (self->_internalLock_invalidated)
  {
    v9 = 0;
    goto LABEL_9;
  }
  -[NSMapTable objectForKey:](self->_internalLock_inUseAssertionsByIdentity, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "containsObject:", v6) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[assertions containsObject:assertion]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_PBFPosterExtensionDataStoreAssertionController _internalLock_removeAssertion:forIdentity:].cold.3();
    goto LABEL_18;
  }
  objc_msgSend(v10, "removeObject:", v6);
  objc_msgSend(v6, "invalidate");
  v11 = objc_msgSend(v10, "count");
  v9 = v11 == 0;
  if (!v11)
    -[NSMapTable removeObjectForKey:](self->_internalLock_inUseAssertionsByIdentity, "removeObjectForKey:", v8);

LABEL_9:
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalLock_inUseAssertionsByIdentity, 0);
}

- (void)acquireInUseAssertionForIdentity:reason:.cold.1()
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
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)invalidateInUseAssertionForIdentity:reason:.cold.1()
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
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_internalLock_appendAssertion:forIdentity:.cold.1()
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
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_internalLock_appendAssertion:forIdentity:.cold.2()
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
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_internalLock_appendAssertion:forIdentity:.cold.3()
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
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_removeAssertion:forIdentity:.cold.1()
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
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_removeAssertion:forIdentity:.cold.2()
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
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_internalLock_removeAssertion:forIdentity:.cold.1()
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
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_internalLock_removeAssertion:forIdentity:.cold.2()
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
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_internalLock_removeAssertion:forIdentity:.cold.3()
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
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
