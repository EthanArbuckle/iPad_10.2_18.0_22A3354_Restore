@implementation _UIFocusTreeLockItem

- (_UIFocusTreeLockItem)initWithEnvironment:(id)a3 finalUnlockHandler:(id)a4
{
  id v6;
  id v7;
  _UIFocusTreeLockItem *v8;
  void *v9;
  id finalUnlockHandler;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  const __CFString *v15;
  NSString *environmentDescription;
  _UIWeakHelper *v17;
  _UIFocusTreeLockItem *v18;
  _UIWeakHelper *v19;
  uint64_t v21;
  NSMutableArray *lockCallStackSymbols;
  uint64_t v23;
  NSMutableArray *unlockCallStackSymbols;
  _QWORD v25[4];
  _UIFocusTreeLockItem *v26;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)_UIFocusTreeLockItem;
  v8 = -[_UIFocusTreeLockItem init](&v27, sel_init);
  if (v8)
  {
    v9 = _Block_copy(v7);
    finalUnlockHandler = v8->_finalUnlockHandler;
    v8->_finalUnlockHandler = v9;

    objc_storeWeak((id *)&v8->_environment, v6);
    v8->_unsafeEnvironment = (UIFocusEnvironment *)v6;
    v11 = v6;
    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@: %p>"), v14, v11);
      v15 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = CFSTR("(nil)");
    }

    environmentDescription = v8->_environmentDescription;
    v8->_environmentDescription = &v15->isa;

    v8->_lockCount = 0;
    v8->_lockTime = CFAbsoluteTimeGetCurrent();
    if (os_variant_has_internal_diagnostics() && _UIGetFocusTreeLockVerboseLogging())
    {
      v21 = objc_opt_new();
      lockCallStackSymbols = v8->_lockCallStackSymbols;
      v8->_lockCallStackSymbols = (NSMutableArray *)v21;

      v23 = objc_opt_new();
      unlockCallStackSymbols = v8->_unlockCallStackSymbols;
      v8->_unlockCallStackSymbols = (NSMutableArray *)v23;

    }
    v17 = [_UIWeakHelper alloc];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __63___UIFocusTreeLockItem_initWithEnvironment_finalUnlockHandler___block_invoke;
    v25[3] = &unk_1E16B1B28;
    v18 = v8;
    v26 = v18;
    v19 = -[_UIWeakHelper initWithDeallocationBlock:](v17, "initWithDeallocationBlock:", v25);
    objc_setAssociatedObject(v11, v18, v19, (void *)1);
    -[_UIFocusTreeLockItem lock](v18, "lock");

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIFocusTreeLockItem _cleanup:](self, "_cleanup:", 1);
  v3.receiver = self;
  v3.super_class = (Class)_UIFocusTreeLockItem;
  -[_UIFocusTreeLockItem dealloc](&v3, sel_dealloc);
}

- (void)lock
{
  NSMutableArray *lockCallStackSymbols;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  NSString *environmentDescription;
  unint64_t lockCount;
  int v9;
  NSString *v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  ++self->_lockCount;
  lockCallStackSymbols = self->_lockCallStackSymbols;
  if (lockCallStackSymbols)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](lockCallStackSymbols, "addObject:", v4);

  }
  v5 = lock___s_category;
  if (!lock___s_category)
  {
    v5 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&lock___s_category);
  }
  if ((*(_BYTE *)v5 & 1) != 0)
  {
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      environmentDescription = self->_environmentDescription;
      lockCount = self->_lockCount;
      v9 = 138412546;
      v10 = environmentDescription;
      v11 = 2048;
      v12 = lockCount;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Locking environment %@ — %lu locks total for this environment.", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (BOOL)unlock
{
  unint64_t lockCount;
  unint64_t v4;
  NSMutableArray *unlockCallStackSymbols;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  NSString *environmentDescription;
  unint64_t v10;
  unint64_t v11;
  void *v14;
  NSObject *v15;
  NSString *v16;
  NSObject *v17;
  CFAbsoluteTime v18;
  uint8_t buf[4];
  NSString *v20;
  __int16 v21;
  CFAbsoluteTime v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  lockCount = self->_lockCount;
  if (!lockCount)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusTreeLock.m"), 286, CFSTR("Overreleasing a lock. This is a UIKit bug. Additional info:\n%@"), self);

    lockCount = self->_lockCount;
  }
  v4 = lockCount - 1;
  self->_lockCount = v4;
  unlockCallStackSymbols = self->_unlockCallStackSymbols;
  if (unlockCallStackSymbols)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](unlockCallStackSymbols, "addObject:", v6);

    v4 = self->_lockCount;
  }
  if (v4)
  {
    v7 = qword_1ECD7D2F0;
    if (!qword_1ECD7D2F0)
    {
      v7 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&qword_1ECD7D2F0);
    }
    if ((*(_BYTE *)v7 & 1) != 0)
    {
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        environmentDescription = self->_environmentDescription;
        v10 = self->_lockCount;
        *(_DWORD *)buf = 138412546;
        v20 = environmentDescription;
        v21 = 2048;
        v22 = *(double *)&v10;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Unlocking environment %@ — %lu locks remaining for this environment.", buf, 0x16u);
      }
    }
  }
  else
  {
    v11 = _MergedGlobals_992;
    if (!_MergedGlobals_992)
    {
      v11 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&_MergedGlobals_992);
    }
    if ((*(_BYTE *)v11 & 1) != 0)
    {
      v15 = *(NSObject **)(v11 + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = self->_environmentDescription;
        v17 = v15;
        v18 = CFAbsoluteTimeGetCurrent() - self->_lockTime;
        *(_DWORD *)buf = 138412546;
        v20 = v16;
        v21 = 2048;
        v22 = v18;
        _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "Unlocking environment %@ after %.2fs — 0 locks remaining for this environment.", buf, 0x16u);

      }
    }
    -[_UIFocusTreeLockItem _cleanup:](self, "_cleanup:", 0);
  }
  return self->_lockCount == 0;
}

- (void)_cleanup:(BOOL)a3
{
  unint64_t v4;
  NSObject *v5;
  NSString *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  unint64_t v11;
  NSObject *WeakRetained;
  NSObject *v13;
  NSString *environmentDescription;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  NSString *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  _UIFocusTreeLockItem *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!self->_didCleanup || a3)
  {
    if (!self->_didCleanup && a3)
    {
      v11 = qword_1ECD7D300;
      if (!qword_1ECD7D300)
      {
        v11 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v11, (unint64_t *)&qword_1ECD7D300);
      }
      if ((*(_BYTE *)v11 & 1) != 0)
      {
        v13 = *(NSObject **)(v11 + 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          environmentDescription = self->_environmentDescription;
          v15 = (void *)MEMORY[0x1E0CB3978];
          v16 = v13;
          objc_msgSend(v15, "callStackSymbols");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138412802;
          v19 = environmentDescription;
          v20 = 2112;
          v21 = v17;
          v22 = 2112;
          v23 = self;
          _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Cleaning up environment lock for %@ from dealloc. Cleanup from dealloc might indicate an unbalanced lock call. Stack trace:\n%@\nAdditional info:\n%@", (uint8_t *)&v18, 0x20u);

        }
      }
    }
    self->_didCleanup = 1;
    (*((void (**)(void))self->_finalUnlockHandler + 2))();
    WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    v8 = WeakRetained;
    if (!WeakRetained)
      goto LABEL_18;
    objc_getAssociatedObject(WeakRetained, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");
    objc_setAssociatedObject(v8, self, 0, (void *)1);
LABEL_17:

LABEL_18:
    return;
  }
  v4 = qword_1ECD7D2F8;
  if (!qword_1ECD7D2F8)
  {
    v4 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, (unint64_t *)&qword_1ECD7D2F8);
  }
  if ((*(_BYTE *)v4 & 1) != 0)
  {
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = self->_environmentDescription;
      v7 = (void *)MEMORY[0x1E0CB3978];
      v8 = v5;
      objc_msgSend(v7, "callStackSymbols");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v6;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = self;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Ignoring call to cleanup environment lock for %@. Cleanup has already happened. Stack trace:\n%@\nAdditional info:\n%@", (uint8_t *)&v18, 0x20u);
      goto LABEL_17;
    }
  }
}

- (void)validate
{
  id WeakRetained;
  double v4;
  unint64_t v6;
  unint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  unint64_t v12;
  NSObject *v13;
  NSString *v14;
  NSObject *v15;
  NSString *v16;
  NSObject *v17;
  NSObject *v18;
  NSString *environmentDescription;
  int v20;
  _UIFocusTreeLockItem *v21;
  __int16 v22;
  double v23;
  __int16 v24;
  _UIFocusTreeLockItem *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  if (WeakRetained)
  {
    v4 = CFAbsoluteTimeGetCurrent() - self->_lockTime;
    if (!self->_didSoftAssert && v4 >= 20.0)
    {
      if ((_UIKitProcessIsBeingDebugged() & 1) == 0)
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            environmentDescription = self->_environmentDescription;
            v20 = 138412802;
            v21 = (_UIFocusTreeLockItem *)environmentDescription;
            v22 = 2048;
            v23 = v4;
            v24 = 2112;
            v25 = self;
            _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "Lock for environment %@ was aquired %.2f seconds ago and might be stuck. This can have a serious impact on focus updates. Additional info:\n%@", (uint8_t *)&v20, 0x20u);
          }

        }
        else
        {
          v12 = qword_1ECD7D310;
          if (!qword_1ECD7D310)
          {
            v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v12, (unint64_t *)&qword_1ECD7D310);
          }
          v13 = *(NSObject **)(v12 + 8);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v14 = self->_environmentDescription;
            v20 = 138412802;
            v21 = (_UIFocusTreeLockItem *)v14;
            v22 = 2048;
            v23 = v4;
            v24 = 2112;
            v25 = self;
            _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Lock for environment %@ was aquired %.2f seconds ago and might be stuck. This can have a serious impact on focus updates. Additional info:\n%@", (uint8_t *)&v20, 0x20u);
          }
        }
      }
      self->_didSoftAssert = 1;
    }
    if (v4 > 5.0)
    {
      v6 = qword_1ECD7D318;
      if (!qword_1ECD7D318)
      {
        v6 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v6, (unint64_t *)&qword_1ECD7D318);
      }
      if ((*(_BYTE *)v6 & 1) != 0)
      {
        v15 = *(NSObject **)(v6 + 8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = self->_environmentDescription;
          v20 = 138412546;
          v21 = (_UIFocusTreeLockItem *)v16;
          v22 = 2048;
          v23 = v4;
          v9 = "Lock for environment %@ was aquired %.2f seconds ago and might be stuck or take very long to be unlocked.";
          v10 = v15;
          v11 = 22;
          goto LABEL_25;
        }
      }
    }
  }
  else if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      v20 = 138412290;
      v21 = self;
      _os_log_fault_impl(&dword_185066000, v17, OS_LOG_TYPE_FAULT, "Found a nil focus environment in the list of locked environments. This is a UIKit bug. Additional info:\n%@", (uint8_t *)&v20, 0xCu);
    }

  }
  else
  {
    v7 = qword_1ECD7D308;
    if (!qword_1ECD7D308)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&qword_1ECD7D308);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v20 = 138412290;
      v21 = self;
      v9 = "Found a nil focus environment in the list of locked environments. This is a UIKit bug. Additional info:\n%@";
      v10 = v8;
      v11 = 12;
LABEL_25:
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v20, v11);
    }
  }

}

- (id)description
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  +[UIDescriptionBuilder descriptionBuilderWithObject:](UIDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  NSStringFromSelector(sel_environment);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:usingLightweightDescription:", v5, WeakRetained, 1);

  if (!WeakRetained)
  {
    NSStringFromSelector(sel_environmentDescription);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v3, "appendName:object:", v7, self->_environmentDescription);

  }
  NSStringFromSelector(sel_lockCount);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", v9, self->_lockCount);

  v11 = (id)objc_msgSend(v3, "appendName:doubleValue:", CFSTR("duration"), CFAbsoluteTimeGetCurrent() - self->_lockTime);
  if (self->_lockCallStackSymbols)
    v12 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("LOCK call stacks"));
  if (self->_unlockCallStackSymbols)
    v13 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("UNLOCK call stacks"));
  objc_msgSend(v3, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (UIFocusEnvironment)environment
{
  return (UIFocusEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (NSString)environmentDescription
{
  return self->_environmentDescription;
}

- (unint64_t)lockCount
{
  return self->_lockCount;
}

- (double)lockTime
{
  return self->_lockTime;
}

- (NSArray)lockCallStackSymbols
{
  return &self->_lockCallStackSymbols->super;
}

- (NSArray)unlockCallStackSymbols
{
  return &self->_unlockCallStackSymbols->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentDescription, 0);
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong(&self->_finalUnlockHandler, 0);
  objc_storeStrong((id *)&self->_unlockCallStackSymbols, 0);
  objc_storeStrong((id *)&self->_lockCallStackSymbols, 0);
}

@end
