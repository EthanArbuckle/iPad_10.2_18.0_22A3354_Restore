@implementation PBFApplicationStateNode

- (PBFApplicationStateNode)initWithDescription:(id)a3
{
  id v5;
  void *v6;
  PBFApplicationStateNode *v7;
  uint64_t v8;
  NSString *stateDescription;
  uint64_t v10;
  NSUUID *uniqueIdentifier;
  uint64_t v12;
  NSHashTable *observers;
  uint64_t v14;
  BSAtomicFlag *observerNotificationScheduled;
  PBFApplicationStateNode *result;
  void *v17;
  objc_super v18;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v18.receiver = self;
    v18.super_class = (Class)PBFApplicationStateNode;
    v7 = -[PBFApplicationStateNode init](&v18, sel_init);
    if (v7)
    {
      v8 = objc_msgSend(v6, "copy");
      stateDescription = v7->_stateDescription;
      v7->_stateDescription = (NSString *)v8;

      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v10 = objc_claimAutoreleasedReturnValue();
      uniqueIdentifier = v7->_uniqueIdentifier;
      v7->_uniqueIdentifier = (NSUUID *)v10;

      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v12 = objc_claimAutoreleasedReturnValue();
      observers = v7->_observers;
      v7->_observers = (NSHashTable *)v12;

      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
      observerNotificationScheduled = v7->_observerNotificationScheduled;
      v7->_observerNotificationScheduled = (BSAtomicFlag *)v14;

    }
    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("stateDescription"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFApplicationStateNode initWithDescription:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    result = (PBFApplicationStateNode *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[PBFApplicationStateNode cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)PBFApplicationStateNode;
  -[PBFApplicationStateNode dealloc](&v3, sel_dealloc);
}

- (NSSet)components
{
  PBFApplicationStateNode *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSSet copy](v2->_components, "copy");
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (void)setComponents:(id)a3
{
  id v4;
  PBFApplicationStateNode *v5;
  uint64_t v6;
  NSSet *components;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (-[NSSet isEqualToSet:](v5->_components, "isEqualToSet:", v4))
  {
    objc_sync_exit(v5);

  }
  else
  {
    v6 = objc_msgSend(v4, "copy");
    components = v5->_components;
    v5->_components = (NSSet *)v6;

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setDelegate:", v5, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    objc_sync_exit(v5);
    -[PBFApplicationStateNode _componentsDidUpdate](v5, "_componentsDidUpdate");
  }

}

- (void)updateByAddingComponent:(id)a3
{
  id v4;
  PBFApplicationStateNode *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSSet *components;
  id v12;

  v4 = a3;
  if (v4)
  {
    v12 = v4;
    v5 = self;
    objc_sync_enter(v5);
    if (-[NSSet containsObject:](v5->_components, "containsObject:", v12))
    {
      objc_sync_exit(v5);

    }
    else
    {
      objc_msgSend(v12, "setDelegate:", v5);
      v6 = (void *)-[NSSet mutableCopy](v5->_components, "mutableCopy");
      v7 = v6;
      if (v6)
        v8 = v6;
      else
        v8 = (id)objc_opt_new();
      v9 = v8;

      objc_msgSend(v9, "addObject:", v12);
      v10 = objc_msgSend(v9, "copy");
      components = v5->_components;
      v5->_components = (NSSet *)v10;

      objc_sync_exit(v5);
      -[PBFApplicationStateNode _componentsDidUpdate](v5, "_componentsDidUpdate");
    }
    v4 = v12;
  }

}

- (void)updateByRemovingComponent:(id)a3
{
  id v4;
  PBFApplicationStateNode *v5;
  void *v6;
  uint64_t v7;
  NSSet *components;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = self;
    objc_sync_enter(v5);
    if (-[NSSet containsObject:](v5->_components, "containsObject:", v9))
    {
      objc_msgSend(v9, "setDelegate:", 0);
      v6 = (void *)-[NSSet mutableCopy](v5->_components, "mutableCopy");
      objc_msgSend(v6, "removeObject:", v9);
      v7 = objc_msgSend(v6, "copy");
      components = v5->_components;
      v5->_components = (NSSet *)v7;

      objc_sync_exit(v5);
      -[PBFApplicationStateNode _componentsDidUpdate](v5, "_componentsDidUpdate");
    }
    else
    {
      objc_sync_exit(v5);

    }
    v4 = v9;
  }

}

- (void)addStateObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)removeStateObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_stateDescription, CFSTR("description"));
  -[PBFApplicationStateNode components](self, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v5, CFSTR("components"), 1);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)cancel
{
  NSHashTable *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = self->_observers;
  objc_sync_enter(v3);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "stateWasInvalidated:", self, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_componentsDidUpdate
{
  void *v3;
  _QWORD v4[5];

  if (-[BSAtomicFlag setFlag:](self->_observerNotificationScheduled, "setFlag:", 1))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFApplicationStateNode _componentsDidUpdate]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __47__PBFApplicationStateNode__componentsDidUpdate__block_invoke;
    v4[3] = &unk_1E86F2518;
    v4[4] = self;
    PBFDispatchAsyncWithString(v3, QOS_CLASS_DEFAULT, v4);

  }
}

void __47__PBFApplicationStateNode__componentsDidUpdate__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setFlag:", 0);
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  objc_msgSend(*(id *)(a1 + 32), "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "state:didUpdateComponents:", *(_QWORD *)(a1 + 32), v4, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (NSString)stateDescription
{
  return self->_stateDescription;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_stateDescription, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerNotificationScheduled, 0);
}

- (void)initWithDescription:(const char *)a1 .cold.1(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
