@implementation SBContinuityDisplayLayoutPublisher

- (SBContinuityDisplayLayoutPublisher)initWithCoordinator:(id)a3
{
  id v5;
  SBContinuityDisplayLayoutPublisher *v6;
  SBContinuityDisplayLayoutPublisher *v7;
  uint64_t v8;
  FBSDisplayLayoutPublisher *rootPublisher;
  uint64_t v10;
  NSHashTable *observers;
  NSMutableDictionary *v12;
  NSMutableDictionary *elementsPendingActivation;
  NSMutableDictionary *v14;
  NSMutableDictionary *activeElements;
  NSMutableDictionary *v16;
  NSMutableDictionary *transitionsPendingActivation;
  NSMutableDictionary *v18;
  NSMutableDictionary *activeTransitions;
  FBSDisplayLayout *v20;
  FBSDisplayLayout *emptyLayout;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SBContinuityDisplayLayoutPublisher;
  v6 = -[SBContinuityDisplayLayoutPublisher init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coordinator, a3);
    objc_msgSend(v5, "rootPublisher");
    v8 = objc_claimAutoreleasedReturnValue();
    rootPublisher = v7->_rootPublisher;
    v7->_rootPublisher = (FBSDisplayLayoutPublisher *)v8;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v10 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    elementsPendingActivation = v7->_elementsPendingActivation;
    v7->_elementsPendingActivation = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    activeElements = v7->_activeElements;
    v7->_activeElements = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    transitionsPendingActivation = v7->_transitionsPendingActivation;
    v7->_transitionsPendingActivation = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    activeTransitions = v7->_activeTransitions;
    v7->_activeTransitions = v18;

    v20 = (FBSDisplayLayout *)objc_alloc_init(MEMORY[0x1E0D230C0]);
    emptyLayout = v7->_emptyLayout;
    v7->_emptyLayout = v20;

    v7->_pendedBacklightLevel = -[FBSDisplayLayout displayBacklightLevel](v7->_emptyLayout, "displayBacklightLevel");
    v7->_pendedInterfaceOrientation = -[FBSDisplayLayout interfaceOrientation](v7->_emptyLayout, "interfaceOrientation");
  }

  return v7;
}

- (void)dealloc
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setDisplayConfiguration:(id)a3
{
  id v5;
  FBSDisplayConfiguration *v6;
  FBSDisplayConfiguration *displayConfiguration;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_displayConfiguration)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuityDisplayLayoutPublisher.m"), 64, CFSTR("Alreadying tracking a display configuration"));

    v5 = v9;
  }
  v6 = (FBSDisplayConfiguration *)objc_msgSend(v5, "copy");
  displayConfiguration = self->_displayConfiguration;
  self->_displayConfiguration = v6;

}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (FBSDisplayLayout)currentLayout
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  FBSDisplayLayout *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (self->_activated)
  {
    if (self->_invalidated)
    {
      SBLogContinuitySession();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        -[SBContinuityDisplayLayoutPublisher currentLayout].cold.2(v3, v4, v5, v6, v7, v8, v9, v10);

      v11 = 0;
    }
    else
    {
      -[FBSDisplayLayoutPublisher currentLayout](self->_rootPublisher, "currentLayout");
      v11 = (FBSDisplayLayout *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    SBLogContinuitySession();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[SBContinuityDisplayLayoutPublisher currentLayout].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    v11 = self->_emptyLayout;
  }
  return v11;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_activated)
  {
    if (self->_invalidated)
    {
      SBLogContinuitySession();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        BSInterfaceOrientationDescription();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543362;
        v10 = v6;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring setting interface orientation on display layout publisher to %{public}@ because it is invalid", (uint8_t *)&v9, 0xCu);

      }
    }
    else
    {
      -[FBSDisplayLayoutPublisher setInterfaceOrientation:](self->_rootPublisher, "setInterfaceOrientation:", a3);
    }
  }
  else
  {
    SBLogContinuitySession();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BSInterfaceOrientationDescription();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Pending setting interface orientation on display layout publisher to %{public}@ because it is not activated", (uint8_t *)&v9, 0xCu);

    }
    self->_pendedInterfaceOrientation = a3;
  }
}

- (int64_t)interfaceOrientation
{
  FBSDisplayLayout *emptyLayout;

  if (!self->_activated)
    return self->_pendedInterfaceOrientation;
  if (self->_invalidated)
    emptyLayout = self->_emptyLayout;
  else
    emptyLayout = self->_rootPublisher;
  return -[FBSDisplayLayout interfaceOrientation](emptyLayout, "interfaceOrientation");
}

- (void)setBacklightLevel:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_activated)
  {
    if (self->_invalidated)
    {
      SBLogContinuitySession();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 134217984;
        v8 = a3;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring setting backlight level display layout publisher to %ld because it is invalid", (uint8_t *)&v7, 0xCu);
      }

    }
    else
    {
      -[FBSDisplayLayoutPublisher setBacklightLevel:](self->_rootPublisher, "setBacklightLevel:", a3);
    }
  }
  else
  {
    SBLogContinuitySession();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = a3;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Pending setting backlight level on display layout publisher to %ld because it is not activated", (uint8_t *)&v7, 0xCu);
    }

    self->_pendedBacklightLevel = a3;
  }
}

- (int64_t)backlightLevel
{
  if (!self->_activated)
    return self->_pendedBacklightLevel;
  if (self->_invalidated)
    return -[FBSDisplayLayout displayBacklightLevel](self->_emptyLayout, "displayBacklightLevel");
  return -[FBSDisplayLayoutPublisher backlightLevel](self->_rootPublisher, "backlightLevel");
}

- (void)addObserver:(id)a3
{
  if (a3)
    -[NSHashTable addObject:](self->_observers, "addObject:");
}

- (void)removeObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
}

- (id)addElement:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 invalidated;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@:%p %@>"), v7, v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_activated)
  {
    invalidated = self->_invalidated;
    SBLogContinuitySession();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (invalidated)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v25 = v4;
        _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Failed to add element %{public}@ to display layout publisher because it is invalid", buf, 0xCu);
      }

      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01868]), "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.springBoard.continuity.layout.publisher.add-element"), v9, &__block_literal_global_303);
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[SBContinuityDisplayLayoutPublisher addElement:].cold.1((uint64_t)v4, v12, v16);

      -[FBSDisplayLayoutPublisher addElement:](self->_rootPublisher, "addElement:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_activeElements, "setObject:forKey:", v17, v9);
      v18 = objc_alloc(MEMORY[0x1E0D01868]);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __49__SBContinuityDisplayLayoutPublisher_addElement___block_invoke_20;
      v20[3] = &unk_1E8EA8488;
      v20[4] = self;
      v21 = v9;
      v13 = (void *)objc_msgSend(v18, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.springBoard.continuity.layout.publisher.add-element"), v21, v20);

    }
  }
  else
  {
    SBLogContinuitySession();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v4;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Pending activation of layout element %{public}@ to display layout publisher because the layout monitor is not activated yet", buf, 0xCu);
    }

    -[NSMutableDictionary setObject:forKey:](self->_elementsPendingActivation, "setObject:forKey:", v4, v9);
    v15 = objc_alloc(MEMORY[0x1E0D01868]);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __49__SBContinuityDisplayLayoutPublisher_addElement___block_invoke;
    v22[3] = &unk_1E8EA8488;
    v22[4] = self;
    v23 = v9;
    v13 = (void *)objc_msgSend(v15, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.springBoard.continuity.layout.publisher.add-element"), v23, v22);

  }
  return v13;
}

uint64_t __49__SBContinuityDisplayLayoutPublisher_addElement___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeElementForKey:", *(_QWORD *)(a1 + 40));
}

uint64_t __49__SBContinuityDisplayLayoutPublisher_addElement___block_invoke_20(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeElementForKey:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isTransitioning
{
  return -[NSMutableDictionary count](self->_transitionsPendingActivation, "count")
      || -[NSMutableDictionary count](self->_activeTransitions, "count") != 0;
}

- (id)transitionAssertionWithReason:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  NSObject *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  NSObject *v15;
  NSMutableDictionary *transitionsPendingActivation;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "UUIDString");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("nil");
  if (v4)
    v9 = v4;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@:%p (%@)>"), v7, v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_activated)
  {
    if (self->_invalidated)
    {
      SBLogContinuitySession();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v4;
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Failed to start transition with reason %{public}@ for display layout publisher because it is invalid", buf, 0xCu);
      }

      v12 = objc_alloc(MEMORY[0x1E0D01868]);
      if (v4)
        v13 = v4;
      else
        v13 = CFSTR("<nil>");
      v14 = (void *)objc_msgSend(v12, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.springBoard.continuity.layout.publisher.transition"), v13, &__block_literal_global_31_4);
    }
    else
    {
      -[FBSDisplayLayoutPublisher transitionAssertionWithReason:](self->_rootPublisher, "transitionAssertionWithReason:", v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_activeTransitions, "setObject:forKey:", v18, v10);
      v19 = objc_alloc(MEMORY[0x1E0D01868]);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __68__SBContinuityDisplayLayoutPublisher_transitionAssertionWithReason___block_invoke_2;
      v22[3] = &unk_1E8EA8488;
      v22[4] = self;
      v23 = v10;
      v14 = (void *)objc_msgSend(v19, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.springBoard.continuity.layout.publisher.transition"), v23, v22);

    }
  }
  else
  {
    SBLogContinuitySession();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v4;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Pending transition with reason %{public}@ to display layout publisher because the layout monitor is not activated yet", buf, 0xCu);
    }

    transitionsPendingActivation = self->_transitionsPendingActivation;
    if (v4)
    {
      v17 = (void *)-[__CFString copy](v4, "copy");
      -[NSMutableDictionary setObject:forKey:](transitionsPendingActivation, "setObject:forKey:", v17, v10);

    }
    else
    {
      -[NSMutableDictionary setObject:forKey:](self->_transitionsPendingActivation, "setObject:forKey:", CFSTR("__SBContinuityDisplayLayoutPublisherUnknownTransitionReason__"), v10);
    }
    v20 = objc_alloc(MEMORY[0x1E0D01868]);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __68__SBContinuityDisplayLayoutPublisher_transitionAssertionWithReason___block_invoke;
    v24[3] = &unk_1E8EA8488;
    v24[4] = self;
    v25 = v10;
    v14 = (void *)objc_msgSend(v20, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.springBoard.continuity.layout.publisher.transition"), v25, v24);

  }
  return v14;
}

uint64_t __68__SBContinuityDisplayLayoutPublisher_transitionAssertionWithReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeTransitionForKey:", *(_QWORD *)(a1 + 40));
}

uint64_t __68__SBContinuityDisplayLayoutPublisher_transitionAssertionWithReason___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeTransitionForKey:", *(_QWORD *)(a1 + 40));
}

- (void)flush
{
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_activated && !self->_invalidated)
  {
    -[FBSDisplayLayoutPublisher flush](self->_rootPublisher, "flush");
  }
  else
  {
    SBLogContinuitySession();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_invalidated)
        v4 = CFSTR("invalid");
      else
        v4 = CFSTR("not activated");
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Failed to flush display layout publisher because it is %{public}@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)invalidate
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  FBSDisplayLayoutPublisher *rootPublisher;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  self->_invalidated = 1;
  -[FBSDisplayLayoutPublisher removeObserver:](self->_rootPublisher, "removeObserver:", self);
  -[FBSDisplayLayoutPublisher transitionAssertionWithReason:](self->_rootPublisher, "transitionAssertionWithReason:", CFSTR("invalidating continuity publisher"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSDisplayLayoutPublisher setDisplayConfiguration:](self->_rootPublisher, "setDisplayConfiguration:", 0);
  -[FBSDisplayLayoutPublisher setBacklightLevel:](self->_rootPublisher, "setBacklightLevel:", -[FBSDisplayLayout displayBacklightLevel](self->_emptyLayout, "displayBacklightLevel"));
  -[FBSDisplayLayoutPublisher setInterfaceOrientation:](self->_rootPublisher, "setInterfaceOrientation:", -[FBSDisplayLayout interfaceOrientation](self->_emptyLayout, "interfaceOrientation"));
  -[NSMutableDictionary removeAllObjects](self->_elementsPendingActivation, "removeAllObjects");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableDictionary allKeys](self->_activeElements, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_activeElements, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "invalidate");

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  -[NSMutableDictionary removeAllObjects](self->_activeElements, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_transitionsPendingActivation, "removeAllObjects");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary allKeys](self->_activeTransitions, "allKeys", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_activeTransitions, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "invalidate");

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v12);
  }

  -[NSMutableDictionary removeAllObjects](self->_activeTransitions, "removeAllObjects");
  -[BSInvalidatable invalidate](self->_coordinatorActivation, "invalidate");
  objc_msgSend(v3, "invalidate");
  rootPublisher = self->_rootPublisher;
  -[SBContinuityDisplayLayoutPublisher currentLayout](self, "currentLayout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBContinuityDisplayLayoutPublisher publisher:didUpdateLayout:withTransition:](self, "publisher:didUpdateLayout:withTransition:", rootPublisher, v17, 0);

}

- (void)activate
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_removeElementForKey:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[NSMutableDictionary objectForKey:](self->_elementsPendingActivation, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    SBLogContinuitySession();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[SBContinuityDisplayLayoutPublisher _removeElementForKey:].cold.1((uint64_t)v5, v6, v7);

  }
  -[NSMutableDictionary removeObjectForKey:](self->_elementsPendingActivation, "removeObjectForKey:", v4);
  -[NSMutableDictionary objectForKey:](self->_activeElements, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");
  -[NSMutableDictionary removeObjectForKey:](self->_activeElements, "removeObjectForKey:", v4);

}

- (void)_removeTransitionForKey:(id)a3
{
  id v4;
  __CFString *v5;
  NSObject *v6;
  void *v7;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[NSMutableDictionary objectForKey:](self->_transitionsPendingActivation, "objectForKey:", v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    SBLogContinuitySession();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[SBContinuityDisplayLayoutPublisher _removeTransitionForKey:].cold.1(v5, v6);

  }
  -[NSMutableDictionary removeObjectForKey:](self->_transitionsPendingActivation, "removeObjectForKey:", v4);
  -[NSMutableDictionary objectForKey:](self->_activeTransitions, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");
  -[NSMutableDictionary removeObjectForKey:](self->_activeTransitions, "removeObjectForKey:", v4);

}

- (void)publisher:(id)a3 didUpdateLayout:(id)a4 withTransition:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSHashTable *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_observers;
  v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "publisher:didUpdateLayout:withTransition:", v8, v9, v10, (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTransitions, 0);
  objc_storeStrong((id *)&self->_transitionsPendingActivation, 0);
  objc_storeStrong((id *)&self->_activeElements, 0);
  objc_storeStrong((id *)&self->_elementsPendingActivation, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_emptyLayout, 0);
  objc_storeStrong((id *)&self->_rootPublisher, 0);
  objc_storeStrong((id *)&self->_coordinatorActivation, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

- (void)currentLayout
{
  OUTLINED_FUNCTION_0(&dword_1D0540000, a1, a3, "display layout publisher is returning a nil currentLayout because it is invalid", a5, a6, a7, a8, 0);
}

- (void)addElement:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, a3, "Adding element %{public}@ to display layout publisher", (uint8_t *)&v3);
}

- (void)_removeElementForKey:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, a3, "removed pended element %@", (uint8_t *)&v3);
}

- (void)_removeTransitionForKey:(__CFString *)a1 .cold.1(__CFString *a1, NSObject *a2)
{
  int v4;
  uint64_t v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = -[__CFString isEqualToString:](a1, "isEqualToString:", CFSTR("__SBContinuityDisplayLayoutPublisherUnknownTransitionReason__"));
  v6 = CFSTR("nil");
  if (!v4)
    v6 = a1;
  v7 = 138412290;
  v8 = v6;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, v5, "Finished pended transition for reason %@", (uint8_t *)&v7);
}

@end
