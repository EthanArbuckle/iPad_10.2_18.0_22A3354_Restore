@implementation SBIdleTimerBase

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBIdleTimerBase;
  return -[SBIdleTimerBase hash](&v3, sel_hash);
}

- (void)removeIdleTimerObserver:(id)a3
{
  NSHashTable *observers;

  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
  if (!-[NSHashTable count](self->_observers, "count"))
  {
    observers = self->_observers;
    self->_observers = 0;

  }
}

- (void)addIdleTimerObserver:(id)a3
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

- (NSString)description
{
  return (NSString *)-[SBIdleTimerBase descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIdleTimerBase succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIdleTimerBase descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)removeAllIdleTimerObservers
{
  NSHashTable *observers;

  observers = self->_observers;
  if (observers)
  {
    self->_observers = 0;

  }
}

- (BOOL)isEqualToTimer:(id)a3
{
  return self == a3;
}

- (void)_logExpirationTimeout:(double)a3
{
  AnalyticsSendEventLazy();
}

id __41__SBIdleTimerBase__logExpirationTimeout___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("lockTimeout");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_makeObserversPerformSelector:(SEL)a3
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  objc_class *Class;
  IMP MethodImplementation;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  SEL v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  SBIdleTimerBase *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
  if (!v7)
    goto LABEL_15;
  v8 = v7;
  v27 = a2;
  v9 = 0;
  v10 = *(_QWORD *)v31;
  v28 = v6;
  v29 = *(_QWORD *)v31;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v31 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        Class = object_getClass(v12);
        MethodImplementation = class_getMethodImplementation(Class, a3);
        if (!MethodImplementation)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", v27, self, CFSTR("SBIdleTimerBase.m"), 134, CFSTR("really wanted an IMP here"));

        }
        SBLogIdleTimer();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = (void *)objc_opt_class();
          v17 = v16;
          NSStringFromSelector(a3);
          v18 = v8;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138544386;
          v35 = v16;
          v36 = 2048;
          v37 = self;
          v38 = 2114;
          v39 = v19;
          v40 = 2114;
          v41 = v20;
          v42 = 2048;
          v43 = v12;
          v21 = v20;
          _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> sending %{public}@ to <%{public}@: %p>", buf, 0x34u);

          v8 = v18;
          v6 = v28;
          v10 = v29;
        }

        ((void (*)(void *, SEL, SBIdleTimerBase *))MethodImplementation)(v12, a3, self);
        v9 = 1;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
  }
  while (v8);
  if ((v9 & 1) == 0)
  {
LABEL_15:
    SBLogIdleTimer();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (void *)objc_opt_class();
      v25 = v24;
      NSStringFromSelector(a3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v24;
      v36 = 2048;
      v37 = self;
      v38 = 2114;
      v39 = v26;
      _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> no observers for %{public}@", buf, 0x20u);

    }
  }

}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  void (**v5)(id, _QWORD);
  NSHashTable *observers;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a4;
  observers = self->_observers;
  if (observers)
  {
    -[NSHashTable allObjects](observers, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
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
          v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v5[2](v5, v12);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

- (BOOL)isDisabled
{
  objc_opt_class();
  OUTLINED_FUNCTION_9();
  return 1;
}

- (BOOL)isActivated
{
  objc_opt_class();
  OUTLINED_FUNCTION_9();
  return 0;
}

- (void)setActivated:(BOOL)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end
