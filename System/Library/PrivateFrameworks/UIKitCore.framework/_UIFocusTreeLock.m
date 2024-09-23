@implementation _UIFocusTreeLock

- (_UIFocusTreeLock)init
{
  _UIFocusTreeLock *v2;
  uint64_t v3;
  NSMapTable *lockedEnvironments;
  void *v6;
  uint64_t v7;
  NSTimer *validationTimer;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_UIFocusTreeLock;
  v2 = -[_UIFocusTreeLock init](&v15, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 258, 0, 10);
    lockedEnvironments = v2->_lockedEnvironments;
    v2->_lockedEnvironments = (NSMapTable *)v3;

    if (os_variant_has_internal_diagnostics())
    {
      objc_initWeak(&location, v2);
      v6 = (void *)MEMORY[0x1E0C99E88];
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __24___UIFocusTreeLock_init__block_invoke;
      v12 = &unk_1E16B26E0;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v6, "scheduledTimerWithTimeInterval:repeats:block:", 1, &v9, 5.0);
      v7 = objc_claimAutoreleasedReturnValue();
      validationTimer = v2->_validationTimer;
      v2->_validationTimer = (NSTimer *)v7;

      -[NSTimer setTolerance:](v2->_validationTimer, "setTolerance:", 1.0, v9, v10, v11, v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

- (void)lockEnvironmentTree:(id)a3
{
  id v5;
  _UIFocusTreeLockItem *v6;
  _UIFocusTreeLockItem *v7;
  _UIFocusTreeLockItem *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusTreeLock.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

  }
  -[NSMapTable objectForKey:](self->_lockedEnvironments, "objectForKey:", v5);
  v6 = (_UIFocusTreeLockItem *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    -[_UIFocusTreeLockItem lock](v6, "lock");
  }
  else
  {
    objc_initWeak(&location, self);
    v8 = [_UIFocusTreeLockItem alloc];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40___UIFocusTreeLock_lockEnvironmentTree___block_invoke;
    v10[3] = &unk_1E16BE280;
    objc_copyWeak(&v11, &location);
    v7 = -[_UIFocusTreeLockItem initWithEnvironment:finalUnlockHandler:](v8, "initWithEnvironment:finalUnlockHandler:", v5, v10);
    -[NSMapTable setObject:forKey:](self->_lockedEnvironments, "setObject:forKey:", v7, v5);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

- (BOOL)unlockEnvironmentTree:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  objc_class *v15;
  void *v16;
  __CFString *v17;
  id v18;
  void *v19;
  objc_class *v20;
  void *v21;
  uint8_t buf[4];
  __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusTreeLock.m"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

  }
  -[NSMapTable objectForKey:](self->_lockedEnvironments, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        goto LABEL_15;
      v18 = v5;
      if (v5)
      {
        v19 = (void *)MEMORY[0x1E0CB3940];
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p>"), v21, v18);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17 = CFSTR("(nil)");
      }

      *(_DWORD *)buf = 138412290;
      v23 = v17;
      _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "Unbalanced call to unlockEnvironmentTree: for an environment that is not locked: %@", buf, 0xCu);
    }
    else
    {
      v11 = unlockEnvironmentTree____s_category;
      if (!unlockEnvironmentTree____s_category)
      {
        v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v11, (unint64_t *)&unlockEnvironmentTree____s_category);
      }
      v12 = *(id *)(v11 + 8);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      v13 = v5;
      if (v5)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p>"), v16, v13);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17 = CFSTR("(nil)");
      }

      *(_DWORD *)buf = 138412290;
      v23 = v17;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Unbalanced call to unlockEnvironmentTree: for an environment that is not locked: %@", buf, 0xCu);
    }

LABEL_15:
    v8 = 1;
    goto LABEL_5;
  }
  v8 = objc_msgSend(v6, "unlock");
LABEL_5:

  return v8;
}

- (BOOL)isEnvironmentLocked:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL HaveCommonHierarchy;
  unint64_t v13;
  uint64_t v14;
  BOOL v15;
  NSObject *log;
  NSObject *loga;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMapTable objectEnumerator](self->_lockedEnvironments, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
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
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        objc_msgSend(v10, "environment");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          if (os_variant_has_internal_diagnostics())
          {
            __UIFaultDebugAssertLog();
            loga = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(loga, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v24 = v10;
              _os_log_fault_impl(&dword_185066000, loga, OS_LOG_TYPE_FAULT, "Found a nil focus environment in the list of locked environments. This is a UIKit bug. Additional info:\n%@", buf, 0xCu);
            }

          }
          else
          {
            v13 = isEnvironmentLocked____s_category;
            if (!isEnvironmentLocked____s_category)
            {
              v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v13, (unint64_t *)&isEnvironmentLocked____s_category);
            }
            log = *(NSObject **)(v13 + 8);
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v24 = v10;
              _os_log_impl(&dword_185066000, log, OS_LOG_TYPE_ERROR, "Found a nil focus environment in the list of locked environments. This is a UIKit bug. Additional info:\n%@", buf, 0xCu);
            }
          }
        }
        HaveCommonHierarchy = _UIFocusEnvironmentsHaveCommonHierarchy(v4, v11);

        if (HaveCommonHierarchy)
        {
          v15 = 1;
          goto LABEL_21;
        }
        ++v9;
      }
      while (v7 != v9);
      v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      v7 = v14;
    }
    while (v14);
  }
  v15 = 0;
LABEL_21:

  return v15;
}

- (void)_validateLockedEnvironments
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    CFAbsoluteTimeGetCurrent();
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[NSMapTable objectEnumerator](self->_lockedEnvironments, "objectEnumerator", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "validate");
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  +[UIDescriptionBuilder descriptionBuilderWithObject:](UIDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_lockedEnvironments, CFSTR("lockedEnvironments"));
  objc_msgSend(v3, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSMapTable)lockedEnvironments
{
  return self->_lockedEnvironments;
}

- (NSTimer)validationTimer
{
  return self->_validationTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationTimer, 0);
  objc_storeStrong((id *)&self->_lockedEnvironments, 0);
}

@end
