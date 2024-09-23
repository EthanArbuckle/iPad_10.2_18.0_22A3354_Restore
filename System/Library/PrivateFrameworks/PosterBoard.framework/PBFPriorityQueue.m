@implementation PBFPriorityQueue

- (PBFPriorityQueue)init
{
  PBFPriorityQueue *v2;
  uint64_t v3;
  NSMapTable *activeItemsForIdentifier;
  uint64_t v5;
  NSMapTable *priorityQueueForIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PBFPriorityQueue;
  v2 = -[PBFPriorityQueue init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    activeItemsForIdentifier = v2->_activeItemsForIdentifier;
    v2->_activeItemsForIdentifier = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    priorityQueueForIdentifier = v2->_priorityQueueForIdentifier;
    v2->_priorityQueueForIdentifier = (NSMapTable *)v5;

  }
  return v2;
}

- (unint64_t)numberOfEnqueuedItems
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMapTable objectEnumerator](self->_priorityQueueForIdentifier, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "count");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSSet)identifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[PBFPriorityQueue enqueuedIdentifiers](self, "enqueuedIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

  -[PBFPriorityQueue activeIdentifiers](self, "activeIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

  v6 = (void *)objc_msgSend(v3, "copy");
  return (NSSet *)v6;
}

- (NSSet)enqueuedIdentifiers
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[NSMapTable keyEnumerator](self->_priorityQueueForIdentifier, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = v4;
  else
    v6 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v2, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v7;
}

- (NSSet)activeIdentifiers
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[NSMapTable keyEnumerator](self->_activeItemsForIdentifier, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = v4;
  else
    v6 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v2, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v7;
}

- (void)removeAllEnqueuedItems
{
  -[NSMapTable removeAllObjects](self->_priorityQueueForIdentifier, "removeAllObjects");
}

- (void)removeAllActiveItems
{
  -[NSMapTable removeAllObjects](self->_activeItemsForIdentifier, "removeAllObjects");
}

- (unint64_t)numberOfEnqueuedUpItemsForIdentifier:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMapTable objectForKey:](self->_priorityQueueForIdentifier, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (unint64_t)numberOfActiveItemForIdentifier:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMapTable objectForKey:](self->_activeItemsForIdentifier, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (unint64_t)numberOfActiveItems
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMapTable objectEnumerator](self->_activeItemsForIdentifier, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "count");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEmpty
{
  return !-[NSMapTable count](self->_priorityQueueForIdentifier, "count")
      && -[NSMapTable count](self->_activeItemsForIdentifier, "count") == 0;
}

- (id)activeItemsForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NSMapTable objectForKey:](self->_activeItemsForIdentifier, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)enqueuedItemsForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[NSMapTable objectForKey:](self->_priorityQueueForIdentifier, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (void)enqueueItem:(id)a3 forIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMapTable objectForKey:](self->_priorityQueueForIdentifier, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_opt_new();
    -[NSMapTable setObject:forKey:](self->_priorityQueueForIdentifier, "setObject:forKey:", v7, v6);
  }
  objc_msgSend(v7, "addObject:", v8);

}

- (BOOL)removeEnqueuedItem:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;

  v6 = a3;
  v7 = a4;
  -[NSMapTable objectForKey:](self->_priorityQueueForIdentifier, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);
  if (v9)
  {
    objc_msgSend(v8, "removeObject:", v6);
    if (!objc_msgSend(v8, "count"))
      -[NSMapTable removeObjectForKey:](self->_priorityQueueForIdentifier, "removeObjectForKey:", v7);
  }

  return v9;
}

- (id)filterEnqueuedItemForIdentifier:(id)a3 passingTest:(id)a4
{
  id v6;
  NSMapTable *priorityQueueForIdentifier;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  priorityQueueForIdentifier = self->_priorityQueueForIdentifier;
  v8 = a4;
  -[NSMapTable objectForKey:](priorityQueueForIdentifier, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v9, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v12, "bs_filter:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v14 = v13;
  else
    v14 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v10, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "minusSet:", v15);
  if (!objc_msgSend(v9, "count"))
    -[NSMapTable removeObjectForKey:](self->_priorityQueueForIdentifier, "removeObjectForKey:", v6);
  v16 = (void *)objc_msgSend(v15, "copy");

  return v16;
}

- (BOOL)removeActiveItem:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;

  v6 = a3;
  v7 = a4;
  -[NSMapTable objectForKey:](self->_activeItemsForIdentifier, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);
  if (v9)
  {
    objc_msgSend(v8, "removeObject:", v6);
    if (!objc_msgSend(v8, "count"))
      -[NSMapTable removeObjectForKey:](self->_activeItemsForIdentifier, "removeObjectForKey:", v7);
  }

  return v9;
}

- (void)markItemActive:(id)a3 forIdentifier:(id)a4
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  -[NSMapTable objectForKey:](self->_activeItemsForIdentifier, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v12);

  if ((v9 & 1) != 0)
  {
LABEL_6:

    return;
  }
  if (-[PBFPriorityQueue removeEnqueuedItem:forIdentifier:](self, "removeEnqueuedItem:forIdentifier:", v12, v7))
  {
    -[NSMapTable objectForKey:](self->_activeItemsForIdentifier, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v10 = (void *)objc_opt_new();
      -[NSMapTable setObject:forKey:](self->_activeItemsForIdentifier, "setObject:forKey:", v10, v7);
    }
    objc_msgSend(v10, "addObject:", v12);

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[self removeEnqueuedItem:item forIdentifier:identifier]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[PBFPriorityQueue markItemActive:forIdentifier:].cold.1(a2, (uint64_t)self, (uint64_t)v11);
  objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (id)firstActiveItemForIdentifier:(id)a3 passingTest:(id)a4
{
  NSMapTable *activeItemsForIdentifier;
  id v6;
  void *v7;
  void *v8;

  activeItemsForIdentifier = self->_activeItemsForIdentifier;
  v6 = a4;
  -[NSMapTable objectForKey:](activeItemsForIdentifier, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_firstObjectPassingTest:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)sortItemsForIdentifier:(id)a3 usingComparator:(id)a4
{
  NSMapTable *priorityQueueForIdentifier;
  id v6;
  id v7;

  priorityQueueForIdentifier = self->_priorityQueueForIdentifier;
  v6 = a4;
  -[NSMapTable objectForKey:](priorityQueueForIdentifier, "objectForKey:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortUsingComparator:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeItemsForIdentifier, 0);
  objc_storeStrong((id *)&self->_priorityQueueForIdentifier, 0);
}

- (void)markItemActive:(uint64_t)a3 forIdentifier:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
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
  v15 = CFSTR("PBFPriorityQueue.m");
  v16 = 1024;
  v17 = 141;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1CB9FA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
