@implementation SBSystemActionAbstractDataSource

- (SBSystemAction)selectedSystemAction
{
  return self->_selectedSystemAction;
}

- (SBSystemActionAbstractDataSource)initWithHostIdentifier:(id)a3
{
  id v5;
  void *v6;
  SBSystemActionAbstractDataSource *v7;
  uint64_t v8;
  NSString *hostIdentifier;
  SBSystemActionAbstractDataSource *result;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)SBSystemActionAbstractDataSource;
    v7 = -[SBSystemActionAbstractDataSource init](&v12, sel_init);
    if (v7)
    {
      v8 = objc_msgSend(v6, "copy");
      hostIdentifier = v7->_hostIdentifier;
      v7->_hostIdentifier = (NSString *)v8;

      -[SBSystemActionAbstractDataSource updateSelectedAction](v7, "updateSelectedAction");
    }

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("hostIdentifier != ((void *)0)"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionAbstractDataSource initWithHostIdentifier:].cold.1(a2, (uint64_t)self, (uint64_t)v11);
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    result = (SBSystemActionAbstractDataSource *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)setSelectedSystemAction:(id)a3
{
  id v5;

  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedSystemAction, a3);
    -[SBSystemActionAbstractDataSource _notifyDidUpdateSelectedAction]((id *)&self->super.isa);
  }

}

- (void)_notifyDidUpdateSelectedAction
{
  void *v2;
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
  if (a1)
  {
    BSDispatchQueueAssertMain();
    objc_msgSend(a1, "selectedSystemAction");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(a1[1], "allObjects", 0);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "systemActionDataSource:didUpdateSelectedAction:", a1, v2);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)updateSelectedAction
{
  -[SBSystemActionAbstractDataSource setSelectedSystemAction:](self, "setSelectedSystemAction:", 0);
}

- (NSString)hostIdentifier
{
  return self->_hostIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedSystemAction, 0);
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (id)executorForSystemAction:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)initWithHostIdentifier:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBSystemActionAbstractDataSource.m");
  v16 = 1024;
  v17 = 27;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
